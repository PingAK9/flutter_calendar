import 'package:flutter/material.dart';
import 'package:date_utils/date_utils.dart';

class CalendarTile extends StatelessWidget {
  final VoidCallback onDateSelected;
  final DateTime date;
  final String dayOfWeek;
  final bool isDayOfWeek;
  final bool isSelected;
  final TextStyle dayOfWeekStyles;
  final TextStyle dateStyles;
  final Widget child;
  final Color colorSelectedDay;

  CalendarTile({
    this.onDateSelected,
    this.date,
    this.child,
    this.dateStyles,
    this.dayOfWeek,
    this.dayOfWeekStyles,
    this.isDayOfWeek: false,
    this.isSelected: false,
    this.colorSelectedDay
  });

  Widget renderDateOrDayOfWeek(BuildContext context) {
    if (isDayOfWeek) {
      return new InkWell(
        child: new Container(
          alignment: Alignment.center,
          child: new Text(
            dayOfWeek,
            style: dayOfWeekStyles,
          ),
        ),
      );
    } else {
      return new InkWell(
        onTap: onDateSelected,
        child: new Container(
          padding: const EdgeInsets.all(0),
          alignment: Alignment.center,
          child: 
              new Container(
                padding: const EdgeInsets.all(0),
                width: 40,
                height: 40,
                decoration: isSelected
                    ? new BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorSelectedDay ?? Colors.cyan[600],
                      )
                    : new BoxDecoration(),
                alignment: Alignment.center,
                child: new Text(
                  Utils.formatDay(date).toString(),
                  style: isSelected
                      ? Theme.of(context).primaryTextTheme.bodyText2
                      : dateStyles,
                  textAlign: TextAlign.center,
                )
              ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (child != null) {
      return new InkWell(
        child: child,
        onTap: onDateSelected,
      );
    }
    return new Container(
      child: renderDateOrDayOfWeek(context),
    );
  }
}
