import 'package:flutter/material.dart';

import '../model/catagory_details_model.dart';
import 'item_detailes_page.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.data,
  });

  final Results data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ItemDetailePage(
                  date: data.createdAt,
                  content: data.content,
                  title: data.title,
                )));
      },
      child: Container(
        padding: const EdgeInsets.all(13),
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(15),
                // image:
                //     DecorationImage(image: NetworkImage(data!.image!)),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              data.title ?? "",
              maxLines: 1,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              data.content ?? "",
              maxLines: 2,
            )
          ],
        ),
      ),
    );
  }
}
