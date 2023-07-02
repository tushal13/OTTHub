import 'package:flutter/material.dart';
import 'package:otthub/controller/cacrousel.dart';
import 'package:otthub/views/pages/homepage.dart';
import 'package:otthub/views/pages/splash_screen.dart';
import 'package:otthub/views/pages/webviewpage.dart';
import 'package:provider/provider.dart';

import 'controller/bookmark.dart';
import 'controller/webviewcontrollre.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<WebViewController>(
          create: (_) => WebViewController(),
        ),
        ChangeNotifierProvider<CarouselIndexProvider>(
          create: (_) => CarouselIndexProvider(),
        ),
        ChangeNotifierProvider<BookmarkProvider>(
          create: (_) => BookmarkProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.red,
            brightness: Brightness.dark,
            backgroundColor: Colors.black54),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => SPLASH_SCREEN(),
        'home': (context) => OTTHomePage(),
        'WebViewPage': (context) => PlatformWebViewPage(),
      },
    );
  }
}
