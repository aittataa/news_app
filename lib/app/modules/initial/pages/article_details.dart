import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_share/flutter_share.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";
import "package:news_app/app/config/translations/app_translation.dart";
import "package:news_app/app/data/models/articles.dart";
import "package:news_app/app/modules/initial/pages/initial_details.dart";
import "package:news_app/app/shared/scrolled_bar.dart";

import "../../../config/functions/app_function.dart";
import "../../../config/themes/app_theme.dart";
import "../../../shared/circle_spinner.dart";

class ArticleDetails extends StatefulWidget {
  final Article article;
  const ArticleDetails({super.key, required this.article});
  @override
  State<ArticleDetails> createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  final ScrollController scrollController = ScrollController();
  late Article article = Article();

  @override
  void initState() {
    article = widget.article;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppTheme.transparent_color,
        leading: Container(
          margin: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: AppTheme.back_color_2,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            iconSize: 25,
            padding: EdgeInsets.zero,
            color: AppTheme.main_color_1,
            splashColor: AppTheme.transparent_color,
            highlightColor: AppTheme.transparent_color,
            icon: const Icon(
              CupertinoIcons.back,
              color: AppTheme.main_color_1,
              size: 25,
            ),
          ),
        ),
        //title: Text("${article.title}"),
        /*actions: <Widget>[
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              color: AppTheme.back_color_3,
              borderRadius: BorderRadius.all(
                Radius.circular(7.5),
              ),
            ),
            child: IconButton(
              onPressed: () async {
                await FlutterShare.share(
                  title: "${article.title}",
                  linkUrl: "${article.url}",
                );
              },
              iconSize: 25,
              padding: EdgeInsets.zero,
              color: AppTheme.icon_color_2,
              splashColor: AppTheme.transparent_color,
              highlightColor: AppTheme.transparent_color,
              icon: const Icon(
                Icons.share_rounded,
                color: AppTheme.icon_color_2,
                size: 25,
              ),
            ),
          )
        ],*/
      ),
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: "${article.urlToImage}",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            placeholder: (_, String url) => const Center(child: CircleSpinner(size: 32)),
            errorWidget: (_, String value, dynamic value_2) => const Icon(CupertinoIcons.clear_circled_solid, color: AppTheme.red_color, size: 25),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  AppTheme.transparent_color,
                  AppTheme.transparent_color,
                  AppTheme.back_color_1,
                  AppTheme.back_color_1,
                ],
              ),
            ),
          ),
          ScrolledBar(
            controller: scrollController,
            child: SingleChildScrollView(
              controller: scrollController,
              reverse: true,
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ListTile(
                    dense: true,
                    minLeadingWidth: 0,
                    minVerticalPadding: 0,
                    horizontalTitleGap: 0,
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "${article.title}",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.visible,
                      style: GoogleFonts.poppins(
                        color: AppTheme.text_color_2,
                        fontWeight: FontWeight.w900,
                        letterSpacing: .5,
                        fontSize: 17.5,
                      ),
                    ),
                  ),
                  ListTile(
                    dense: true,
                    minLeadingWidth: 0,
                    minVerticalPadding: 0,
                    horizontalTitleGap: 0,
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "${article.source!.name}",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.visible,
                      style: GoogleFonts.poppins(
                        color: AppTheme.text_color_2,
                        fontWeight: FontWeight.bold,
                        letterSpacing: .5,
                      ),
                    ),
                    subtitle: Builder(builder: (_) {
                      final String date = AppFunction.dateFormat(article.publishedAt!);
                      return Text(
                        date,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.visible,
                        style: GoogleFonts.poppins(
                          color: AppTheme.text_color_3,
                          fontWeight: FontWeight.w500,
                          letterSpacing: .5,
                        ),
                      );
                    }),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            onPressed: () async {
                              await FlutterShare.share(
                                title: "${article.title}",
                                linkUrl: "${article.url}",
                              );
                            },
                            iconSize: 25,
                            padding: EdgeInsets.zero,
                            color: AppTheme.icon_color_2,
                            splashColor: AppTheme.transparent_color,
                            highlightColor: AppTheme.transparent_color,
                            tooltip: AppKeys.labelShareArticle.name.tr,
                            icon: const Icon(
                              Icons.share_rounded,
                              color: AppTheme.icon_color_2,
                              size: 25,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Get.to(() => InitialDetails(article: article));
                            },
                            iconSize: 25,
                            padding: EdgeInsets.zero,
                            color: AppTheme.icon_color_2,
                            splashColor: AppTheme.transparent_color,
                            highlightColor: AppTheme.transparent_color,
                            tooltip: AppKeys.labelOpenArticle.name.tr,
                            icon: const Icon(
                              Icons.logout_outlined,
                              color: AppTheme.icon_color_2,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    color: AppTheme.back_color_2,
                    thickness: 2,
                    height: 25,
                  ),
                  ListTile(
                    dense: true,
                    minLeadingWidth: 0,
                    minVerticalPadding: 0,
                    horizontalTitleGap: 0,
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "${article.description}",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.visible,
                      style: GoogleFonts.poppins(
                        color: AppTheme.text_color_2,
                        fontWeight: FontWeight.bold,
                        letterSpacing: .5,
                        fontSize: 15,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
