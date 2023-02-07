import 'package:flutter/material.dart';
import 'package:news_blog/model/catagory_details_model.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../provider/catagory_provider.dart';
import 'item_card.dart';
import 'item_detailes_page.dart';

class CatagoriesDetailsSection extends StatelessWidget {
  const CatagoriesDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CatagoryProvider>(
      builder: (context, provider, child) {
        return Expanded(
            child: provider.isCatagoryDetailsLoading == true
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : provider.results.isEmpty
                    ? const Center(
                        child: Text(
                          "No data",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      )
                    : SmartRefresher(
                        enablePullDown: false,
                        enablePullUp: true,
                        onLoading: () async {
                          final result = await provider.getCatagoryDetails(
                              id: provider.currentId.toString());
                          if (result) {
                            provider.refreshController.loadComplete();
                          } else {
                            provider.refreshController.loadNoData();
                          }
                        },
                        controller: provider.refreshController,
                        child: ListView.separated(
                          itemCount: provider.results.length,
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 10,
                            );
                          },
                          itemBuilder: (context, index) {
                            final data = provider.results[index];
                            return ItemCard(data: data);
                          },
                        ),
                      ));
      },
    );
  }
}
