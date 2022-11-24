import 'package:counter_7/model/myWatchListModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

List<bool> statusMovie = [];
Future<List<MyWatchListModel>> fetchMyWatchList() async {
  var url = Uri.parse('https://tugas2pbpjasmine.herokuapp.com/mywatchlist/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<MyWatchListModel> listWatch = [];

  for (var d in data) {
    if (d != null) {
      listWatch.add(MyWatchListModel.fromJson(d));
    }
  }
  return listWatch;
}
