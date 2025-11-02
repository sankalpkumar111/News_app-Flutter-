import 'package:flutter/material.dart';
import 'package:news_app/models/show_category_model.dart';
import 'package:news_app/services/show_category_news.dart';

class CategoryNews extends StatefulWidget {
  final String name;
  const CategoryNews({required this.name, Key? key}) : super(key: key);

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ShowCategoryModel> categories = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    ShowCategoriesNews showCategoriesNews = ShowCategoriesNews();
    await showCategoriesNews.getCategoryNews(widget.name.toLowerCase());
    categories = showCategoriesNews.categories;
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3280ef),
      body: Container(
        margin: EdgeInsets.only(top: 40.0),


        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 80.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,),
                  SizedBox(width: MediaQuery.of(context).size.width/3.6,),
                  Text("Bussiness",style: TextStyle(color: Colors.white,fontSize: 30.0,fontWeight: FontWeight.bold),)
                ],
              ),
            ),
  SizedBox(height: 20.0,),
  Expanded(
    child: Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0),topRight: Radius.circular(30.0))),
      child: Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),

          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset("images/news1.jpg"
                  )
              ),
              
            ],
          ),
        )
      ],
    ),
    ),
  ),

    ])
      ),
    );
  }
}
