import 'dart:convert';

import 'package:radio_station/domain/models/radio_station_model/radio_station.dart';
import 'package:http/http.dart' as http;

//En un caso con autentificación y más grande utilizaría un fichero aparte para las diferentes llamadar a la API
//en este caso como es tan pequeno las hago directamente aquí.

class RadioRepository {
  Future<List<RadioStation>> fetchRadioStations() async {
    final response = await http.get(Uri.parse(
        'http://de1.api.radio-browser.info/json/stations/topclick/20'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      List<RadioStation> radioStations = [];

      radioStations = data.map((e) => RadioStation.fromJson(e)).toList();

      return radioStations;
    } else {
      throw Exception('Server Error');
    }
  }
}
