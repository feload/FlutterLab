import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import '../models/item_model.dart';

final _root = 'https://hacker-news.firebaseio.com/v0';

class NewsApiProvider {
  Client client = Client();

  Future<List<int>> fetchTopIds() async {
    final response = await client.get('$_root/topstories.json');
    final List ids = json.decode(response.body);
    return ids.cast<int>();
  }

  Future<ItemModel> fetchItem (int id) async {
    final response =  await client.get('$_root/item/$id.json');
    return ItemModel.fromJson(json.decode(response.body));
  }
}