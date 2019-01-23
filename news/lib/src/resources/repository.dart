import 'dart:async';
import 'news_api_provider.dart';
import 'news_db_provider.dart';
import '../models/item_model.dart';

class Repository {

  List<Source> sources = <Source>[
    newsDBProvider,
    NewsApiProvider()
  ];

  List<Cache> caches = <Cache>[
    newsDBProvider
  ];

  Future<ItemModel> fetchItem(int id) async {
    ItemModel item;
    Source source;

    for(source in sources){
      item = await source.fetchItem(id);
      if (item != null) {
        break;
      }
    }

    for(var cache in caches) {
      if (cache != source) {
        cache.addItem(item);
      }
    }

    return item;
  }

  Future<List<int>> fetchTopIds() {
    return sources[1].fetchTopIds();
  }

}

abstract class Source {
  Future<List<int>> fetchTopIds();
  Future<ItemModel> fetchItem(int id);
}

abstract class Cache {
  addItem(ItemModel item);
}