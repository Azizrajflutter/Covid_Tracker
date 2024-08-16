import 'package:covid_tracker/Views/World_States.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailScreen extends StatefulWidget {
  final String image, name;
  final int? totalCases,
      totalDeath,
      totalRecoverd,
      active,
      critical,
      todayRecovered,
      text;

  const DetailScreen(
      {super.key,
      required this.image,
      required this.name,
      required this.totalCases,
      required this.totalDeath,
      required this.totalRecoverd,
      required this.active,
      required this.critical,
      required this.todayRecovered,
      required this.text});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .065),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * .06),
                      ReuseableRow(
                          title: 'Country', value: widget.name.toString()),
                      ReuseableRow(
                          title: 'Cases', value: widget.totalCases.toString()),
                      ReuseableRow(
                          title: 'Recovered',
                          value: widget.totalRecoverd.toString()),
                      ReuseableRow(
                          title: 'Today Recovered',
                          value: widget.todayRecovered.toString()),
                      ReuseableRow(
                          title: 'Death', value: widget.totalDeath.toString()),
                      ReuseableRow(
                          title: 'Critical', value: widget.critical.toString()),
                      ReuseableRow(
                          title: 'Active', value: widget.active.toString()),
                      ReuseableRow(
                          title: 'Tests', value: widget.text.toString()),
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image),
              )
            ],
          )
        ],
      ),
    );
  }
}
