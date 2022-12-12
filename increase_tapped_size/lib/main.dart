import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int? pointIndex;
  late String radius;
  late List<SampleData> chartData;
  @override
  void initState() {
    radius = '140';
    chartData = <SampleData>[
      SampleData('1', 120),
      SampleData('2', 40),
      SampleData('3', 10),
      SampleData('4', 10),
      SampleData('5', 10),
      SampleData('6', 6),
      SampleData('7', 4),
      SampleData('8', 1),
      SampleData('9', 60),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SfCircularChart(
        onSelectionChanged: (SelectionArgs args) {
          pointIndex = args.pointIndex;
          radius = '160';
          setState(() {});
        },
        series: <CircularSeries<SampleData, String>>[
          PieSeries<SampleData, String>(
              selectionBehavior:
                  SelectionBehavior(enable: true, unselectedOpacity: 1),
              dataSource: chartData,
              pointRadiusMapper: (SampleData data, index) =>
                  radius != '' && index == pointIndex ? radius : '140',
              xValueMapper: (SampleData data, _) => data.x,
              yValueMapper: (SampleData data, _) => data.y)
        ],
      ),
    );
  }
}

class SampleData {
  SampleData(this.x, this.y);
  final String x;
  final num y;
}
