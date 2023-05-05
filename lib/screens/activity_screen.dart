import 'package:brush_teeth/widget/reusable_button.dart';
import 'package:brush_teeth/widget/reusable_textFormField.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import 'my_average_time.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: blueColor,
            title: const Text("Activity"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                 TabBar(
                   unselectedLabelColor: blackColor,
                  indicator: BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  tabs: const [
                  Tab(
                    text: "History",
                  ),
                  Tab(
                    text: "Average Time",
                  ),
                ],),
                const SizedBox(height: 10,),
                Expanded(
                  child: TabBarView(children: [
                    Column(
                      children: [
                        const ReusableTextFormField(
                          hintText: "Search by Date",
                          prefixIcon: Icon(Icons.search_outlined),
                          suffixIcons: Icon(Icons.filter_list_outlined),
                        ),
                        const SizedBox(height: 10,),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return const Card(
                                margin: EdgeInsets.only(left: 2,right: 2,top: 15),
                                elevation: 6,
                                child: ListTile(
                                  contentPadding: EdgeInsets.all(15),
                                  leading: CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage("assets/dp.jpg"),
                                  ),
                                  title: Text(
                                    "Ramzan",
                                    style: TextStyle(
                                        fontSize: 15, fontWeight: FontWeight.w700),
                                  ),
                                  subtitle: Text(
                                    "18-03-2023",
                                  ),
                                  trailing: Text(
                                    "Brush (5 Min)",style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.w700),
                                  ),

                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    MyAverageTIME(),
                  ],),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
