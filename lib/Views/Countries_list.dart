import 'package:covid_tracker/Services/Utilities/states_service.dart';
import 'package:covid_tracker/Views/Detail_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              TextFormField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    hintText: 'Search with Country Name'),
              ),
              Expanded(
                child: FutureBuilder(
                  future: StatesServices().CountriesList(),
                  builder: (context, AsyncSnapshot<List<dynamic>?> snapshot) {
                    if (!snapshot.hasData) {
                      return ListView.builder(
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey.shade700,
                            highlightColor: Colors.grey.shade100,
                            child: Column(
                              children: [
                                ListTile(
                                  title: Container(
                                    height: 10,
                                    width: 89,
                                    color: Colors.white,
                                  ),
                                  subtitle: Container(
                                    height: 10,
                                    width: 89,
                                    color: Colors.white,
                                  ),
                                  leading: Container(
                                    height: 50,
                                    width: 50,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          String name = snapshot.data![index]['country'];
                          if (searchController.text.isEmpty) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.to(() => DetailScreen(
                                        image: snapshot.data![index]
                                            ['countryInfo']['flag'],
                                        name: snapshot.data![index]['country'],
                                        totalCases: snapshot.data![index]
                                            ['cases'],
                                        totalDeath: snapshot.data![index]
                                            ['deaths'],
                                        totalRecoverd: snapshot.data![index]
                                            ['recovered'],
                                        active: snapshot.data![index]['active'],
                                        critical: snapshot.data![index]
                                            ['critical'],
                                        todayRecovered: snapshot.data![index]
                                            ['todayRecovered'],
                                        text: snapshot.data![index]['tests']));
                                  },
                                  child: ListTile(
                                    title:
                                        Text(snapshot.data![index]['country']),
                                    subtitle: Text(snapshot.data![index]
                                            ['cases']
                                        .toString()),
                                    leading: Image(
                                        height: 50,
                                        width: 50,
                                        image: NetworkImage(
                                            snapshot.data![index]['countryInfo']
                                                ['flag'])),
                                  ),
                                ),
                              ],
                            );
                          } else if (name
                              .toLowerCase()
                              .contains(searchController.text.toLowerCase())) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.to(() => DetailScreen(
                                        image: snapshot.data![index]
                                            ['countryInfo']['flag'],
                                        name: snapshot.data![index]['country'],
                                        totalCases: snapshot.data![index]
                                            ['cases'],
                                        totalDeath: snapshot.data![index]
                                            ['deaths'],
                                        totalRecoverd: snapshot.data![index]
                                            ['recovered'],
                                        active: snapshot.data![index]['active'],
                                        critical: snapshot.data![index]
                                            ['critical'],
                                        todayRecovered: snapshot.data![index]
                                            ['todayRecovered'],
                                        text: snapshot.data![index]['tests']));
                                  },
                                  child: ListTile(
                                    title:
                                        Text(snapshot.data![index]['country']),
                                    subtitle: Text(snapshot.data![index]
                                            ['cases']
                                        .toString()),
                                    leading: Image(
                                        height: 50,
                                        width: 50,
                                        image: NetworkImage(
                                            snapshot.data![index]['countryInfo']
                                                ['flag'])),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Container();
                          }
                        },
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
