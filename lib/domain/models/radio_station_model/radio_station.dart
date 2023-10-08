import 'package:freezed_annotation/freezed_annotation.dart';
part 'radio_station.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RadioStation {
  String? changeuuid;
  String? stationuuid;
  String? serveruuid;
  String? name;
  String? url;
  String? urlResolved;
  String? homepage;
  String? favicon;
  String? tags;
  String? country;
  String? countrycode;
  dynamic iso31662;
  String? state;
  String? language;
  String? languagecodes;
  int? votes;
  String? lastchangetime;
  String? lastchangetimeIso8601;
  String? codec;
  int? bitrate;
  int? hls;
  int? lastcheckok;
  String? lastchecktime;
  String? lastchecktimeIso8601;
  String? lastcheckoktime;
  String? lastcheckoktimeIso8601;
  String? lastlocalchecktime;
  String? lastlocalchecktimeIso8601;
  String? clicktimestamp;
  String? clicktimestampIso8601;
  int? clickcount;
  int? clicktrend;
  int? sslError;
  dynamic geoLat;
  dynamic geoLong;
  bool? hasExtendedInfo;

  RadioStation(
      {this.changeuuid,
      this.stationuuid,
      this.serveruuid,
      this.name,
      this.url,
      this.urlResolved,
      this.homepage,
      this.favicon,
      this.tags,
      this.country,
      this.countrycode,
      this.iso31662,
      this.state,
      this.language,
      this.languagecodes,
      this.votes,
      this.lastchangetime,
      this.lastchangetimeIso8601,
      this.codec,
      this.bitrate,
      this.hls,
      this.lastcheckok,
      this.lastchecktime,
      this.lastchecktimeIso8601,
      this.lastcheckoktime,
      this.lastcheckoktimeIso8601,
      this.lastlocalchecktime,
      this.lastlocalchecktimeIso8601,
      this.clicktimestamp,
      this.clicktimestampIso8601,
      this.clickcount,
      this.clicktrend,
      this.sslError,
      this.geoLat,
      this.geoLong,
      this.hasExtendedInfo});

  factory RadioStation.fromJson(Map<String, dynamic> json) =>
      _$RadioStationFromJson(json);

  Map<String, dynamic> toJson() => _$RadioStationToJson(this);
}
