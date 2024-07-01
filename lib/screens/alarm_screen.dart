import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:my_clock/core/data.dart';
import 'package:my_clock/core/theme_data.dart';
import 'package:my_clock/services/app_notifications.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({super.key});

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  final appNotification = AppNotifications();

  Future<void> showAlarmBottomSheet() async {
    await showModalBottomSheet<StatefulBuilder>(
      useRootNavigator: true,
      context: context,
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  TextButton(
                    onPressed: () async {},
                    child: const Text(
                      '_alarmTimeString',
                      style: TextStyle(
                        fontSize: 32,
                      ),
                    ),
                  ),
                  const ListTile(
                    title: Text('Sound'),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                    ),
                  ),
                  const ListTile(
                    title: Text('Title'),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                    ),
                  ),
                  FloatingActionButton.extended(
                    onPressed: () {},
                    icon: const Icon(Icons.alarm),
                    label: const Text('Save'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 70, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ------------------------ `LABEL TITLE`
          Text(
            'Alarm',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: AppColors.primaryTextColor,
              fontSize: 24,
            ),
          ),

          /// ------------------------ `LIST`
          Expanded(
            child: ListView(
              children: [
                ...alarms.map<Widget>((alarm) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.fromLTRB(15, 8, 10, 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(colors: alarm.colors),
                      boxShadow: [
                        BoxShadow(
                          color: alarm.colors.first.withAlpha(100),
                          blurRadius: 6,
                          spreadRadius: 1,
                          offset: const Offset(4, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// `Title & Switch`
                        Row(
                          children: [
                            const Icon(Icons.label, color: Colors.white),
                            Text(
                              '  ${alarm.title}',
                              style: const TextStyle(color: Colors.white),
                            ),
                            const Spacer(),
                            Switch(
                              onChanged: (bool value) {},
                              value: true,
                              activeColor: Colors.white,
                            ),
                          ],
                        ),

                        /// `Date`
                        const Text(
                          'Mon-Fri',
                          style: TextStyle(color: Colors.white),
                        ),

                        /// `Time & Delete Btn`
                        Row(
                          children: [
                            const Text(
                              'alarmTime',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              color: Colors.white,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),

                /// ------------------------ `ADD ALARM Btn`
                DottedBorder(
                  strokeWidth: 1.5,
                  color: AppColors.clockOutline,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(16),
                  dashPattern: const [5, 4],
                  child: Ink(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.clockBG,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: InkWell(
                      onTap: appNotification.scheduleAlarm,
                      borderRadius: BorderRadius.circular(16),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: [
                            Image.asset('assets/add_alarm.png', scale: 1.5),
                            const SizedBox(height: 8),
                            const Text(
                              'Add Alarm',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
