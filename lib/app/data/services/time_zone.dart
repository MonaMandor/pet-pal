
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class TimeZone {
  factory TimeZone() => _this ?? TimeZone._();

  TimeZone._() {
    tz.initializeTimeZones();
  }
  static TimeZone? _this;

  Future<String> getTimeZoneName() async =>
      tz.local != null ? tz.local.name : 'UTC';

  Future<tz.Location> getLocation([String? timeZoneName]) async {
    if (timeZoneName == null || timeZoneName.isEmpty) {
      timeZoneName = await getTimeZoneName();
    }
    return tz.getLocation(timeZoneName);
  }
}
