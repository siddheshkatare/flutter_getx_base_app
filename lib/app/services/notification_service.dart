// import 'dart:convert';

// import 'package:around_you/constants/string_constants.dart';
// import 'package:around_you/data/enums/home_view_enum.dart';
// import 'package:around_you/data/enums/notification_enum.dart';
// import 'package:around_you/data/models/profile_details/hint_model.dart';
// import 'package:around_you/data/models/profile_details/wave_model.dart';
// import 'package:around_you/data/repositories/auth_repository.dart';
// import 'package:around_you/utils/log_utils.dart';
// import 'package:around_you/utils/router_utils.dart';
// import 'package:around_you/utils/snackbar_utils.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:go_router/go_router.dart';

// class NotificationService {
//   static String notificationId = 'notification_id_0';
//   FirebaseMessaging? messaging;
//   late NotificationSettings settings;
//   String? token;

//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   static const AndroidNotificationChannel channel = AndroidNotificationChannel(
//     'high_importance_channel', // id
//     'High Importance Notifications', // title
//     description:
//         'This channel is used for important notifications.', // description
//     importance: Importance.max,
//   );

//   Future<void> initialize() async {
//     messaging = FirebaseMessaging.instance;
//     await messaging!.setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );

//     settings = await messaging!.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );

//     final token = await getToken();

//     if (token != null) {
//       await AuthRepository().updateFcmToken(fcmToken: token);
//     }

//     FirebaseMessaging.instance.onTokenRefresh.listen((newToken) async {
//       LogUtils.print('New token: $newToken');
//       await AuthRepository().updateFcmToken(fcmToken: newToken);
//     });

//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);

//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     const InitializationSettings initializationSettings =
//         InitializationSettings(android: initializationSettingsAndroid);

//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse: (NotificationResponse response) {
//         LogUtils.print('Notification tapped!');
//         if (response.payload != null) {
//           final payload = jsonDecode(response.payload!);
//           _handleClickAction(payload);
//           LogUtils.print('Payload: $payload');
//         }
//       },
//     );

//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       _handleMessage(message);
//     });

//     LogUtils.print('User granted permission: ${settings.authorizationStatus}');
//   }

//   Future<String?> getToken() async {
//     LogUtils.print('getToken');
//     if (kIsWeb) {
//       LogUtils.print('isWeb');
//       token = await messaging!.getToken(
//         vapidKey: dotenv.env['VAPID_KEY'],
//       );
//     } else {
//       LogUtils.print('isNotWeb');
//       token = await messaging!.getToken();
//     }
//     LogUtils.print(token);
//     return token;
//   }

//   static Future<void> firebaseMessagingBackgroundHandler(
//     RemoteMessage message,
//   ) async {
//     await Firebase.initializeApp();
//     LogUtils.print("Handling a background message: ${message.messageId}");
//   }

//   Future<void> setupInteractedMessage() async {
//     RemoteMessage? initialMessage =
//         await FirebaseMessaging.instance.getInitialMessage();
//     if (initialMessage != null) {
//       _handleMessage(initialMessage);
//     }
//     FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
//   }

//   void _handleMessage(RemoteMessage message) {
//     RemoteNotification? notification = message.notification;

//     final Map<String, dynamic> data = message.data;

//     if (notification != null) {
//       LogUtils.print('Message title: ${notification.title}');
//       LogUtils.print('Message body: ${notification.body}');
//     }

//     if (data.isNotEmpty) {
//       LogUtils.print('Data: ${jsonEncode(data)}');
//       LogUtils.print('Data type: ${data['type']}');
//       LogUtils.print('Data hint: ${data['hint']}');
//       LogUtils.print('Data wave: ${data['wave']}');
//     }

//     if (notification != null && data.isNotEmpty) {
//       _displayNotification(
//         notification: notification,
//         actionLabel: StringConstants.view,
//         payload: data,
//       );
//       // if (data['type'] == NotificationTypeEnum.hint.name) {

//       // }
//     }
//   }

//   void _displayNotification(
//       {required RemoteNotification notification,
//       String? actionLabel,
//       Map<String, dynamic>? payload}) {
//     if (kIsWeb) {
//       SnackbarUtils.showSnackbar(
//         message: '${notification.title} \n${notification.body}',
//         type: SnackbarTypes.info,
//         onPressed: payload == null ? null : () => _handleClickAction(payload),
//         actionLabel: actionLabel,
//         duration: const Duration(seconds: 8),
//       );
//     } else {
//       AndroidNotificationDetails? androidNotificationDetails;
//       DarwinNotificationDetails? darwinNotificationDetails;

//       if (notification.android != null) {
//         androidNotificationDetails = AndroidNotificationDetails(
//           channel.id,
//           channel.name,
//           channelDescription: channel.description,
//           icon: notification.android!.smallIcon,
//           actions: actionLabel == null
//               ? null
//               : [
//                   AndroidNotificationAction(
//                     getNextNotificationId(),
//                     actionLabel,
//                     showsUserInterface: true,
//                   ),
//                 ],
//         );
//       }

//       if (notification.apple != null) {
//         darwinNotificationDetails = const DarwinNotificationDetails(
//           presentAlert: true,
//           presentBadge: true,
//           presentSound: true,
//         );
//       }

//       flutterLocalNotificationsPlugin.show(
//         notification.hashCode,
//         notification.title,
//         notification.body,
//         NotificationDetails(
//           android: androidNotificationDetails,
//           iOS: darwinNotificationDetails,
//         ),
//         payload: payload == null ? null : jsonEncode(payload),
//       );
//     }
//   }

//   void _handleClickAction(Map<String, dynamic>? payload) {
//     if (payload != null) {
//       if (payload['type'] == NotificationTypeEnum.chat.name) {
//         Get.toNamed(Routes.CHAT, arguments: payload);
//       }
//     }
//   }

//   static String getNextNotificationId({String? type, String? id}) {
//     if (type == null && id == null) {
//       String nextId = notificationId.split('_').last;
//       int id = int.parse(nextId) + 1;
//       return 'around_you_$id';
//     } else {
//       return '${type}_$id';
//     }
//   }

//   /// **Open the file when notification is tapped**
// }
