import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_station/domain/models/radio_station_model/radio_station.dart';
import 'package:radio_station/routes/router.gr.dart';
import 'package:radio_station/theme/app_constants.dart';
import 'package:radio_station/theme/colors.dart';
import 'package:radio_station/theme/theme.dart';
import 'package:radio_station/theme/widgets/frosted_app_bar.dart';
import 'package:radio_station/ui/radio_stations/logic/radio_stations_cubit.dart';
import 'package:radio_station/utils/image_utils.dart';

@RoutePage()
class RadioStationsScreenWithCubit extends StatelessWidget {
  const RadioStationsScreenWithCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RadioStationsCubit()..initialize(),
      child: const RadioStationsScreen(),
    );
  }
}

class RadioStationsScreen extends StatefulWidget {
  const RadioStationsScreen({super.key});

  @override
  State<RadioStationsScreen> createState() => _RadioStationsScreenState();
}

class _RadioStationsScreenState extends State<RadioStationsScreen> {
  double screenHeight = 0;
  double screenWidth = 0;

  bool startAnimation = false;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: loading
          ? null
          : IconButton(
              iconSize: 50,
              onPressed: () => context.read<RadioStationsCubit>().initialize(),
              icon: const CircleAvatar(
                  radius: 50,
                  backgroundColor: rsRed,
                  child: Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ))),
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          preferredSize: const Size(
            double.infinity,
            56.0,
          ),
          child: FrostedAppBar(
            title: 'Hello',
            actions: [Image.asset('assets/images/logo.png')],
          )),
      body: SafeArea(
        top: false,
        child: BlocConsumer<RadioStationsCubit, RadioStationsState>(
            builder: ((context, state) {
          return state.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: loadedScreenGrid,
              error: errorScreen);
        }), listener: ((context, state) {
          if (state is RadioStationsLoaded) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              setState(() {
                startAnimation = true;
                loading = false;
              });
            });
          } else if (state is RadioStationsStateLoading) {
            setState(() {
              loading = true;
              startAnimation = false;
            });
          } else {
            setState(() {
              loading = false;
            });
          }
        })),
      ),
    );
  }

  Widget loadedScreenGrid(List<RadioStation> radioStations) {
    return Center(
        child: GridView.count(
            childAspectRatio: 0.75,
            crossAxisCount: 2,
            children: List.generate(radioStations.length,
                (index) => itemGrid(index, radioStations))));
  }

  Widget errorScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error,
            color: rsRed,
            size: 50,
          ),
          AppSpacingVertical.medium,
          Text(
            'Server Error',
            style: textTheme.titleMedium,
          ),
        ],
      ),
    );
  }

  Widget itemGrid(int index, List<RadioStation> radioStations) {
    final station = radioStations[index];
    return AnimatedContainer(
      height: 500,
      width: screenWidth,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 800 + (index * 100)),
      transform:
          Matrix4.translationValues(startAnimation ? 0 : screenWidth, 0, 0),
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      child: GestureDetector(
        child: Hero(
          tag: station.name ?? 'tag',
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: Colors.transparent,
            elevation: 10,
            shape: const RoundedRectangleBorder(
                side: BorderSide(color: rsGrey),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/image_$index.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: getNetworkImage(station: station, width: 20),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black,
                          Colors.black.withOpacity(0.7),
                          Colors.transparent,
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.center,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: ListTile(
                        title: Text(
                          station.name ?? '',
                          style: textTheme.titleMedium,
                        ),
                        subtitle: Text(
                          station.country ?? '',
                          style: textTheme.titleSmall,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          context.router.push(RadioPlayerScreenRoute(
              radioStationList: radioStations,
              selectedRadioStation: station,
              initialIndex: index));
        },
      ),
    );
  }
}
