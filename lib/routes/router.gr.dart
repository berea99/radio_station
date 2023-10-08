// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i5;
import 'package:radio_station/domain/models/radio_station_model/radio_station.dart'
    as _i4;
import 'package:radio_station/ui/radio_player/view/radio_player_screen.dart'
    as _i1;
import 'package:radio_station/ui/radio_stations/view/radio_stations_screen.dart'
    as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    RadioPlayerScreenRoute.name: (routeData) {
      final args = routeData.argsAs<RadioPlayerScreenRouteArgs>();
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.RadioPlayerScreen(
          radioStationList: args.radioStationList,
          selectedRadioStation: args.selectedRadioStation,
          initialIndex: args.initialIndex,
          key: args.key,
        ),
      );
    },
    RadioStationsScreenWithCubitRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.RadioStationsScreenWithCubit(),
      );
    },
  };
}

/// generated route for
/// [_i1.RadioPlayerScreen]
class RadioPlayerScreenRoute
    extends _i3.PageRouteInfo<RadioPlayerScreenRouteArgs> {
  RadioPlayerScreenRoute({
    required List<_i4.RadioStation> radioStationList,
    required _i4.RadioStation selectedRadioStation,
    required int initialIndex,
    _i5.Key? key,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          RadioPlayerScreenRoute.name,
          args: RadioPlayerScreenRouteArgs(
            radioStationList: radioStationList,
            selectedRadioStation: selectedRadioStation,
            initialIndex: initialIndex,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'RadioPlayerScreenRoute';

  static const _i3.PageInfo<RadioPlayerScreenRouteArgs> page =
      _i3.PageInfo<RadioPlayerScreenRouteArgs>(name);
}

class RadioPlayerScreenRouteArgs {
  const RadioPlayerScreenRouteArgs({
    required this.radioStationList,
    required this.selectedRadioStation,
    required this.initialIndex,
    this.key,
  });

  final List<_i4.RadioStation> radioStationList;

  final _i4.RadioStation selectedRadioStation;

  final int initialIndex;

  final _i5.Key? key;

  @override
  String toString() {
    return 'RadioPlayerScreenRouteArgs{radioStationList: $radioStationList, selectedRadioStation: $selectedRadioStation, initialIndex: $initialIndex, key: $key}';
  }
}

/// generated route for
/// [_i2.RadioStationsScreenWithCubit]
class RadioStationsScreenWithCubitRoute extends _i3.PageRouteInfo<void> {
  const RadioStationsScreenWithCubitRoute({List<_i3.PageRouteInfo>? children})
      : super(
          RadioStationsScreenWithCubitRoute.name,
          initialChildren: children,
        );

  static const String name = 'RadioStationsScreenWithCubitRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
