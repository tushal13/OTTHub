import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/bookmark.dart';
import '../../controller/cacrousel.dart';
import '../../controller/webviewcontrollre.dart';
import '../../models/ottplatform.dart';

class OTTHomePage extends StatefulWidget {
  const OTTHomePage({Key? key}) : super(key: key);

  @override
  State<OTTHomePage> createState() => _OTTHomePageState();
}

class _OTTHomePageState extends State<OTTHomePage> {
  Connectivity isconnected = Connectivity();
  bool hasInternetConnection = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<WebViewController>(
      builder: (context, provider, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("OTT HUB"),
            centerTitle: true,
            elevation: 0,
          ),
          body: StreamBuilder(
            stream: isconnected.onConnectivityChanged,
            builder: (context, snapShot) {
              if (snapShot.hasData) {
                Future.delayed(Duration(milliseconds: 2000), () {
                  setState(() {
                    hasInternetConnection = true;
                  });
                });
                ConnectivityResult result = snapShot.data!;
                if (result == ConnectivityResult.none) {
                  Future.delayed(Duration(milliseconds: 2000), () {
                    setState(() {
                      hasInternetConnection = false;
                    });
                  });
                  return Center(
                    child: hasInternetConnection
                        ? Center(child: CircularProgressIndicator())
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'No Internet Connection Found',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                  );
                }
              } else {
                return Center(
                  child: hasInternetConnection
                      ? Center(child: CircularProgressIndicator())
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'No Internet Connection Found',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                );
              }
              return !hasInternetConnection
                  ? Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: SizedBox(
                                height: 54,
                                child: TextField(
                                  controller: provider.searchController,
                                  decoration: InputDecoration(
                                    hintText: 'Search in Google',
                                    prefixIcon: Icon(Icons.search),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(48.0),
                                    ),
                                  ),
                                  onSubmitted: (value) {
                                    provider.searchController.clear();
                                    final searchUrl = Uri.parse(
                                        'https://www.google.com/search?q=$value');
                                    Navigator.of(context).pushNamed(
                                      "WebViewPage",
                                      arguments: OTTPlatform(
                                        name: 'Google',
                                        defaultWebLink: searchUrl.toString(),
                                        logoUri: 'vffv',
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 18.0, top: 12, right: 5, left: 16),
                              child: Text(
                                "Treding Right Now 🔥",
                                style: TextStyle(fontSize: 28),
                              ),
                            ),
                            Consumer<CarouselIndexProvider>(
                                builder: (context, carouselProvider, _) {
                              return CarouselSlider(
                                options: CarouselOptions(
                                  height: 230,
                                  autoPlay: true,
                                  scrollPhysics: BouncingScrollPhysics(),
                                  onPageChanged: (index, reason) {
                                    carouselProvider.currentIndex = index;
                                  },
                                ),
                                items: provider.tredingshows.map((show) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(24),
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pushNamed(
                                                "WebViewPage",
                                                arguments: show);
                                          },
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5.0)),
                                            child: Image.network(
                                              show.logoUri,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),
                              );
                            }),
                            Consumer<CarouselIndexProvider>(
                              builder: (context, carouselProvider, _) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 18.0),
                                  child: Center(
                                    child: TweenAnimationBuilder<double>(
                                      tween: Tween<double>(
                                        begin: carouselProvider.currentIndex
                                            .toDouble(),
                                        end: carouselProvider.currentIndex
                                            .toDouble(),
                                      ),
                                      duration:
                                          const Duration(milliseconds: 500),
                                      builder: (context, value, _) {
                                        return DotsIndicator(
                                          dotsCount:
                                              provider.tredingshows.length,
                                          position: value,
                                          decorator: DotsDecorator(
                                              size: const Size.square(8.0),
                                              activeSize: const Size(18.0, 8.0),
                                              activeShape:
                                                  RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              activeColor: Colors.white,
                                              color: Colors.grey.shade700),
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 18.0, right: 5, left: 16),
                              child: Text(
                                "📺 Ott Platform's",
                                style: TextStyle(fontSize: 28),
                              ),
                            ),
                            GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: provider.ottPlatforms.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 14,
                                mainAxisSpacing: 14,
                                mainAxisExtent: 200,
                                childAspectRatio: 2 / 4,
                              ),
                              itemBuilder: (context, i) {
                                final platform = provider.ottPlatforms[i];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        "WebViewPage",
                                        arguments: platform);
                                  },
                                  child: Card(
                                    child: Container(
                                      child: Image.network(
                                        platform.logoUri,
                                        fit: BoxFit.fill,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
            },
          ),
          drawer: Drawer(
            width: double.infinity,
            backgroundColor: Colors.transparent.withOpacity(0.9),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context); // Close the drawer
                    },
                  ),
                ),
                Expanded(
                  child: Consumer<BookmarkProvider>(
                    builder: (context, bookmarkProvider, _) {
                      return ListView.builder(
                        itemCount: bookmarkProvider.bookmarks.length,
                        itemBuilder: (context, index) {
                          String bookmarkUrl =
                              bookmarkProvider.bookmarks[index];
                          return ListTile(
                            leading: Icon(Icons.bookmarks),
                            title: Text(bookmarkUrl),
                            trailing: IconButton(
                              icon: Icon(Icons.bookmark_remove_outlined),
                              onPressed: () {
                                bookmarkProvider.removeBookmark(bookmarkUrl);
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Center(
                                      child: Text(
                                        'Bookmark Removed...',
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
                              },
                            ),
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                "WebViewPage",
                                arguments: OTTPlatform(
                                  name: 'Bookmarked',
                                  defaultWebLink: bookmarkUrl,
                                  logoUri: 'xyz',
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
