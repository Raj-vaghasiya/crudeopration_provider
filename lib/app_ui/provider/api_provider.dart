import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:office/api_fetch_data/todos_api_modal.dart';
import 'package:office/api_fetch_data/compact_api.dart';

class ApiFetchDataProvider extends ChangeNotifier {

  Dio dio = Dio();
  List<TodoModal> todosApiData = [];
  List<CompactsModal> compactDetailApiDetail = [];

  todosApiAllData() async {
    if (todosApiData.isEmpty) {
      Response response =
          await dio.get("https://jsonplaceholder.typicode.com/todos");
      this.todosApiData =
          (response.data).map<TodoModal>((x) => TodoModal.fromJson(x)).toList();
      notifyListeners();
    }
  }



  compactPostIdapiData(int id) async {
    if (compactDetailApiDetail.isEmpty) {
      Response response =
      await dio.get("https://jsonplaceholder.typicode.com/comments?postId=$id");
      this.compactDetailApiDetail =
          (response.data).map<CompactsModal>((x) => CompactsModal.fromJson(x)).toList();
      notifyListeners();
    }
  }
}
