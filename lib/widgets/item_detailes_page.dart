import 'package:flutter/material.dart';

class ItemDetailePage extends StatelessWidget {
  final String? title;
  final String? content;
  final String? date;
  const ItemDetailePage(
      {super.key,
      required this.title,
      required this.content,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "News Details",
          style: TextStyle(color: Colors.black),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            decoration: BoxDecoration(
                color: Colors.amber, borderRadius: BorderRadius.circular(15)),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            title ?? "",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
            height: 40,
            color: Colors.grey[300],
            child: Text(
              "Updated : $date",
              style: const TextStyle(
                  color: Colors.green, fontWeight: FontWeight.w600),
            ),
          ),
          Text(content ?? "")
        ],
      ),
    );
  }
}
