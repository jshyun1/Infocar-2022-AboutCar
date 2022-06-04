import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> showNotification() async {
  var android = const AndroidNotificationDetails('channelId', 'channelName',
      channelDescription: 'channelDescription');
  var iOS = IOSNotificationDetails();
  var platform = NotificationDetails(android: android, iOS: iOS);

  await FlutterLocalNotificationsPlugin().schedule(
      0,
      '\u{1F6A8}내 차량 고장이 예측되었어요\u{1F6A8}',
      '지금 확인 하러 가기',
      DateTime.parse('2022-06-04 02:51:00'),
      platform);
}
