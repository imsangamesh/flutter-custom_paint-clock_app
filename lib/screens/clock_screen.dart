import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_clock/widgets/my_clock.dart';

class ClockScreen extends StatelessWidget {
  const ClockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formattedTime = DateFormat('HH:mm').format(now);
    final formattedDate = DateFormat('EEE, d MMM').format(now);
    final timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) offsetSign = '+';

    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// `Label`
          const Flexible(
            fit: FlexFit.tight,
            child: Text(
              'Clock',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),

          /// `Date & Time`
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  formattedTime,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 64,
                    height: 1.1,
                  ),
                ),
                Text(
                  ' $formattedDate',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),

          /// `Clock`
          const Flexible(
            flex: 4,
            child: Align(child: MyClock()),
          ),

          /// `Timezone`
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Timezone',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    const Icon(
                      Icons.language,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'UTC$offsetSign$timezoneString',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
