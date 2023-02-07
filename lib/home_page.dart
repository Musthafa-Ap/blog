import 'package:flutter/material.dart';
import 'package:news_blog/provider/catagory_provider.dart';
import 'package:news_blog/widgets/catagory_details_section.dart';
import 'package:news_blog/widgets/top_row.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CatagoryProvider>(context, listen: false).getCatagories();
      Provider.of<CatagoryProvider>(context, listen: false)
          .getCatagoryDetails(id: "0");
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            "News & Blogs",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Consumer<CatagoryProvider>(
          builder: (context, provider, child) {
            return Column(
              children: [TopRowSection(), CatagoriesDetailsSection()],
            );
          },
        ));
  }
}
