import 'package:flutter/material.dart';

class ChartBar extends StatefulWidget {
  ChartBar({super.key, required this.fill});

  var fill = 0.0;
  @override
  State<ChartBar> createState() => _ChartBar2State();
}

class _ChartBar2State extends State<ChartBar> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FractionallySizedBox(
        alignment: Alignment.bottomCenter,
        heightFactor: widget.fill,
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.deepPurple),
        ),
      ),
    );
  }
}
