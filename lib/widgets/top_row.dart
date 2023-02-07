import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../provider/catagory_provider.dart';

class TopRowSection extends StatelessWidget {
  const TopRowSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CatagoryProvider>(
      builder: (context, provider, child) {
        return Container(
          height: 60,
          child: provider.isCatagoryLoading == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  itemCount: provider.catagoryList?.blogsCategory?.length ?? 0,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final data = provider.catagoryList?.blogsCategory?[index];
                    return InkWell(
                      onTap: () {
                        log(index.toString());
                        provider.changeHasNext();
                        provider.changeCurrentPage();
                        provider.clearList();
                        provider.currentIndex = index;
                        provider.currentId = data!.id!;
                        provider.getCatagoryDetails(id: data.id.toString());
                      },
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          data?.name ?? "",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: index == provider.currentIndex
                                  ? Colors.green
                                  : Colors.black),
                        ),
                      )),
                    );
                  },
                ),
        );
      },
    );
  }
}
