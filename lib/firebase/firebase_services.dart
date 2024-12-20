

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/movies/model_view/movies_model_firebase.dart';
import 'package:movie_app/movies/model_view/user_model.dart';


class FirebaseServices{
    static CollectionReference<MoviesModelFirebase> getCollection() => getUserCollection()
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('watchList')
      .withConverter<MoviesModelFirebase>(
          fromFirestore: (snapshot, _) =>
              MoviesModelFirebase.fromJson(snapshot.data() ?? {}),
          toFirestore: (value, _) => value.toJson());
  static CollectionReference<UserModel> getUserCollection() =>
      FirebaseFirestore.instance.collection('users').withConverter<UserModel>(
          fromFirestore: (snapshot, _) =>
              UserModel.fromJson(snapshot.data() ?? {}),
          toFirestore: (value, _) => value.toJson());
  static Stream<List<MoviesModelFirebase>> getWatchList() async* {
    CollectionReference<MoviesModelFirebase> collection = getCollection();
    Stream<QuerySnapshot<MoviesModelFirebase>> query = collection.snapshots();
    Stream<List<MoviesModelFirebase>> data =
        query.map((event) => event.docs.map((e) => e.data()).toList());
    yield* data;
  }
      


 static Future<UserModel?> login(String email, String password) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    return getUser();
  }
   static Future<UserModel?> getUser() async {
    DocumentSnapshot<UserModel> documentSnapshot = await getUserCollection()
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    return documentSnapshot.data();
  }
   static Future<UserModel> signup(UserModel userModel, String password) async {
    UserCredential credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: userModel.email!, password: password);
    userModel.id = credential.user?.uid;
    await createUser(userModel);
    return userModel;
  }
    static Future<void> createUser(UserModel userModel) async {
    return await getUserCollection().doc(userModel.id).set(userModel);
  }

    static Future<bool> existMovie(String id) async {
    final collection = getCollection();
    final movieId = id;
    final existingMovie = await collection.doc(movieId.toString()).get();
    if (existingMovie.exists) {
      return true;
    }
    return false;
  }
    static Future<void> addMovieWatchList(MoviesModelFirebase movie) async {
    final collection = getCollection();
    if (!await existMovie(movie.results.id.toString())) {
      await collection.doc(movie.results.id.toString()).set(movie);
    }
  }
    static Future<void> deleteMovieWatchList(MoviesModelFirebase movie) {
    CollectionReference<MoviesModelFirebase> collection = getCollection();
    return collection.doc(movie.results.id.toString()).delete();
  }
}