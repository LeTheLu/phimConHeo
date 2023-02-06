import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';
import 'package:the_movie_db/models/entity/cast_entity/cast_entity.dart';
import 'package:the_movie_db/models/entity/genre_entity/genre_entity.dart';
import 'package:the_movie_db/models/enum/status_enum.dart';
import 'package:the_movie_db/network/api_client.dart';
import 'package:the_movie_db/ui/components/actor_widget.dart';
import 'package:the_movie_db/ui/components/app_cache_image.dart';
import 'package:the_movie_db/ui/components/app_circular_progress_indicator.dart';
import 'package:the_movie_db/ui/components/text_widget.dart';
import 'package:the_movie_db/ui/pages/detail_film_page/detail_film_cubit.dart';
import 'package:the_movie_db/ui/pages/detail_film_page/detail_film_state.dart';

/// tại sao chỗ này cần tạo StatelessWidget gián tiếp?
/// trả lời chỗ này cho anh chú sẽ hiểu được là tại sao có cái cần khai báo ở main có cái cần khai bao như này!
class DetailFilmPage extends StatelessWidget {
  final String movieID;

  const DetailFilmPage({Key? key, required this.movieID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailFilmCubit(apiClient: RepositoryProvider.of<ApiClient>(context)),
      child: DetailFilmChildPage(movieID: movieID),
    );
  }
}

class DetailFilmChildPage extends StatefulWidget {
  final String movieID;

  const DetailFilmChildPage({super.key, required this.movieID});

  @override
  State<DetailFilmChildPage> createState() => _DetailFilmChildPageState();
}

class _DetailFilmChildPageState extends State<DetailFilmChildPage> {
  late DetailFilmCubit _detailFilmCubit;

  @override
  void initState() {
    _detailFilmCubit = context.read<DetailFilmCubit>();
    super.initState();
    _detailFilmCubit.initData(movieID: widget.movieID);
  }
  @override
  void dispose() {
    _detailFilmCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: _imageBackground(),
          ),
          _bottomInfo(),
          Positioned(
            top: 55,
            left: 50,
            child: _iconBack(),
          ),
        ],
      ),
    );
  }

  Widget _bottomInfo() {
    return SingleChildScrollView(
      child: BlocBuilder<DetailFilmCubit, DetailFilmState>(
        bloc: _detailFilmCubit,
        buildWhen: (previous, current) => previous.loadDetailFilmStatus != current.loadDetailFilmStatus,
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 1.6),
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height / 2.6,
            ),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [
                Color(0xFF2B5876),
                Color(0xFF4E4376),
              ], end: Alignment.centerRight, begin: Alignment.centerLeft),
              border: Border.all(
                color: const Color(0x4DFFFFFF),
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                TextWidget(text: state.detailFilmEntity?.title ?? '', fontWeight: FontWeight.w700, fontSize: 18),
                const SizedBox(
                  height: 30,
                ),
                _infoView(),
                const SizedBox(
                  height: 20,
                ),
                _filmDescription(),
                const SizedBox(
                  height: 20,
                ),
                _actor(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _iconBack() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Image.asset(
        'assets/images/ic_back.png',
        height: 25,
        width: 25,
      ),
    );
  }

  Widget _imageBackground() {
    return BlocBuilder<DetailFilmCubit, DetailFilmState>(
      bloc: _detailFilmCubit,
      buildWhen: (previous, current) => previous.loadDetailFilmStatus != current.loadDetailFilmStatus,
      builder: (context, state) {
        return state.loadDetailFilmStatus == StatusEnum.success
            ? AppCacheImage(
                url: state.detailFilmEntity?.posterUrl ?? '',
                width: MediaQuery.of(context).size.width,
                height: 0.7 * MediaQuery.of(context).size.height,
              )
            : const AppCircularProgressIndicator();
      },
    );
  }

  Widget _actor() {
    return Column(children: [
      Row(
        children: [
          Expanded(
              child: TextWidget(
            text: 'Cast',
            fontWeight: FontWeight.w700,
            fontSize: 18,
          )),
          TextWidget(text: 'See All', fontWeight: FontWeight.w500, fontSize: 15),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      SizedBox(
        height: 100,
        child: BlocBuilder<DetailFilmCubit, DetailFilmState>(
          bloc: _detailFilmCubit,
          buildWhen: (previous, current) => previous.loadCreditsFilmStatus != current.loadCreditsFilmStatus,
          builder: (context, state) {
            return ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return _itemActor(state.creditsEntity?.cast?[index] ?? CastEntity());
              },
            );
          },
        ),
      )
    ]);
  }

  Widget _itemActor(CastEntity castEntity) {
    return ActorWidget(
        url: castEntity.getProfilePath, name: castEntity.name ?? '', nameCharacter: castEntity.character ?? '');
  }

  Widget _filmDescription() {
    return BlocBuilder<DetailFilmCubit, DetailFilmState>(
      bloc: _detailFilmCubit,
      buildWhen: (previous, current) => previous.loadDetailFilmStatus != current.loadDetailFilmStatus,
      builder: (context, state) {
        return ReadMoreText(
          state.detailFilmEntity?.overview ?? 'No Description',
          trimLines: 3,
          colorClickableText: Colors.blue,
          textAlign: TextAlign.justify,
          style: const TextStyle(
              color: Colors.white, fontFamily: 'BeVietNamPro', fontSize: 12, fontWeight: FontWeight.w500),
          trimMode: TrimMode.Line,
          trimCollapsedText: 'More',
          trimExpandedText: 'Less',
          moreStyle: const TextStyle(
              fontFamily: 'BeVietNamPro', fontSize: 12, color: Colors.blue, fontWeight: FontWeight.w500),
        );
      },
    );
  }

  Widget _infoView() {
    return BlocBuilder<DetailFilmCubit, DetailFilmState>(
      bloc: _detailFilmCubit,
      buildWhen: (previous, current) => previous.loadDetailFilmStatus != current.loadDetailFilmStatus,
      builder: (context, state) {
        return Row(
          children: [
            SizedBox(
              height: 25,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 1,
                itemBuilder: (context, index) =>
                    _itemGenres(state.detailFilmEntity?.genres?[index] ?? GenreEntity(name: 'Loading')),
                separatorBuilder: (context, index) => const SizedBox(width: 5),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              height: 25,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: const Color(0xFFF5C518)),
              child: Center(
                child: TextWidget(
                  text: state.detailFilmEntity?.voteAverage != null
                      ? 'IMDB ${(state.detailFilmEntity?.voteAverage).toString().substring(0, 3)}'
                      : 'Loading',
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            Image.asset(
              'assets/images/ic_share.png',
              width: 20,
              height: 25,
            ),
            const SizedBox(
              width: 10,
            ),
            Image.asset(
              'assets/images/ic_favorite.png',
              width: 25,
              height: 25,
            )
          ],
        );
      },
    );
  }

  Widget _itemGenres(GenreEntity genreEntity) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(
          colors: [Color(0x4DA6A1E0), Color(0x4DA1F3FE)],
          end: Alignment.centerRight,
          begin: Alignment.centerLeft,
        ),
      ),
      child: TextWidget(
        text: genreEntity.name ?? '',
        fontSize: 12,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
