import 'dart:async';
import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  final Stopwatch stopwatch; // Stopwatch passed from parent

  const TimerWidget({Key? key, required this.stopwatch}) : super(key: key);

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late Timer _timer;
  String _formattedTime = "00:00:00:000";

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      setState(() {
        _formattedTime = _formatTime(widget.stopwatch.elapsedMilliseconds);
      });
    });
  }

  String _formatTime(int milliseconds) {
    int hours = (milliseconds ~/ (1000 * 60 * 60)) % 24;
    int minutes = (milliseconds ~/ (1000 * 60)) % 60;
    int seconds = (milliseconds ~/ 1000) % 60;
    int ms = milliseconds % 1000;

    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}:${ms.toString().padLeft(3, '0')}';
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _formattedTime,
      style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
    );
  }
}
