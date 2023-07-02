import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../models/ottplatform.dart';

class WebViewController with ChangeNotifier {
  List<OTTPlatform> ottPlatforms = [
    OTTPlatform(
      name: 'Netflix',
      logoUri:
          'https://duet-cdn.vox-cdn.com/thumbor/0x0:3151x2048/828x552/filters:focal(1575x1024:1576x1025):format(webp)/cdn.vox-cdn.com/uploads/chorus_asset/file/15844974/netflixlogo.0.0.1466448626.png',
      defaultWebLink: 'https://www.netflix.com',
    ),
    OTTPlatform(
      name: 'Disney+ Hotstar',
      logoUri:
          'https://play-lh.googleusercontent.com/Vd6XKGvZKp8r3Ikz4vRykNJaMjFULqftsqviOsMPepYTOu4ef-4HkUo3iEcPpOi4c2s',
      defaultWebLink: 'https://www.hotstar.com',
    ),
    OTTPlatform(
      name: 'Amazon Prime Video',
      logoUri:
          'https://images.news18.com/ibnlive/uploads/2021/10/amazon-prime.jpg',
      defaultWebLink: 'https://www.primevideo.com',
    ),
    OTTPlatform(
      name: 'Amazon MiniTV',
      logoUri: 'https://www.exchange4media.com/news-photo/113497-big26.jpg',
      defaultWebLink: 'https://www.amazon.in/minitv',
    ),
    OTTPlatform(
      name: 'Eros Now',
      logoUri:
          'https://play-lh.googleusercontent.com/SMlVlmn--w2tTPtk6kL2Y6vTgXhuO-sqi2Yzr9WzljMdBX5AER9OAnnwXv_vWkaA4A',
      defaultWebLink: 'https://erosnow.com',
    ),
    OTTPlatform(
      name: 'Hoichoi',
      logoUri:
          'https://play-lh.googleusercontent.com/dxc6rqZHigOTItU0u3i4aWOKN9pdszX-JlZK1tRatCOyT3JJD1AOW7TZ-hzKyk1tkxI',
      defaultWebLink: 'https://www.hoichoi.tv',
    ),
    OTTPlatform(
      name: 'Jio Cinema',
      logoUri:
          'https://bsmedia.business-standard.com/_media/bs/img/article/2023-04/10/full/1681118018-5786.jpg',
      defaultWebLink: 'https://www.jiocinema.com',
    ),
    OTTPlatform(
      name: 'Sony Liv',
      logoUri:
          'https://origin-staticv2.sonyliv.com/UI_icons/fallback_sonyliv_logo.png',
      defaultWebLink: 'https://www.sonyliv.com/custompage/tv-shows-2240',
    ),
    OTTPlatform(
      name: 'Ullu',
      logoUri: 'https://d30ny7ijak9wq4.cloudfront.net/s3fs-public/Ullu_5.jpg',
      defaultWebLink: 'https://www.ullu.app',
    ),
    OTTPlatform(
      name: 'Zee5',
      logoUri:
          'https://upload.wikimedia.org/wikipedia/commons/5/5a/Zee5-official-logo.jpeg',
      defaultWebLink: 'https://www.zee5.com',
    ),
    OTTPlatform(
      name: 'Voot',
      logoUri:
          'https://play-lh.googleusercontent.com/70qBcFj4OSFhN2rPIiXadUvtSRSvSy4AAVvgWkKS3_PeUEabtIKL8gsDKbvjhSBa4UI',
      defaultWebLink: 'https://www.voot.com',
    ),
    OTTPlatform(
      name: 'MX Player',
      logoUri: 'https://etimg.etb2bimg.com/photo/78529851.cms',
      defaultWebLink: 'https://www.mxplayer.in',
    ),
    OTTPlatform(
      name: 'Airtel Xstream',
      logoUri:
          'https://dreamdth.com/wp-content/uploads/2020/05/Airtel-Xstream-1.jpg',
      defaultWebLink: 'https://www.airtelxstream.in',
    ),
    OTTPlatform(
      name: 'Shemaroo',
      logoUri: 'https://etimg.etb2bimg.com/photo/64931581.cms',
      defaultWebLink: 'https://www.shemaroome.com',
    ),
    OTTPlatform(
      name: 'TVF Play',
      logoUri:
          'https://upload.wikimedia.org/wikipedia/en/b/b1/THE_VIRAL_FEVER_OFFICIAL_LOGO.jpg',
      defaultWebLink: 'https://www.justwatch.com',
    ),
  ];
  List<OTTPlatform> tredingshows = [
    OTTPlatform(
        name: "Jio Cinema",
        logoUri:
            "https://v3img.voot.com/v3Storage/assets/bbo-episode-stream-16x9-1687168050669.jpg",
        defaultWebLink:
            "https://www.jiocinema.com/tv-shows/bigg-boss-ott/3499624"),
    OTTPlatform(
        name: "Jio Cinema",
        logoUri: "https://indiacsr.in/wp-content/uploads/2023/06/Asur-2.jpg",
        defaultWebLink: "https://www.jiocinema.com/tv-shows/asur/3500240"),
    OTTPlatform(
        name: "Amazon MiniTV",
        logoUri:
            "https://m.media-amazon.com/images/S/pv-target-images/70c5e6c36fc4a6e7e69dac106e9f5a705ed60d227e63c96a6ffa883500a0d168.__SX420__SY236.25__QL60__._TTH_.jpg",
        defaultWebLink:
            "https://www.amazon.in/minitv/tp/f77d9c82-9f7f-427c-923a-d1cd12d72e3e"),
    OTTPlatform(
        name: "Disney+ Hotstar",
        logoUri:
            "https://i0.wp.com/www.smartprix.com/bytes/wp-content/uploads/2023/05/The-Night-Manager.jpg",
        defaultWebLink:
            "https://www.hotstar.com/in/shows/the-night-manager/1260128382"),
    OTTPlatform(
        name: "Jio Cinema",
        logoUri: "https://i.ytimg.com/vi/clbAUTLfAJY/maxresdefault.jpg",
        defaultWebLink:
            "https://www.jiocinema.com/tv-shows/rafuchakkar/3761992"),
  ];

  InAppWebViewController? webViewController;
  TextEditingController searchController = TextEditingController();

  bool isLoading = false;
  bool canGoBack = false;
  bool canGoForward = false;
  String initialUrl = 'https://www.example.com';

  setWebViewController(InAppWebViewController controller) {
    webViewController = controller;
    webViewController!.canGoBack().then((value) {
      canGoBack = value ?? false;
      notifyListeners();
    });
    webViewController!.canGoForward().then((value) {
      canGoForward = value ?? false;
      notifyListeners();
    });
  }

  setloadstop(InAppWebViewController controller, url) {
    webViewController!.canGoBack().then((value) {
      canGoBack = value ?? false;
      isLoading = false;
      notifyListeners();
    });
    webViewController!.canGoForward().then((value) {
      canGoForward = value ?? false;
      isLoading = false;
      notifyListeners();
    });
  }

  goBack() {
    webViewController!.goBack();
    notifyListeners();
  }

  goForward() {
    webViewController!.goForward();
    notifyListeners();
  }

  reload() {
    webViewController!.reload();
    notifyListeners();
  }
}
