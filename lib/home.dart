// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'home2.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
  
}

    TextEditingController x = TextEditingController();
    TextEditingController y = TextEditingController();

class _HomeState extends State<Home> {

  List<Data> e1 = [];
  TooltipBehavior? _tooltip;

  @override
  void initState() {
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  List<Data> getdata() {
    return e1;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MoneyTracker",
      home: Scaffold(
        backgroundColor: Colors.blueAccent[600],
        appBar: AppBar(
          elevation: 0.0,
          title: const Text('Money Tracker'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent[400],
        ),
        body:
         SingleChildScrollView(
           child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: SafeArea(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  child: Scaffold(
                    body: SfCartesianChart(
                      title: ChartTitle(text: "Preview"),
                      tooltipBehavior: _tooltip,
                      series: <ChartSeries>[
                        LineSeries<Data,double>(
                        dataSource: e1, 
                        xValueMapper: (Data data,_) => data.time, 
                        yValueMapper: (Data data,_) => data.expense,
                        dataLabelSettings: const DataLabelSettings(isVisible: true)
                        )
                      ],
                      primaryXAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
                      primaryYAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
                    ),
                      ),
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.number, 
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
              ),
              controller: x,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.deepOrangeAccent),
                  borderRadius: BorderRadius.circular(20)
                  ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.deepOrangeAccent),
                  borderRadius: BorderRadius.circular(20)
                  ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(20)
                  ),
                hintText: 'Enter the investment',
                hintStyle: const TextStyle(color: Colors.grey),
              ),
            ),
            TextField(
              keyboardType: TextInputType.number, 
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
              ),
              controller: y,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.deepOrangeAccent),
                  borderRadius: BorderRadius.circular(20)
                  ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.deepOrangeAccent),
                  borderRadius: BorderRadius.circular(20)
                  ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(20)
                  ),
                hintText: 'Enter the month/year',
                hintStyle: const TextStyle(color: Colors.grey),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonBar(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                            if(x.text.isNotEmpty && y.text.isNotEmpty){
                              e1.add(Data(double.parse(x.text),double.parse(y.text)));
                              x.clear();
                              y.clear();
                            }
                        });
                      },
                      child: const Text('Add data'),
                      )
                  ],
                ),  
            ButtonBar(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    var n = MaterialPageRoute(
                      builder: (BuildContext context) =>
                        Home2(e1),
                    );
                    Navigator.of(context).push(n);
                  },
                  child: const Text('See Graph'),
                  )
              ],
            ),
            ButtonBar(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    e1.removeLast();
                  },
                  child: const Text('Remove Last'),
                  )
              ],
            ),
              ],
            ),
            ButtonBar(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    e1.clear();
                  },
                  child: const Text('Reset'),
                  )
              ],
            ),
           ]),
         )
         ),
    );
  }
}
