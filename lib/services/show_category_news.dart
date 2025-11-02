import 'package:news_app/models/show_category_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ShowCategoriesNews{
  List<ShowCategoryModel> categories=[];

  Future<void>getCategoryNews(String category)async{
   String url="https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=b357fdc9fb644a4187abcaa8027cab1f";
   var response = await http.get(Uri.parse(url));
   var jsonData = json.decode(response.body);

   if (jsonData['status'] == 'ok') {
     jsonData["articles"].forEach((element) {
       if (element["urlToImage"] != null && element["description"] != null) {
         var showCategoryModel = ShowCategoryModel(
           urlToImage: element["urlToImage"],
           desc: element["description"],
           title: element["title"],
           url:element["url"],
         );
         categories.add(showCategoryModel);
       }
     });

   }

         }
}