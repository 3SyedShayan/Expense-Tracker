import 'package:flutter/material.dart';

class ChartBar2 extends StatefulWidget {
  ChartBar2({super.key, required this.fill});

  var fill = 0.0;
  @override
  State<ChartBar2> createState() => _ChartBar2State();
}

class _ChartBar2State extends State<ChartBar2> {
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
