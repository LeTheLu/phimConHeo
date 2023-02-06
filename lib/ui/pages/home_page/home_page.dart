import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie_db/common/app_images.dart';
import 'package:the_movie_db/network/api_util.dart';
import 'package:the_movie_db/ui/components/app_image_asset.dart';
import 'package:the_movie_db/ui/pages/example_page/example_page.dart';
import 'package:the_movie_db/ui/pages/home_page/home_cubit.dart';
import 'package:the_movie_db/ui/pages/home_page/home_state.dart';
import 'package:the_movie_db/ui/pages/list_movie_page/list_movie_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: const HomeChildPage(),
    );
  }
}

class HomeChildPage extends StatefulWidget {
  const HomeChildPage({Key? key}) : super(key: key);

  @override
  State<HomeChildPage> createState() => _HomeChildPageState();
}

class _HomeChildPageState extends State<HomeChildPage> with AutomaticKeepAliveClientMixin {
  late HomeCubit _homeCubit;
  final PageController _pageController = PageController();

  /// fake Data
  final List<Widget> _listPage = [
    const Center(
      child: ListMoviePage(
      ),
    ),
    const Center(
      child: ExamplePage(
        text: "Page 2",
      ),
    ),
    const Center(
      child: ExamplePage(
        text: "Page 3",
      ),
    ),
    const Center(
      child: ExamplePage(
        text: "Page 4",
      ),
    ),
    const Center(
      child: ExamplePage(
        text: "Page 5",
      ),
    )
  ];

  final List<Widget> _listItemBottomBar = [
    AppImageAsset(
      imagePath: AppImages.icHome,
      color: Colors.black,
    ),
    AppImageAsset(
      imagePath: AppImages.icFavorite,
      color: Colors.black,
    ),
    AppImageAsset(
      imagePath: AppImages.icTicket,
      color: Colors.black,
    ),
    AppImageAsset(
      imagePath: AppImages.icAccount,
      color: Colors.black,
    ),
    AppImageAsset(
      imagePath: AppImages.icShuffle,
      color: Colors.black,
    ),
  ];

  @override
  void initState() {
    _homeCubit = context.read<HomeCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      bottomNavigationBar: BlocConsumer<HomeCubit, HomeState>(
        bloc: _homeCubit,
        listenWhen: (previous, current) => previous.selectedIndex != current.selectedIndex,
        listener: (context, state) {
          _pageController.jumpToPage(state.selectedIndex);
        },
        buildWhen: (previous, current) {
          return previous.selectedIndex != current.selectedIndex;
        },
        builder: (context, state) {
          return CurvedNavigationBar(
            onTap: (index) {
              _homeCubit.switchPage(index);
            },
            backgroundColor: const Color(0xFF2B5876),
            height: 60,
            index: state.selectedIndex,
            items: _listItemBottomBar,
          );
        },
      ),
      body: PageView(
        onPageChanged: (index) {
          _homeCubit.switchPage(index);
        },
        controller: _pageController,
        children: _listPage,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
