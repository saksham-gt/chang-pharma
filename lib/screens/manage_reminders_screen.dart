import 'package:changpharma/notifiers/notifier.dart';
import 'package:changpharma/notifiers/states/set_reminder_states.dart';
import 'package:changpharma/utils/colors.dart';
import 'package:changpharma/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ManageRemindersScreen extends ConsumerStatefulWidget {
  const ManageRemindersScreen({super.key});

  @override
  ConsumerState<ManageRemindersScreen> createState() =>
      _ManageRemindersScreenState();
}

class _ManageRemindersScreenState extends ConsumerState<ManageRemindersScreen> {
  DateTime? _breakfastTime;
  DateTime? _lunchTime;
  DateTime? _dinnerTime;
  var setReminder = true;

  String get breakfastTime => DateFormat.jm()
      .format(_breakfastTime ??
          DateTime(
            DateTime.now().year,
            1,
            1,
            DateTime.now().hour,
            DateTime.now().minute,
          ))
      .toString();

  String get lunchTime =>
      DateFormat.jm().format(_lunchTime ?? DateTime.now()).toString();

  String get dinnerTime =>
      DateFormat.jm().format(_dinnerTime ?? DateTime.now()).toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'User Preferences',
          style: TextStyle(
            fontFamily: CPFont.fontFamily,
            fontSize: 28.0,
            color: SystemColors.mintCream,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: SystemColors.vanilla,
              ),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.0),
                      child: Icon(
                        Icons.info_outline,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Reminders can be set to notify you for taking your medicine at times specified by you.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          height: 1.5,
                          fontFamily: CPFont.fontFamily,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Breakfast',
                  style: TextStyle(
                    fontFamily: CPFont.fontFamily,
                    fontSize: 24.0,
                    color: SystemColors.mintCream,
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: SystemColors.mintCream),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: _breakfastTime != null
                      ? IntrinsicHeight(
                          child: Row(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: IconButton(
                                    onPressed: () =>
                                        updateBreakfastTime(decrement: true),
                                    icon: const Icon(
                                      Icons.remove,
                                      size: 24,
                                      color: SystemColors.mintCream,
                                    ),
                                  )),
                              const VerticalDivider(
                                color: SystemColors.mintCream,
                              ),
                              Text(
                                breakfastTime,
                                style: const TextStyle(
                                  fontFamily: CPFont.fontFamily,
                                  fontSize: 24.0,
                                  color: SystemColors.mintCream,
                                ),
                              ),
                              const VerticalDivider(
                                color: SystemColors.mintCream,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: IconButton(
                                  onPressed: () => updateBreakfastTime(),
                                  icon: const Icon(
                                    Icons.add,
                                    size: 24,
                                    color: SystemColors.mintCream,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : SizedBox(
                          width: 100,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              maximumSize: const Size.fromHeight(44),
                              minimumSize: const Size.fromHeight(44),
                            ),
                            onPressed: setBreakfastTimer,
                            child: const Text(
                              'Set',
                              style: TextStyle(
                                color: SystemColors.mintCream,
                                fontFamily: CPFont.fontFamily,
                                fontSize: 24.0,
                              ),
                            ),
                          ),
                        ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Lunch',
                  style: TextStyle(
                    fontFamily: CPFont.fontFamily,
                    fontSize: 24.0,
                    color: SystemColors.mintCream,
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: SystemColors.mintCream),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: _lunchTime != null
                      ? IntrinsicHeight(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: IconButton(
                                  onPressed: () =>
                                      updateLunchTime(decrement: true),
                                  icon: const Icon(
                                    Icons.remove,
                                    size: 24,
                                    color: SystemColors.mintCream,
                                  ),
                                ),
                              ),
                              const VerticalDivider(
                                color: SystemColors.mintCream,
                              ),
                              Text(
                                lunchTime,
                                style: const TextStyle(
                                  fontFamily: CPFont.fontFamily,
                                  fontSize: 24.0,
                                  color: SystemColors.mintCream,
                                ),
                              ),
                              const VerticalDivider(
                                color: SystemColors.mintCream,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: IconButton(
                                  onPressed: () => updateLunchTime(),
                                  icon: const Icon(
                                    Icons.add,
                                    size: 24,
                                    color: SystemColors.mintCream,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : SizedBox(
                          width: 100,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              maximumSize: const Size.fromHeight(44),
                              minimumSize: const Size.fromHeight(44),
                            ),
                            onPressed: setLunchTimer,
                            child: const Text(
                              'Set',
                              style: TextStyle(
                                color: SystemColors.mintCream,
                                fontFamily: CPFont.fontFamily,
                                fontSize: 24.0,
                              ),
                            ),
                          ),
                        ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Dinner',
                  style: TextStyle(
                    fontFamily: CPFont.fontFamily,
                    fontSize: 24.0,
                    color: SystemColors.mintCream,
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: SystemColors.mintCream),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: _dinnerTime != null
                      ? IntrinsicHeight(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: IconButton(
                                  onPressed: () =>
                                      updateDinnerTime(decrement: true),
                                  icon: const Icon(
                                    Icons.remove,
                                    size: 24,
                                    color: SystemColors.mintCream,
                                  ),
                                ),
                              ),
                              const VerticalDivider(
                                color: SystemColors.mintCream,
                              ),
                              Text(
                                dinnerTime,
                                style: const TextStyle(
                                  fontFamily: CPFont.fontFamily,
                                  fontSize: 24.0,
                                  color: SystemColors.mintCream,
                                ),
                              ),
                              const VerticalDivider(
                                color: SystemColors.mintCream,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: IconButton(
                                  onPressed: () => updateDinnerTime(),
                                  icon: const Icon(
                                    Icons.add,
                                    size: 24,
                                    color: SystemColors.mintCream,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : SizedBox(
                          width: 100,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              maximumSize: const Size.fromHeight(44),
                              minimumSize: const Size.fromHeight(44),
                            ),
                            onPressed: setDinnerTimer,
                            child: const Text(
                              'Set',
                              style: TextStyle(
                                color: SystemColors.mintCream,
                                fontFamily: CPFont.fontFamily,
                                fontSize: 24.0,
                              ),
                            ),
                          ),
                        ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Set Reminders',
                  style: TextStyle(
                    fontFamily: CPFont.fontFamily,
                    fontSize: 24.0,
                    color: SystemColors.mintCream,
                  ),
                ),
                CupertinoSwitch(
                    value: setReminder,
                    onChanged: (value) {
                      setState(() {
                        setReminder = !setReminder;
                      });
                    }),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(60),
              ),
              onPressed: updateReminderTimes,
              child: const Text(
                'Set reminder',
                style: TextStyle(
                  color: SystemColors.mintCream,
                  fontFamily: CPFont.fontFamily,
                  fontSize: 24.0,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void setBreakfastTimer() {
    setState(() {
      _breakfastTime = DateTime(DateTime.now().year, 1, 1, DateTime.now().hour);
    });
  }

  void setLunchTimer() {
    setState(() {
      _lunchTime = DateTime(DateTime.now().year, 1, 1, DateTime.now().hour);
    });
  }

  void setDinnerTimer() {
    setState(() {
      _dinnerTime = DateTime(DateTime.now().year, 1, 1, DateTime.now().hour);
    });
  }

  void updateBreakfastTime({bool decrement = false}) {
    setState(
      () {
        if (decrement) {
          _breakfastTime = (_breakfastTime ??
                  DateTime(DateTime.now().year, 1, 1, DateTime.now().hour))
              .subtract(const Duration(minutes: 30));
        } else {
          _breakfastTime = (_breakfastTime ??
                  DateTime(DateTime.now().year, 1, 1, DateTime.now().hour))
              .add(const Duration(minutes: 30));
        }
      },
    );
  }

  void updateLunchTime({bool decrement = false}) {
    setState(
      () {
        if (decrement) {
          _lunchTime = (_lunchTime ??
                  DateTime(DateTime.now().year, 1, 1, DateTime.now().hour))
              .subtract(const Duration(minutes: 30));
        } else {
          _lunchTime = (_lunchTime ??
                  DateTime(DateTime.now().year, 1, 1, DateTime.now().hour))
              .add(const Duration(minutes: 30));
        }
      },
    );
  }

  void updateDinnerTime({bool decrement = false}) {
    setState(
      () {
        if (decrement) {
          _dinnerTime = (_dinnerTime ??
                  DateTime(DateTime.now().year, 1, 1, DateTime.now().hour))
              .subtract(const Duration(minutes: 30));
        } else {
          _dinnerTime = (_dinnerTime ??
                  DateTime(DateTime.now().year, 1, 1, DateTime.now().hour))
              .add(const Duration(minutes: 30));
        }
      },
    );
  }

  void updateReminderTimes() {
    final setReminderInProgress = ref.watch(setReminderNotifier
        .select((value) => value is OnSetReminderInProgress));
    final setReminderSuccessful = ref.watch(
        setReminderNotifier.select((value) => value is OnSetReminderSuccess));
    if (!setReminderInProgress) {
      ref
          .read(setReminderNotifier.notifier)
          .set([_breakfastTime, _lunchTime, _dinnerTime]);
    }
    if (setReminderInProgress) {
      return;
    } else if (setReminderSuccessful) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Setting reminder successful!"),
        ),
      );
      Navigator.of(context).pop();
    }
  }
}
