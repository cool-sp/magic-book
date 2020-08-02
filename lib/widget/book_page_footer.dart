import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../util/battery.dart';

Text pagefootText(String text, {double fontSize = 10}) {
  return Text(
    text,
    style: TextStyle(
        fontSize: fontSize,
        fontFamily: 'PingFang',
        fontWeight: FontWeight.normal,
        decoration: TextDecoration.none,
        color: Colors.grey),
  );
}

Icon pagefootIcon(IconData data, {double height = 20}) {
  return Icon(data, size: height, color: Colors.grey);
}

class BatteryIcon extends StatelessWidget {
  final Battery _battery = Battery();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _battery.batteryStateStream,
      initialData: BatteryState.unknown,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) return pagefootIcon(Icons.battery_unknown);
        switch (snapshot.data) {
          case BatteryState.unknown:
            return pagefootIcon(Icons.battery_unknown);
          case BatteryState.unplugged:
            return pagefootIcon(Icons.battery_std);
          case BatteryState.charging:
            return pagefootIcon(Icons.battery_charging_full);
          case BatteryState.full:
            return pagefootIcon(Icons.battery_full);
          default:
            return pagefootIcon(Icons.battery_unknown);
        }
      },
    );
  }
}

class BatteryLevelText extends StatelessWidget {
  final Battery _battery = Battery();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _battery.batteryLevelStream,
      initialData: 0,
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        if (!snapshot.hasData || snapshot.data <= 0) return pagefootText('??%');
        return pagefootText('${snapshot.data}%');
      },
    );
  }
}

class TimeIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final clock = Stream<DateTime>.periodic(const Duration(seconds: 1), (_) {
      return DateTime.now();
    });

    return StreamBuilder(
      stream: clock,
      builder: (BuildContext context, AsyncSnapshot<DateTime> snapshot) {
        return pagefootText(DateFormat.jm().format(DateTime.now()));
      },
    );
  }
}

class BookPageFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        BatteryIcon(),
        BatteryLevelText(),
        Expanded(child: Container()),
        TimeIndicator(),
      ],
    );
  }
}
