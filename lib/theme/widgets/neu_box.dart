import 'package:flutter/material.dart';
import 'package:radio_station/theme/colors.dart';

// ignore: must_be_immutable
class NeuBoxGesture extends StatefulWidget {
  Widget child;
  Function onTap;
  NeuBoxGesture({Key? key, required this.child, required this.onTap})
      : super(key: key);

  @override
  State<NeuBoxGesture> createState() => _NeuBoxState();
}

class _NeuBoxState extends State<NeuBoxGesture> {
  bool tap = false;

  @override
  Widget build(BuildContext context) {
    return tap ? onTapUI() : ui();
  }

  Widget ui() {
    return GestureDetector(
      onTap: () async {
        setState(() {
          tap = true;
          widget.onTap.call();
        });
        await Future.delayed(const Duration(milliseconds: 250));
        setState(() {
          tap = false;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: rsBlack,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFF263443),
              blurRadius: 15,
              offset: Offset(5, 5),
            ),
            BoxShadow(
              color: Color(0xFF1c2631),
              blurRadius: 15,
              offset: Offset(-5, -5),
            ),
          ],
        ),
        child: Center(child: widget.child),
      ),
    );
  }

  Widget onTapUI() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Center(child: widget.child),
    );
  }
}

// ignore: must_be_immutable
class NeuBoxBasic extends StatelessWidget {
  Widget child;
  NeuBoxBasic({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: rsBlack,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF263443),
            blurRadius: 15,
            offset: Offset(5, 5),
          ),
          BoxShadow(
            color: Color(0xFF1c2631),
            blurRadius: 15,
            offset: Offset(-5, -5),
          ),
        ],
      ),
      child: Center(child: child),
    );
  }
}
