import 'package:changpharma/notifiers/notifier.dart';
import 'package:changpharma/notifiers/states/set_reminder_states.dart';
import 'package:changpharma/utils/colors.dart';
import 'package:changpharma/utils/theme.dart';
import 'package:changpharma/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class UserPreferencesScreen extends ConsumerStatefulWidget {
  const UserPreferencesScreen({super.key});

  @override
  ConsumerState<UserPreferencesScreen> createState() =>
      UserPreferencesScreenState();
}

class UserPreferencesScreenState extends ConsumerState<UserPreferencesScreen> {
  DateTime? _breakfastTime;
  DateTime? _lunchTime;
  DateTime? _dinnerTime;
  // var setReminder = true;

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

  parseTime(DateTime time) => DateFormat.jm().format(time).toString();

  @override
  Widget build(BuildContext context) {

    ref.watch(setReminderNotifier);
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
                                selfUser.defaultMealTime!=null?parseTime(selfUser.defaultMealTime!.dinner):_dinnerTime,
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
                  'Enable Reminders',
                  style: TextStyle(
                    fontFamily: CPFont.fontFamily,
                    fontSize: 24.0,
                    color: SystemColors.mintCream,
                  ),
                ),
                CupertinoSwitch(
                    value: ref.watch(toggleReminderNotifier.notifier.select((value) => value.enableReminder)),
                    onChanged: (value) {
                        toggleReminderState(selfUser.enableReminder);
                    }),
              ],
            ),
            const Spacer(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void setBreakfastTimer() {
      _breakfastTime = DateTime(DateTime.now().year, 1, 1, DateTime.now().hour);
updateReminderTimes();
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
        if (decrement) {
          _breakfastTime = (_breakfastTime ??
                  DateTime(DateTime.now().year, 1, 1, DateTime.now().hour))
              .subtract(const Duration(minutes: 30));
        } else {
          _breakfastTime = (_breakfastTime ??
                  DateTime(DateTime.now().year, 1, 1, DateTime.now().hour))
              .add(const Duration(minutes: 30));
        }
updateReminderTimes();
  }

  void updateLunchTime({bool decrement = false}) {
        if (decrement) {
          _lunchTime = (_lunchTime ??
                  DateTime(DateTime.now().year, 1, 1, DateTime.now().hour))
              .subtract(const Duration(minutes: 30));
        } else {
          _lunchTime = (_lunchTime ??
                  DateTime(DateTime.now().year, 1, 1, DateTime.now().hour))
              .add(const Duration(minutes: 30));
        }
    updateReminderTimes();
  }

  void updateDinnerTime({bool decrement = false}) {
        if (decrement) {
          _dinnerTime = (_dinnerTime ??
                  DateTime(DateTime.now().year, 1, 1, DateTime.now().hour))
              .subtract(const Duration(minutes: 30));
              ref.read(setReminderNotifier.notifier).set([_breakfastTime!, _lunchTime!, _dinnerTime!]);
        } else {
          _dinnerTime = (_dinnerTime ??
                  DateTime(DateTime.now().year, 1, 1, DateTime.now().hour))
              .add(const Duration(minutes: 30));
        }
        updateReminderTimes();
  }

  void updateReminderTimes() {
    final setReminderInProgress = ref.watch(setReminderNotifier
        .select((value) => value is OnReminderChangeInProgress));
    final setReminderSuccessful = ref.watch(
        setReminderNotifier.select((value) => value is OnReminderChangeSuccess));
    if (!setReminderInProgress) {
      ref
          .read(setReminderNotifier.notifier)
          .set([_breakfastTime!, _lunchTime!, _dinnerTime!]);
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

  void toggleReminderState(bool enableReminder){
    ref.read(toggleReminderNotifier.notifier).toggleReminderState(enableReminder);
  }
}
