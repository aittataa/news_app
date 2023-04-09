import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";
import "package:infinite_scroll_pagination/infinite_scroll_pagination.dart";
import "package:news_app/app/config/responses/app_response.dart";
import "package:news_app/app/data/models/articles.dart";
import "package:news_app/app/modules/initial/pages/article_details.dart";
import "package:news_app/app/modules/initial/widgets/article_shape.dart";
import "package:news_app/app/shared/scrolled_bar.dart";
import "package:shimmer/shimmer.dart";

import "../../../config/constants/app_constant.dart";
import "../../../config/themes/app_theme.dart";
import "../../../config/translations/app_translation.dart";
import "../../../shared/circle_spinner.dart";
import "../../../shared/empty_box.dart";
import "../controllers/initial_controller.dart";

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
  final int limit = 10;
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
        final int nextSkip = skip + 1;
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
        leadingWidth: 30,
        titleSpacing: 10,
        leading: Visibility(
          visible: searching,
          child: IconButton(
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
            icon: const Icon(
              CupertinoIcons.back,
              color: AppTheme.main_color_1,
              size: 25,
            ),
          ),
        ),
        title: Builder(builder: (_) {
          if (searching) {
            return SearchText(
              controller: searchController,
              onFieldSubmitted: (String value) {
                FocusScope.of(context).unfocus();
                if (searchController.text.isNotEmpty) {
                  query = value;
                } else {
                  query = "today";
                }
                pageController.refresh();
                setState(() {});
              },
            );
          } else {
            return Text(AppKeys.app_title.name.tr);
          }
        }),
        actions: <Widget>[
          Visibility(
            visible: !searching,
            child: IconButton(
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
              icon: const Icon(
                Icons.search,
                color: AppTheme.main_color_1,
                size: 25,
              ),
            ),
          )
        ],
      ),
      body: ScrolledBar(
        controller: scrollController,
        child: PagedListView<int, Article>(
          shrinkWrap: true,
          padding: const EdgeInsets.all(10),
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          scrollController: scrollController,
          pagingController: pageController,
          builderDelegate: PagedChildBuilderDelegate<Article>(
            animateTransitions: false,
            transitionDuration: Duration.zero,
            itemBuilder: (_, Article article, int i) {
              if (article.urlToImage == null) return const SizedBox();
              return GestureDetector(
                onTap: () => Get.to(() => ArticleDetails(article: article)),
                child: ArticleShape(article: article),
              );
            },
            firstPageProgressIndicatorBuilder: (_) => const _LoadBar(),
            newPageProgressIndicatorBuilder: (_) => const Padding(
              padding: EdgeInsets.all(10),
              child: Center(child: CircleSpinner(size: 32)),
            ),
            noMoreItemsIndicatorBuilder: (_) => const SizedBox(),
            noItemsFoundIndicatorBuilder: (_) => EmptyBox(label: AppKeys.labelNoNews.name.tr),
            firstPageErrorIndicatorBuilder: (_) => EmptyBox(label: AppKeys.labelNoNews.name.tr),
            newPageErrorIndicatorBuilder: (_) => EmptyBox(label: AppKeys.labelNoNews.name.tr),
          ),
        ),
      ),
    );
  }
}

class SearchText extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String)? onFieldSubmitted;
  const SearchText({
    super.key,
    this.controller,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onFieldSubmitted: onFieldSubmitted,
      style: GoogleFonts.poppins(
        color: AppTheme.text_color_2,
        fontWeight: FontWeight.bold,
        letterSpacing: .5,
      ),
      autofocus: true,
      autocorrect: true,
      scrollPadding: EdgeInsets.zero,
      cursorColor: AppTheme.text_color_2,
      textInputAction: TextInputAction.search,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        border: const OutlineInputBorder(
          borderRadius: AppConstant.borderRadius,
          borderSide: BorderSide.none,
        ),
        hintText: AppKeys.labelSearch.name.tr,
        filled: true,
        fillColor: AppTheme.back_color_3,
        hintStyle: GoogleFonts.poppins(
          color: AppTheme.text_color_2.withOpacity(.75),
          fontWeight: FontWeight.bold,
          letterSpacing: .5,
        ),
        errorStyle: GoogleFonts.poppins(
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
            height: 300,
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppTheme.transparent_color,
              borderRadius: AppConstant.borderRadius,
              border: AppConstant.border,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppTheme.main_color_1,
                      borderRadius: AppConstant.borderRadius,
                      border: AppConstant.border,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
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
                const SizedBox(height: 5),
                Container(
                  height: 40,
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
              ],
            ),
          );
        },
      ),
    );
  }
}
