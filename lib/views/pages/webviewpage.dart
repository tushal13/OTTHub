import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';
import '../../controller/bookmark.dart';
import '../../controller/webviewcontrollre.dart';
import '../../models/ottplatform.dart';

class PlatformWebViewPage extends StatefulWidget {
  PlatformWebViewPage({
    Key? key,
  }) : super(key: key);

  @override
  State<PlatformWebViewPage> createState() => _PlatformWebViewPageState();
}

class _PlatformWebViewPageState extends State<PlatformWebViewPage> {
  String? currentUrl;
  PullToRefreshController? refreshController;

  @override
  void initState() {
    super.initState();
    refreshController = PullToRefreshController(
      onRefresh: () {
        Provider.of<WebViewController>(context).webViewController!.reload();
      },
      options: PullToRefreshOptions(color: Colors.blue),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WebViewController>(
      builder: (context, provider, _) {
        OTTPlatform platform =
            ModalRoute.of(context)!.settings.arguments as OTTPlatform;
        return SafeArea(
          child: WillPopScope(
            onWillPop: () async {
              bool willpop =
                  await Provider.of<WebViewController>(context, listen: false)
                      .webViewController!
                      .canGoBack();

              if (willpop) {
                Provider.of<WebViewController>(context, listen: false)
                    .webViewController!
                    .goBack();
              }
              return !willpop;
            },
            child: Scaffold(
              appBar: AppBar(
                title: Text(platform.name),
                centerTitle: true,
                elevation: 0,
                actions: [
                  Visibility(
                    visible: provider.canGoBack,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (provider.canGoBack) {
                            provider.webViewController!.goBack();
                          }
                        });
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      final bookmarkProvider =
                          Provider.of<BookmarkProvider>(context, listen: false);

                      if (currentUrl != null &&
                          !bookmarkProvider.isBookmarked(currentUrl!)) {
                        bookmarkProvider.addBookmark(currentUrl!);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Center(
                              child: Text(
                                'Website bookmarked!...',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            backgroundColor: Colors.black,
                            width: 200,
                            behavior: SnackBarBehavior.floating,
                            elevation: 80,
                            duration: Duration(milliseconds: 800),
                          ),
                        );
                      }
                      print("Current URL: $currentUrl");
                    },
                    icon: Icon(Icons.bookmark_add_outlined),
                  ),
                  IconButton(
                    onPressed: () {
                      provider.webViewController!.reload();
                    },
                    icon: Icon(Icons.refresh),
                  ),
                  Visibility(
                    visible: provider.canGoForward,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (provider.canGoForward) {
                            provider.webViewController!.goForward();
                          }
                        });
                      },
                      icon: Icon(Icons.arrow_forward),
                    ),
                  ),
                ],
              ),
              body: RefreshIndicator(
                onRefresh: () async {
                  provider.webViewController!.reload();
                },
                child: InAppWebView(
                  initialUrlRequest:
                      URLRequest(url: Uri.parse(platform.defaultWebLink)),
                  pullToRefreshController: refreshController,
                  onWebViewCreated: (controller) {
                    provider.setWebViewController(controller);
                  },
                  onLoadStart: (controller, url) {
                    provider.canGoBack = false;
                    provider.canGoForward = false;
                    provider.isLoading = true;
                    currentUrl = url.toString();
                  },
                  onLoadStop: (controller, url) {
                    setState(() {
                      currentUrl = url!.toString();
                      provider.setloadstop(controller, platform.defaultWebLink);
                      refreshController!.endRefreshing();
                    });
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
