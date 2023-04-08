import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:infinite_scroll_pagination/infinite_scroll_pagination.dart";
import "package:news_app/app/config/responses/app_response.dart";
import "package:news_app/app/data/models/articles.dart";
import "package:news_app/app/shared/scrolled_bar.dart";
import "package:shimmer/shimmer.dart";

import "../../../config/constants/app_constant.dart";
import '../../../config/themes/app_theme.dart';
import '../../../config/translations/app_translation.dart';
import "../../../shared/circle_spinner.dart";
import "../../../shared/empty_box.dart";
import '../controllers/initial_controller.dart';

class InitialView extends StatefulWidget {
  const InitialView({super.key});
  @override
  State<InitialView> createState() => _InitialViewState();
}

class _InitialViewState extends State<InitialView> {
  final InitialController controller = Get.put(InitialController());
  final ScrollController scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();
  final PagingController<int, Article> pageController = PagingController<int, Article>(firstPageKey: 1);

  @override
  void initState() {
    pageController.addPageRequestListener((int skip) {
      getNews(skip);
    });
    super.initState();
  }

  /// TODO : Get News
  final int limit = 25;
  late List<Article> _articles = const <Article>[];
  Future<void> getNews(int skip) async {
    try {
      final AppResponse response = await controller.getNews(query, limit, skip);
      final Articles data = response.response;
      _articles = data.articles;
      final bool state = _articles.length < limit;
      if (state) {
        pageController.appendLastPage(_articles);
      } else {
        final int nextSkip = skip + _articles.length;
        pageController.appendPage(_articles, nextSkip);
      }
    } catch (error) {
      pageController.error = error;
    }
  }

  late bool visible = true;
  late bool searching = false;
  late String query = "today";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Builder(builder: (_) {
          if (searching) {
            return SearchText(
              controller: searchController,
              onTap: () {
                FocusScope.of(context).unfocus();
                query = searchController.text;
                pageController.refresh();
                setState(() {});
              },
              onFieldSubmitted: (String value) {
                FocusScope.of(context).unfocus();
                query = value;
                pageController.refresh();
                setState(() {});
              },
            );
          } else {
            return Text(AppKeys.app_title.name.tr);
          }
        }),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              query = "today";
              searchController.clear();
              searching = !searching;
              setState(() {});
            },
            iconSize: 25,
            padding: EdgeInsets.zero,
            color: AppTheme.icon_color_2,
            splashColor: AppTheme.transparent_color,
            highlightColor: AppTheme.transparent_color,
            icon: Icon(
              searching ? Icons.clear : Icons.search,
              color: AppTheme.icon_color_2,
              size: 25,
            ),
          )
        ],
      ),
      body: ScrolledBar(
        controller: scrollController,
        child: PagedListView<int, Article>(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          scrollController: scrollController,
          pagingController: pageController,
          builderDelegate: PagedChildBuilderDelegate<Article>(
            animateTransitions: false,
            transitionDuration: Duration.zero,
            itemBuilder: (_, Article product, int i) {
              return GestureDetector(
                onTap: () {
                  //Get.to(() => DetailsView(product: product));
                },
                child: Container(
                  height: 250,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: AppTheme.back_color_2,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    border: Border.all(
                      color: AppTheme.border_color.withOpacity(.5),
                      width: .75,
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: AppTheme.shadow_color.withOpacity(.1),
                        spreadRadius: .1,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      Expanded(child: Container(color: Colors.red)),
                      Expanded(child: Container(color: Colors.blue)),
                    ],
                  ),
                ),
              );
            },
            firstPageProgressIndicatorBuilder: (_) => const _LoadBar(),
            newPageProgressIndicatorBuilder: (_) => const Padding(
              padding: EdgeInsets.all(10),
              child: Center(child: CircleSpinner(size: 32)),
            ),
            noItemsFoundIndicatorBuilder: (_) => EmptyBox(label: "${AppKeys.labelNoNews.name.tr} 1"),
            noMoreItemsIndicatorBuilder: (_) => const SizedBox(),
            firstPageErrorIndicatorBuilder: (_) => EmptyBox(label: "${AppKeys.labelNoNews.name.tr} 2"),
            newPageErrorIndicatorBuilder: (_) => EmptyBox(label: "${AppKeys.labelNoNews.name.tr} 3"),
          ),
        ),
      ),
    );
  }
}

class SearchText extends StatelessWidget {
  final TextEditingController? controller;
  final void Function()? onTap;
  final void Function(String)? onFieldSubmitted;
  const SearchText({
    super.key,
    this.controller,
    this.onTap,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      controller: controller,
      style: const TextStyle(
        color: AppTheme.text_color_2,
        fontWeight: FontWeight.bold,
        letterSpacing: .5,
      ),
      autofocus: true,
      autocorrect: true,
      scrollPadding: EdgeInsets.zero,
      cursorColor: AppTheme.text_color_2,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        border: InputBorder.none,
        hintText: AppKeys.labelSearch.name.tr,
        hintStyle: TextStyle(
          color: AppTheme.text_color_2.withOpacity(.75),
          fontWeight: FontWeight.bold,
          letterSpacing: .5,
        ),
        errorStyle: const TextStyle(
          color: AppTheme.red_color,
          fontWeight: FontWeight.bold,
          letterSpacing: .5,
        ),
      ),
    );
  }
}

class _LoadBar extends StatelessWidget {
  const _LoadBar();
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppTheme.main_color_1.withOpacity(.25),
      highlightColor: AppTheme.main_color_1.withOpacity(.5),
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (_, int i) {
          return Container(
            height: 100,
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppTheme.transparent_color,
              borderRadius: AppConstant.borderRadius,
              border: AppConstant.border,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppTheme.main_color_1,
                      borderRadius: const BorderRadius.horizontal(left: Radius.circular(AppConstant.radius)),
                      border: AppConstant.border,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          height: 35,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: AppTheme.transparent_color,
                            borderRadius: AppConstant.borderRadius,
                            border: AppConstant.border,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppTheme.main_color_1,
                              borderRadius: AppConstant.borderRadius,
                              border: AppConstant.border,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  height: 35,
                                  //width: 100,
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: AppTheme.transparent_color,
                                    borderRadius: AppConstant.borderRadius,
                                    border: AppConstant.border,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppTheme.main_color_1,
                                      borderRadius: AppConstant.borderRadius,
                                      border: AppConstant.border,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Container(
                                  height: 35,
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: AppTheme.transparent_color,
                                    borderRadius: AppConstant.borderRadius,
                                    border: AppConstant.border,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppTheme.main_color_1,
                                      borderRadius: AppConstant.borderRadius,
                                      border: AppConstant.border,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
