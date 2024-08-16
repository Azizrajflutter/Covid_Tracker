import 'dart:convert';

class WorldStatesModel {
  int? updated;
  int? cases;
  int? todayCases;
  int? deaths;
  int? todayDeaths;
  int? recovered;
  int? todayRecovered;
  int? active;
  int? critical;
  int? casesPerOneMillion;
  double? deathsPerOneMillion;
  int? tests;
  double? testsPerOneMillion;
  int? population;
  int? oneCasePerPeople;
  int? oneDeathPerPeople;
  int? oneTestPerPeople;
  double? activePerOneMillion;
  double? recoveredPerOneMillion;
  double? criticalPerOneMillion;
  int? affectedCountries;

  WorldStatesModel({
    this.updated,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.todayRecovered,
    this.active,
    this.critical,
    this.casesPerOneMillion,
    this.deathsPerOneMillion,
    this.tests,
    this.testsPerOneMillion,
    this.population,
    this.oneCasePerPeople,
    this.oneDeathPerPeople,
    this.oneTestPerPeople,
    this.activePerOneMillion,
    this.recoveredPerOneMillion,
    this.criticalPerOneMillion,
    this.affectedCountries,
  });

  factory WorldStatesModel.fromRawJson(String str) =>
      WorldStatesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WorldStatesModel.fromJson(Map<String, dynamic> json) {
    try {
      return WorldStatesModel(
        updated: json["updated"] != null
            ? int.parse(json["updated"].toString())
            : null,
        cases:
            json["cases"] != null ? int.parse(json["cases"].toString()) : null,
        todayCases: json["todayCases"] != null
            ? int.parse(json["todayCases"].toString())
            : null,
        deaths: json["deaths"] != null
            ? int.parse(json["deaths"].toString())
            : null,
        todayDeaths: json["todayDeaths"] != null
            ? int.parse(json["todayDeaths"].toString())
            : null,
        recovered: json["recovered"] != null
            ? int.parse(json["recovered"].toString())
            : null,
        todayRecovered: json["todayRecovered"] != null
            ? int.parse(json["todayRecovered"].toString())
            : null,
        active: json["active"] != null
            ? int.parse(json["active"].toString())
            : null,
        critical: json["critical"] != null
            ? int.parse(json["critical"].toString())
            : null,
        casesPerOneMillion: json["casesPerOneMillion"] != null
            ? int.parse(json["casesPerOneMillion"].toString())
            : null,
        deathsPerOneMillion: json["deathsPerOneMillion"] != null
            ? double.parse(json["deathsPerOneMillion"].toString())
            : null,
        tests:
            json["tests"] != null ? int.parse(json["tests"].toString()) : null,
        testsPerOneMillion: json["testsPerOneMillion"] != null
            ? double.parse(json["testsPerOneMillion"].toString())
            : null,
        population: json["population"] != null
            ? int.parse(json["population"].toString())
            : null,
        oneCasePerPeople: json["oneCasePerPeople"] != null
            ? int.parse(json["oneCasePerPeople"].toString())
            : null,
        oneDeathPerPeople: json["oneDeathPerPeople"] != null
            ? int.parse(json["oneDeathPerPeople"].toString())
            : null,
        oneTestPerPeople: json["oneTestPerPeople"] != null
            ? int.parse(json["oneTestPerPeople"].toString())
            : null,
        activePerOneMillion: json["activePerOneMillion"] != null
            ? double.parse(json["activePerOneMillion"].toString())
            : null,
        recoveredPerOneMillion: json["recoveredPerOneMillion"] != null
            ? double.parse(json["recoveredPerOneMillion"].toString())
            : null,
        criticalPerOneMillion: json["criticalPerOneMillion"] != null
            ? double.parse(json["criticalPerOneMillion"].toString())
            : null,
        affectedCountries: json["affectedCountries"] != null
            ? int.parse(json["affectedCountries"].toString())
            : null,
      );
    } catch (e) {
      print('Error parsing JSON: $e');
      rethrow;
    }
  }

  Map<String, dynamic> toJson() => {
        "updated": updated,
        "cases": cases,
        "todayCases": todayCases,
        "deaths": deaths,
        "todayDeaths": todayDeaths,
        "recovered": recovered,
        "todayRecovered": todayRecovered,
        "active": active,
        "critical": critical,
        "casesPerOneMillion": casesPerOneMillion,
        "deathsPerOneMillion": deathsPerOneMillion,
        "tests": tests,
        "testsPerOneMillion": testsPerOneMillion,
        "population": population,
        "oneCasePerPeople": oneCasePerPeople,
        "oneDeathPerPeople": oneDeathPerPeople,
        "oneTestPerPeople": oneTestPerPeople,
        "activePerOneMillion": activePerOneMillion,
        "recoveredPerOneMillion": recoveredPerOneMillion,
        "criticalPerOneMillion": criticalPerOneMillion,
        "affectedCountries": affectedCountries,
      };
}
