import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:radio_station/data/repository/radio_repository.dart';
import 'package:radio_station/domain/models/radio_station_model/radio_station.dart';

part 'radio_stations_state.dart';
part 'radio_stations_cubit.freezed.dart';

class RadioStationsCubit extends Cubit<RadioStationsState> {
  RadioStationsCubit() : super(const RadioStationsState.loading());

  RadioRepository radioRepository = RadioRepository();

  void initialize() async {
    emit(const RadioStationsState.loading());
    try {
      var radioStations = await radioRepository.fetchRadioStations();
      emit(RadioStationsState.loaded(radioStations));
    } catch (e) {
      emit(const RadioStationsState.error());
    }
  }
}
