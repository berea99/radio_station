import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:radio_station/theme/colors.dart';
import 'package:radio_station/theme/theme.dart';

class FrostedAppBar extends StatelessWidget {
  final String title;
  final List<Widget> actions;

  const FrostedAppBar({required this.title, required this.actions, super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: AppBar(
          backgroundColor: rsBlack.withOpacity(0.2),
          actions: actions,
          centerTitle: false,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: textTheme.titleLarge,
            ),
          ),
          elevation: 0.0,
        ),
      ),
    );
  }
}
