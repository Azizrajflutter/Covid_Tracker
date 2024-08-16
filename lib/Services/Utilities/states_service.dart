import 'dart:convert';

import 'package:covid_tracker/Models/World_States_model.dart';
import 'package:covid_tracker/Services/Utilities/app_url.dart';
import 'package:http/http.dart' as http;

class StatesServices {
  Future<WorldStatesModel?> fetchWolrdRecords() async {
    try {
      final response = await http.get(Uri.parse(AppUrl.worldStatesApi));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        WorldStatesModel data1 = WorldStatesModel.fromJson(data);
        print('//////////////');
        print(data1.toJson());
        return data1;
      }
    } on Exception catch (e) {
      print('$e Failled');
      throw e;
      // TODO
    }
    return null;
  }

  Future<List<dynamic>?> CountriesList() async {
    try {
      final response = await http.get(Uri.parse(AppUrl.countriesList));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        print('//////////////Countries LIst//////////////////');
        print(data);
        return data;
      }
    } on Exception catch (e) {
      print('$e Failled');
      throw e;
      // TODO
    }
    return null;
  }
}
