import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:news_blog/model/catagory_details_model.dart';
import 'package:news_blog/model/catagory_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CatagoryProvider with ChangeNotifier {
  int _currentId = 0;
  int get currentId => _currentId;
  set currentId(int id) {
    _currentId = id;
    notifyListeners();
  }

  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  String? hasNext = "";
  void changeHasNext() {
    hasNext = "";
    notifyListeners();
  }

  int currentPage = 1;
  void changeCurrentPage() {
    currentPage = 1;
    notifyListeners();
  }

  List<Results> results = [];
  void clearList() {
    results.clear();
    notifyListeners();
  }

  bool _isCatagoryDetailsLoading = false;
  bool get isCatagoryDetailsLoading => _isCatagoryDetailsLoading;
  set isCatagoryDetailsLoading(bool value) {
    _isCatagoryDetailsLoading = value;
    notifyListeners();
  }

  CatagoryDetailsModel? catagoryDetailsList;
  bool _isCatagoryLoading = false;
  bool get isCatagoryLoading => _isCatagoryLoading;
  set isCatagoryLoading(bool value) {
    _isCatagoryLoading = value;
    notifyListeners();
  }

  CatagoryModel? catagoryList;
  String baseUrl = "https://milliondotsadmin.noviindus.co.in/api/";
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  Future<void> getCatagories() async {
    isCatagoryLoading = true;
    try {
      var response = await get(Uri.parse("${baseUrl}news-and-blogs"));

      if (response.statusCode == 202) {
        Map<String, dynamic> data = jsonDecode(response.body);
        catagoryList = CatagoryModel.fromJson(data);
        notifyListeners();
      }
      isCatagoryLoading = false;
    } catch (e) {
      isCatagoryLoading = false;
      log(e.toString());
    }
  }

  Future<bool> getCatagoryDetails({required String id}) async {
    if (hasNext == null) {
      isCatagoryDetailsLoading = false;
      refreshController.loadComplete();
      return false;
    }
    isCatagoryDetailsLoading = true;

    try {
      var response = await post(
          Uri.parse("${baseUrl}news-and-blogs-catg?page=$currentPage"),
          body: {"category": id});

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        hasNext = data['next'];
        notifyListeners();
        catagoryDetailsList = CatagoryDetailsModel.fromJson(data);
        catagoryDetailsList?.results?.forEach((element) {
          results.add(element);
        });
        currentPage++;
        notifyListeners();

        isCatagoryDetailsLoading = false;
        return true;
      }
      isCatagoryDetailsLoading = false;
      return true;
    } catch (e) {
      isCatagoryDetailsLoading = false;
      return false;
    }
  }
}
