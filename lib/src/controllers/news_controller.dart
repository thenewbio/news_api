import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_api/src/models/news_model.dart';
import 'package:http/http.dart' as http;

final getDataFuture = ChangeNotifierProvider<GetNewsApi>((ref) => GetNewsApi());

class GetNewsApi extends ChangeNotifier {
  List<NewsModel> list = [];
  GetNewsApi() {
    fetchData();
  }

  Future fetchData() async {
    list = [];

    try {
      http.Response response = await http
          .get(Uri.parse('https://api.sampleapis.com/futurama/characters'));

      var data = jsonDecode(response.body);

      for (int h = 0; h < data.length; h++) {
        list.add(NewsModel.fromJson(data[h]));
      }
      print(response.body.toString());
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }
}
