import 'package:flutter/material.dart';
import 'package:radio_station/domain/models/radio_station_model/radio_station.dart';

Image getNetworkImage({required RadioStation station, double? width}) {
  var radioImage = station.favicon;
  return (radioImage != null && radioImage.isNotEmpty)
      ? Image.network(
          radioImage,
          height: width,
          loadingBuilder: (context, child, loadingProgress) =>
              (loadingProgress == null)
                  ? child
                  : const CircularProgressIndicator(),
          errorBuilder: (context, error, stackTrace) => Image.asset(
            'assets/images/sound-bars.png',
            width: width,
          ),
        )
      : Image.asset(
          'assets/images/sound-bars.png',
          width: width,
        );
}
