import 'package:flutter/material.dart';
import '../widgets/timer_widget.dart';
import '../widgets/start_stop_button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Stopwatch _stopwatch = Stopwatch();
  bool _isRunning = false;

  void _toggleTimer() {
    setState(() {
      if (_isRunning) {
        _stopwatch.stop();
      } else {
        _stopwatch.start();
      }
      _isRunning = !_isRunning;
    });
  }

  void _resetTimer() {
    setState(() {
      _stopwatch.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TimerWidget(stopwatch: _stopwatch),  // Pass the stopwatch
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StartStopButton(
                  isRunning: _isRunning,
                  onPressed: _toggleTimer, // Toggle start/stop
                ),
                const SizedBox(width: 20),
                FloatingActionButton(
                  onPressed: _resetTimer, // Reset button logic
                  backgroundColor: Colors.blue, // Blue color
                  child: const Icon(Icons.refresh, size: 56), // Icon for reset
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
