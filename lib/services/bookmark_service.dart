import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookmarkService extends ChangeNotifier {
  Set<int> _bookmarkedTopics = <int>{};
  
  Set<int> get bookmarkedTopics => _bookmarkedTopics;

  BookmarkService() {
    _loadBookmarks();
  }

  Future<void> _loadBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final bookmarksList = prefs.getStringList('bookmarked_topics') ?? [];
    _bookmarkedTopics = bookmarksList.map((id) => int.parse(id)).toSet();
    notifyListeners();
  }

  Future<void> _saveBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final bookmarksList = _bookmarkedTopics.map((id) => id.toString()).toList();
    await prefs.setStringList('bookmarked_topics', bookmarksList);
  }

  bool isBookmarked(int topicId) {
    return _bookmarkedTopics.contains(topicId);
  }

  Future<void> toggleBookmark(int topicId) async {
    if (_bookmarkedTopics.contains(topicId)) {
      _bookmarkedTopics.remove(topicId);
    } else {
      _bookmarkedTopics.add(topicId);
    }
    await _saveBookmarks();
    notifyListeners();
  }
}