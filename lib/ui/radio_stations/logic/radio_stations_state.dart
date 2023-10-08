part of 'radio_stations_cubit.dart';

@freezed
abstract class RadioStationsState with _$RadioStationsState {
  const factory RadioStationsState.loading() = RadioStationsStateLoading;
  const factory RadioStationsState.loaded(List<RadioStation> radioStations) =
      RadioStationsLoaded;
  const factory RadioStationsState.error() = RadioStationsError;
}
