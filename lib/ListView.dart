import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ListViewModel.dart';

class HorizontalListView extends StatefulWidget {
  @override
  _HorizontalListViewState createState() => _HorizontalListViewState();
}

class _HorizontalListViewState extends State<HorizontalListView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ListViewModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Consumer<ListViewModel>(
          builder: (context, viewModel, child) {
            return Container(
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 16),
                      Expanded(
                        child: SizedBox(
                          height: 52,
                          width: 200,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: viewModel.categories.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Center(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        for (var i = 0; i < viewModel.categories.length; i++) {
                                          viewModel.categories[i].selected = false;
                                        }
                                        viewModel.categories[index].selected = true;
                                      });
                                    },
                                    borderRadius: BorderRadius.circular(16),
                                    child: Container(
                                      margin: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: viewModel.categories[index].selected
                                              ? Colors.white
                                              : Colors.grey,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 3,
                                        horizontal: 10,
                                      ),
                                      child: Text(
                                        viewModel.categories[index].title,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: viewModel.categories[index].selected
                                              ? Colors.white
                                              : Colors.grey.withOpacity(0.5),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}