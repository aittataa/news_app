import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/cupertino.dart";
import "package:google_fonts/google_fonts.dart";
import "package:news_app/app/config/functions/app_function.dart";
import "package:news_app/app/data/models/articles.dart";

import "../../../config/constants/app_constant.dart";
import "../../../config/themes/app_theme.dart";
import "../../../shared/circle_spinner.dart";

class ArticleShape extends StatelessWidget {
  final Article article;
  const ArticleShape({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: AppTheme.back_color_2,
        borderRadius: AppConstant.borderRadius,
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
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          ClipRRect(
            borderRadius: AppConstant.borderRadius,
            child: CachedNetworkImage(
              imageUrl: "${article.urlToImage}",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              placeholder: (_, String url) => const Center(child: CircleSpinner(size: 32)),
              errorWidget: (_, String value, dynamic value_2) => const Icon(CupertinoIcons.clear_circled_solid, color: AppTheme.red_color, size: 25),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: AppConstant.borderRadius,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  // AppTheme.back_color_1,
                  // AppTheme.transparent_color,
                  AppTheme.transparent_color,
                  AppTheme.transparent_color,
                  AppTheme.back_color_1,
                  AppTheme.back_color_1,
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  "${article.title}",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: GoogleFonts.poppins(
                    color: AppTheme.text_color_2,
                    fontWeight: FontWeight.bold,
                    letterSpacing: .5,
                    fontSize: 17.5,
                  ),
                ),
                const SizedBox(height: 5),
                Builder(builder: (_) {
                  final DateTime publishedAt = article.publishedAt!;
                  late String date = AppFunction.dateFormat(publishedAt);
                  late String time = AppFunction.timeFormat(publishedAt);
                  return Text(
                    "$date, $time",
                    style: GoogleFonts.poppins(
                      color: AppTheme.text_color_3,
                      fontWeight: FontWeight.w600,
                      letterSpacing: .5,
                    ),
                  );
                }),
                const SizedBox(height: 5),
                Builder(builder: (_) {
                  if (article.author == null) return const SizedBox();
                  final String author = article.author!;
                  return Text(
                    "by : $author",
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      color: AppTheme.main_color_1,
                      fontWeight: FontWeight.w600,
                      letterSpacing: .5,
                    ),
                  );
                }),
              ],
            ),
          ),
          // const SizedBox(height: 5),
        ],
      ),
    );
  }
}
