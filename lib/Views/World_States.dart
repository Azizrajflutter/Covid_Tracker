import 'package:covid_tracker/Models/World_States_model.dart';
import 'package:covid_tracker/Services/Utilities/states_service.dart';
import 'package:covid_tracker/Views/Countries_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({Key? key}) : super(key: key);

  @override
  State<WorldStatesScreen> createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController =
      AnimationController(vsync: this, duration: Duration(seconds: 3))
        ..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  final colorList = <Color>[
    Color(0xff4285F4),
    Color(0xff1aa260),
    Color(0xffde5246)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            FutureBuilder(
              future: StatesServices().fetchWolrdRecords(),
              builder: (context, AsyncSnapshot<WorldStatesModel?> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Expanded(
                    flex: 1,
                    child: SpinKitFadingCircle(
                      color: Colors.white,
                      size: 50,
                      controller: _animationController,
                    ),
                  );
                } else if (snapshot.data != null) {
                  return Column(
                    children: [
                      PieChart(
                        dataMap: {
                          'Total':
                              double.parse(snapshot.data!.cases!.toString()),
                          'Recoverd':
                              double.parse(snapshot.data!.recovered.toString()),
                          'Deaths':
                              double.parse(snapshot.data!.deaths.toString())
                        },
                        chartValuesOptions: ChartValuesOptions(
                            showChartValuesInPercentage: true),
                        chartType: ChartType.ring,
                        colorList: colorList,
                        chartRadius: MediaQuery.of(context).size.width / 3.2,
                        legendOptions:
                            LegendOptions(legendPosition: LegendPosition.left),
                        animationDuration: Duration(milliseconds: 1200),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * .03),
                        child: Card(
                            child: Column(
                          children: [
                            ReuseableRow(
                                title: 'Total',
                                value: snapshot.data!.cases.toString()),
                            ReuseableRow(
                                title: 'Recoverd',
                                value: snapshot.data!.recovered.toString()),
                            ReuseableRow(
                                title: 'Deaths',
                                value: snapshot.data!.deaths.toString()),
                            ReuseableRow(
                                title: 'Active',
                                value: snapshot.data!.active.toString()),
                            ReuseableRow(
                                title: 'Critical',
                                value: snapshot.data!.critical.toString()),
                            ReuseableRow(
                                title: 'Today Deaths',
                                value: snapshot.data!.todayDeaths.toString()),
                            ReuseableRow(
                                title: 'Today Recovered',
                                value:
                                    snapshot.data!.todayRecovered.toString()),
                          ],
                        )),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => CountriesListScreen());
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff1aa260)),
                          child: Center(
                            child: Text('Track Countries'),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Text('No Data');
                }
              },
            ),
          ],
        ),
      )),
    );
  }
}

class ReuseableRow extends StatelessWidget {
  final String title, value;
  const ReuseableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(title), Text(value)],
            ),
            Divider(
              thickness: 0.2,
            ),
          ],
        ),
      ),
    );
  }
}
