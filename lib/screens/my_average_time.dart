import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import '../colors.dart';
import '../widget/reusable_textFormField.dart';

class MyAverageTIME extends StatelessWidget {
  const MyAverageTIME({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 200,
            // margin: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade200, blurRadius: 5, spreadRadius: 1)
            ]),
            child: SfCartesianChart(
                // Initialize category axis
                primaryXAxis: CategoryAxis(),
                series: <LineSeries<SalesData, String>>[
                  LineSeries<SalesData, String>(
                      // Bind data source
                      dataSource: <SalesData>[
                        SalesData('Jan', 35),
                        SalesData('Feb', 28),
                        SalesData('Mar', 34),
                        SalesData('Apr', 32),
                        SalesData('May', 40)
                      ],
                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales)
                ]),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "March 2023",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 10,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return const Card(
                margin: EdgeInsets.only(top: 15),
                elevation: 6,
                child: ListTile(
                  contentPadding: EdgeInsets.all(15),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/a.jpg"),
                  ),
                  title: Text(
                    "Ramzan",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text(
                    "18-03-2023",
                  ),
                  trailing: Text(
                    "Average Time (5 Min)",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          const ExpansionTile(
            title: Text(
              "April 2023",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            children: [
              Card(
                margin: EdgeInsets.only(top: 15),
                elevation: 6,
                child: ListTile(
                  contentPadding: EdgeInsets.all(15),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/a.jpg"),
                  ),
                  title: Text(
                    "Ramzan",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text(
                    "18-03-2023",
                  ),
                  trailing: Text(
                    "Average Time (5 Min)",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.only(top: 15),
                elevation: 6,
                child: ListTile(
                  contentPadding: EdgeInsets.all(15),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/a.jpg"),
                  ),
                  title: Text(
                    "Ramzan",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text(
                    "18-03-2023",
                  ),
                  trailing: Text(
                    "Average Time (5 Min)",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.only(top: 15),
                elevation: 6,
                child: ListTile(
                  contentPadding: EdgeInsets.all(15),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/a.jpg"),
                  ),
                  title: Text(
                    "Ramzan",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text(
                    "18-03-2023",
                  ),
                  trailing: Text(
                    "Average Time (5 Min)",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
