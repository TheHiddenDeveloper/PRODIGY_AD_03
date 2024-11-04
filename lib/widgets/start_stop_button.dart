import 'package:flutter/material.dart';

class StartStopButton extends StatelessWidget {
  final bool isRunning;
  final VoidCallback onPressed;

  const StartStopButton({
    super.key,
    required this.isRunning,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: Colors.red,
      child: Icon(isRunning ? Icons.stop : Icons.play_circle, size: 56),
    );
  }
}
