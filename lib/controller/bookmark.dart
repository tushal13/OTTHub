import 'package:flutter/foundation.dart';

class BookmarkProvider with ChangeNotifier {
  List<String> _bookmarks = [];

  List<String> get bookmarks => _bookmarks;

  addBookmark(String url) {
    if (!_bookmarks.contains(url)) {
      _bookmarks.add(url);
      notifyListeners();
    }
  }

  removeBookmark(String url) {
    _bookmarks.remove(url);
    notifyListeners();
  }

  bool isBookmarked(String url) {
    return _bookmarks.contains(url);
  }
}
