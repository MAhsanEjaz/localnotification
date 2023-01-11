import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notification_prac/providers/cart_provider.dart';
import 'package:notification_prac/providers/new_product_provider.dart';
import 'package:notification_prac/theame_provider/theame_provider.dart';
import 'package:provider/provider.dart';
import 'screens/email_send_screen.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'High Importance Channel',
  'High Importance Notifications',
  importance: Importance.high,
  playSound: true,
  enableLights: true,
  showBadge: true,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('background---->${message}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, badge: true, sound: true);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
      RemoteNotification notification = message!.notification!;
      AndroidNotification androidNotification = message.notification!.android!;

      if (notification != null && androidNotification != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
                android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              playSound: true,
              color: Colors.pink,
              icon: '@mipmap/ic_launcher',
            )));
      }

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        print('message--->${message}');
        RemoteNotification notification = message.notification!;
        AndroidNotification android = message.notification!.android!;

        if (notification != null && android != null) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [Text(notification.body!)],
                    ),
                  ));
        }
      });
    });
  }

  int _counter = 1;

  void showNotification() {
    _counter++;
    print(_counter);
    setState(() {});
    flutterLocalNotificationsPlugin.show(
        0,
        "Testing${_counter}",
        "What are you Doing",
        NotificationDetails(
            android: AndroidNotificationDetails(channel.id, channel.name,
                importance: Importance.high,
                icon: '@mipmap/ic_launcher',
                playSound: true,
                color: Colors.pink)));
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NewProductProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => ThemeNotifier()),
      ],
      child: Consumer<ThemeNotifier>(builder: (context, data, _) {
        return MaterialApp(
          theme: data.darkTheme ? dark : light,
          // home: MyProductScreen(),
          // home: WrapScreen(),
          home: EmailSendScreen(),
          // home: ImagePickScreen(),
          // home: SettingScreen(),
        );
      }),
    );
  }
}
