import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_share/flutter_share.dart";
import "package:news_app/app/data/models/articles.dart";
import "package:news_app/app/shared/circle_spinner.dart";
import "package:news_app/app/shared/scrolled_bar.dart";
import "package:webview_flutter/webview_flutter.dart";

import "../../../config/themes/app_theme.dart";

class InitialDetails extends StatefulWidget {
  final Article article;
  const InitialDetails({super.key, required this.article});
  @override
  State<InitialDetails> createState() => _InitialDetailsState();
}

class _InitialDetailsState extends State<InitialDetails> {
  final ScrollController scrollController = ScrollController();
  late WebViewController viewController = WebViewController();
  late Article article = Article();
  late bool loading = true;

  @override
  void initState() {
    article = widget.article;
    super.initState();
    getArticle();
  }

  Future<void> getArticle() async {
    viewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(AppTheme.transparent_color)
      ..setNavigationDelegate(
        NavigationDelegate(
          onWebResourceError: (WebResourceError error) {},
          onPageStarted: (String finish) {
            setState(() => <void>{loading = true});
          },
          onPageFinished: (String finish) {
            setState(() => <void>{loading = false});
          },
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse("${article.url}"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          iconSize: 25,
          padding: EdgeInsets.zero,
          color: AppTheme.icon_color_2,
          splashColor: AppTheme.transparent_color,
          highlightColor: AppTheme.transparent_color,
          icon: const Icon(
            CupertinoIcons.back,
            color: AppTheme.icon_color_2,
            size: 25,
          ),
        ),
        title: Text("${article.title}"),
        actions: <Widget>[
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
            icon: const Icon(
              Icons.share_rounded,
              color: AppTheme.icon_color_2,
              size: 25,
            ),
          )
        ],
      ),
      body: ScrolledBar(
        controller: scrollController,
        child: Builder(
          builder: (_) {
            if (loading) return const Center(child: CircleSpinner(size: 64));
            return WebViewWidget(controller: viewController);
          },
        ),
      ),
    );
  }
}
