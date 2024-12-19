import 'package:flutter/material.dart';
import 'package:movie_app/api/api_const.dart';
import 'package:movie_app/common/app_colors.dart';
import 'package:movie_app/movies/model_view/movies_details_model.dart';
class MovieDetailsVeiw extends StatefulWidget {
  const MovieDetailsVeiw({
    super.key,
    required this.detailsModel,
  });
  final MoviesDetailsModel detailsModel;

  @override
  State<MovieDetailsVeiw> createState() => _MovieDetailsVeiwState();
}

class _MovieDetailsVeiwState extends State<MovieDetailsVeiw> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          ApiConsts.imageUrl + (widget.detailsModel.backdropPath ?? ""),
          fit: BoxFit.fill,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.detailsModel.originalTitle ?? "",
                style: Theme.of(context).textTheme.titleMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(
               widget.detailsModel.releaseDate??'' ,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w300),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width * 0.35,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: Colors.transparent,
                        image: DecorationImage(
                            image: NetworkImage(ApiConsts.imageUrl +
                                (widget.detailsModel.posterPath ?? "")),
                            fit: BoxFit.fill)),),
                 
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text(
                          '''${widget.detailsModel.overview}''',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.w200,
                                  ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.star,
                              color: AppColors.goldenColor,
                              size: MediaQuery.of(context).size.width * 0.08,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                widget.detailsModel.voteAverage.toString(),
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ))
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                child: ListView.builder(
                  itemCount: widget.detailsModel.genres?.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color:Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        widget.detailsModel.genres?[index].name ?? "",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}