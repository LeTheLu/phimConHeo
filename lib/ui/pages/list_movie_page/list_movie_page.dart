import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:the_movie_db/common/app_images.dart';
import 'package:the_movie_db/models/entity/button_app/button_app.dart';
import 'package:the_movie_db/models/entity/result_entity/result_entity.dart';
import 'package:the_movie_db/models/enum/status_enum.dart';
import 'package:the_movie_db/network/api_client.dart';
import 'package:the_movie_db/ui/components/app_cache_image.dart';
import 'package:the_movie_db/ui/components/app_circular_progress_indicator.dart';
import 'package:the_movie_db/ui/components/button_app_widget.dart';
import 'package:the_movie_db/ui/components/dot_indicator_widget.dart';
import 'package:the_movie_db/ui/components/text_widget.dart';
import 'package:the_movie_db/ui/pages/detail_film_page/detail_film_page.dart';
import 'package:the_movie_db/ui/pages/list_movie_page/list_movie_cubit.dart';

class ListMoviePage extends StatelessWidget {
  const ListMoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListMovieCubit(apiClient: RepositoryProvider.of<ApiClient>(context)),
      child: const ListMovieChildPage(),
    );
  }
}

class ListMovieChildPage extends StatefulWidget {
  const ListMovieChildPage({super.key});

  @override
  State<ListMovieChildPage> createState() => _ListMovieChildPageState();
}

class _ListMovieChildPageState extends State<ListMovieChildPage> {
  late ListMovieCubit _listMovieCubit;
  final SwiperController _swiperController = SwiperController();

  final List<ButtonApp> _listButtonApp = [
    ButtonApp(AppImages.icGrid, 'Genres'),
    ButtonApp(AppImages.icTvSeries, 'TV series'),
    ButtonApp(AppImages.icMovieRoll, 'Movies'),
    ButtonApp(AppImages.icCinema, 'In Theatre'),
  ];

  @override
  void initState() {
    _listMovieCubit = context.read<ListMovieCubit>();
    super.initState();
    _listMovieCubit.initData();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        child: _bodyApp(),
      ),
    );
  }

  Widget _bodyApp() {
    return Container(
      height: MediaQuery.of(context).size.height - 60,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xFF2B5876),
          Color(0xFF4E4376),
        ], begin: Alignment.centerLeft, end: Alignment.centerRight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(),
          const SizedBox(
            height: 20,
          ),
          _searchBar(),
          const SizedBox(
            height: 20,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextWidget(
                text: 'Most Popular',
                fontSize: 18,
                fontWeight: FontWeight.w700,
              )),
          const SizedBox(
            height: 20,
          ),
          _mostPopular(),
          const SizedBox(height: 15),
          _buttonApp(),
          const SizedBox(
            height: 20,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextWidget(
                text: 'Upcoming releases',
                fontSize: 18,
                fontWeight: FontWeight.w700,
              )),
          const SizedBox(
            height: 15,
          ),
          _releases(),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  Widget _releases() {
    return BlocBuilder<ListMovieCubit, ListMovieState>(
      bloc: _listMovieCubit,
      buildWhen: (previous, current) =>
          previous.loadUpcomingMovieStatus != current.loadUpcomingMovieStatus ||
          previous.selectedIndexUpcoming != current.selectedIndexUpcoming,
      builder: (context, state) {
        return state.loadUpcomingMovieStatus == StatusEnum.success
            ? Column(
                children: [
                  SizedBox(
                    height: 0.23 * MediaQuery.of(context).size.height,
                    child: Swiper(
                      scrollDirection: Axis.horizontal,
                      loop: true,
                      onIndexChanged: (index) {
                        _listMovieCubit.switchUpcomingDotIndicators(index);
                      },
                      autoplay: true,
                      fade: 0.3,
                      viewportFraction: 0.45,
                      itemBuilder: (BuildContext context, int index) {
                        return _itemListReleases(state.upcomingMovieEntity?.results?[index] ?? ResultEntity());
                      },
                      itemCount: state.upcomingMovieEntity?.results?.length ?? 0,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: DotIndicatorWidget(
                    dotsCount: state.upcomingMovieEntity?.results?.length ?? 1,
                    size: 9,
                    position: (state.selectedIndexUpcoming ?? 0).toDouble(),
                    spacing: 3,
                  )),
                ],
              )
            : SizedBox(
                height: 0.17 * MediaQuery.of(context).size.height,
                child: const Center(
                  child: AppCircularProgressIndicator(),
                ),
              );
      },
    );
  }

  Widget _buttonApp() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: SizedBox(
        height: 85,
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return _itemListButton(_listButtonApp[index]);
          },
        ),
      ),
    );
  }

  Widget _mostPopular() {
    return BlocBuilder<ListMovieCubit, ListMovieState>(
      bloc: _listMovieCubit,
      buildWhen: (previous, current) =>
          previous.loadPopularMovieStatus != current.loadPopularMovieStatus ||
          previous.selectedIndexMostPopular != current.selectedIndexMostPopular,
      builder: (context, state) {
        return state.loadPopularMovieStatus == StatusEnum.success
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: 0.15 * MediaQuery.of(context).size.height,
                      child: Swiper(
                        controller: _swiperController,
                        onIndexChanged: (index) {
                          _listMovieCubit.switchMostPopularDotIndicators(index);
                        },
                        loop: true,
                        fade: 0.3,
                        autoplay: true,
                        viewportFraction: 0.8,
                        scale: 0.8,
                        itemBuilder: (BuildContext context, int index) {
                          return _itemListPoster(
                              state.mostPopularMovieEntity?.results?[index] ??
                                  ResultEntity());
                        },
                        itemCount:
                            state.mostPopularMovieEntity?.results?.length ?? 0,
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: DotIndicatorWidget(
                      dotsCount:
                          state.mostPopularMovieEntity?.results?.length ?? 0,
                      size: 9,
                      position:
                          (state.selectedIndexMostPopular ?? 0).toDouble(),
                      spacing: 3,
                    ),
                  ),
                ],
              )
            : SizedBox(
                height: 0.17 * MediaQuery.of(context).size.height,
                child: const Center(
                  child: AppCircularProgressIndicator(),
                ),
              );
      },
    );
  }

  Widget _searchBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      padding: const EdgeInsets.all(15),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color(0x33FFFFFF),
        ),
        gradient: const LinearGradient(
          colors: [
            Color(0x4D6B66A6),
            Color(0x4D75D1DD),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(children: [
        Flexible(
          flex: 17,
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Search',
              labelStyle: const TextStyle(
                  color: Color(0x80FFFFFF),
                  fontSize: 18,
                  fontFamily: 'BeVietNamPro',
                  fontWeight: FontWeight.w500),
              border: const OutlineInputBorder(borderSide: BorderSide.none),
              prefixIcon: Image.asset('assets/images/ic_search.png'),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            height: 35,
            width: 1,
            color: const Color(0x33FFFFFF),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Flexible(
          flex: 1,
          child: Image.asset(
            'assets/images/ic_micro.png',
            height: 20,
            width: 15,
          ),
        ),
      ]),
    );
  }

  Widget _title() {
    return Padding(
      padding: const EdgeInsets.only(top: 65, right: 65, left: 65),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(
            text: 'Hello, Jane!',
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
          Image.asset(
            'assets/images/ic_bell.png',
            height: 25,
            width: 25,
          ),
        ],
      ),
    );
  }

  Widget _itemListReleases(ResultEntity resultEntity) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailFilmPage(
              movieID: resultEntity.id.toString(),
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: AspectRatio(
          aspectRatio: 145 / 215,
          child: AppCacheImage(
            url: resultEntity.posterUrl,
            connerRadius: 30,
          ),
        ),
      ),
    );
  }

  Widget _itemListButton(ButtonApp buttonApp) {
    return ButtonAppWidget(
        image: buttonApp.image, buttonName: buttonApp.buttonName);
  }

  Widget _itemListPoster(ResultEntity resultEntity) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailFilmPage(
              movieID: resultEntity.id.toString(),
            ),
          ),
        );
      },
      child: AppCacheImage(
        connerRadius: 30,
        url: resultEntity.backdropUrl,
      ),
    );
  }
}
