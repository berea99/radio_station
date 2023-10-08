import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:radio_player/radio_player.dart';
import 'package:radio_station/domain/models/radio_station_model/radio_station.dart';
import 'package:radio_station/theme/app_constants.dart';
import 'package:radio_station/theme/colors.dart';
import 'package:radio_station/theme/theme.dart';
import 'package:radio_station/theme/widgets/neu_box.dart';
import 'package:radio_station/utils/image_utils.dart';
import 'package:volume_controller/volume_controller.dart';

@RoutePage()
class RadioPlayerScreen extends StatefulWidget {
  const RadioPlayerScreen(
      {required this.radioStationList,
      required this.selectedRadioStation,
      required this.initialIndex,
      super.key});

  final RadioStation selectedRadioStation;
  final List<RadioStation> radioStationList;
  final int initialIndex;

  @override
  State<RadioPlayerScreen> createState() => _RadioPlayerScreenState();
}

class _RadioPlayerScreenState extends State<RadioPlayerScreen>
    with TickerProviderStateMixin {
  late AnimationController _lottieController;
  CarouselController carouselController = CarouselController();
  VolumeController volumeController = VolumeController();
  final RadioPlayer _radioPlayer = RadioPlayer();

  late RadioStation _actualRadioStation;
  double _volumeListenerValue = 0;
  List<String>? metadata;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    //Initialize lottie
    _lottieController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
    _lottieController.stop();

    _actualRadioStation = widget.selectedRadioStation;

    initRadioPlayer();

    volumeController.listener((volume) {
      setState(() => _volumeListenerValue = volume);
    });
  }

  void initRadioPlayer() {
    _radioPlayer.setChannel(
      title: _actualRadioStation.name ?? "",
      url: _actualRadioStation.url ?? "",
    );

    _radioPlayer.stateStream.listen((value) {
      setState(() {
        isPlaying = value;
      });
    });

    _radioPlayer.metadataStream.listen((value) {
      setState(() {
        metadata = value;
      });
    });
  }

  @override
  void dispose() {
    volumeController.removeListener();
    _radioPlayer.stop();
    _lottieController.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: rsBlack.withOpacity(0.2),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            CarouselSlider(
              carouselController: carouselController,
              items: widget.radioStationList
                  .asMap()
                  .entries
                  .map(
                    (entry) => Hero(
                      tag: entry.value.name ?? 'tag',
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 200,
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Image.asset(
                                  'assets/images/image_${entry.key}.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: getNetworkImage(
                                    station: entry.value, width: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                initialPage: widget.initialIndex,
                viewportFraction: 0.6,
                aspectRatio: 1.5,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    //Update the radio station that we are listening to
                    _actualRadioStation = widget.radioStationList[index];

                    _radioPlayer.stop();
                    initRadioPlayer();
                    _radioPlayer.play();
                  });
                },
              ),
            ),
            AppSpacingVertical.medium,
            Text(
              _actualRadioStation.name ?? '',
              style: textTheme.titleLarge,
            ),
            AppSpacingVertical.medium,
            SizedBox(
                height: 100,
                child: Lottie.asset('assets/lotties/sound.json',
                    controller: _lottieController, fit: BoxFit.cover)),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        NeuBoxGesture(
                            child: Icon(_volumeListenerValue == 0
                                ? Icons.volume_off
                                : Icons.volume_up),
                            onTap: () {
                              if (_volumeListenerValue == 0) {
                                setState(() {
                                  _volumeListenerValue = 1;
                                });
                                volumeController.maxVolume();
                              } else {
                                setState(() {
                                  _volumeListenerValue = 0;
                                });
                                volumeController.muteVolume();
                              }
                            }),
                        AppSpacingHorizontal.small,
                        Expanded(
                          child: NeuBoxBasic(
                              child: Slider(
                                  value: _volumeListenerValue,
                                  onChanged: (newVolume) {
                                    setState(() {
                                      _volumeListenerValue = newVolume;
                                    });
                                    volumeController.setVolume(newVolume);
                                  })),
                        ),
                      ],
                    ),
                  ),
                  AppSpacingVertical.medium,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 80,
                      child: Row(
                        children: [
                          Expanded(
                            child: NeuBoxGesture(
                              child: const Icon(
                                Icons.skip_previous,
                                size: 32,
                              ),
                              onTap: () {
                                carouselController.previousPage();
                              },
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: NeuBoxGesture(
                                  child: Icon(
                                    isPlaying ? Icons.pause : Icons.play_arrow,
                                    size: 32,
                                  ),
                                  onTap: () {
                                    if (isPlaying) {
                                      _radioPlayer.pause();
                                      _lottieController.stop();
                                    } else {
                                      _radioPlayer.play();
                                      _lottieController.repeat();
                                    }
                                  }),
                            ),
                          ),
                          Expanded(
                            child: NeuBoxGesture(
                                child: const Icon(
                                  Icons.skip_next,
                                  size: 32,
                                ),
                                onTap: () {
                                  carouselController.nextPage();
                                }),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
