import 'package:fifth_exam/app/app.dart';
import 'package:fifth_exam/app/bloc_observer.dart';
import 'package:fifth_exam/data/database/loacal_databse.dart';
import 'package:fifth_exam/data/models/breaking_news/breaking_news_model.dart';
import 'package:fifth_exam/utils/my_locale.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  var messages = message.data.values.map((e) => e);
  await LocalDatabase.addBreakingNews(
    BreakingNewsModel(
      dateTime: DateTime.now().toString(),
      description: message.notification!.body.toString(),
      newsImage: message.notification!.body.toString(),
      newsTitle: message.notification!.title.toString(),
    ),
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await FirebaseMessaging.instance.subscribeToTopic("news");
  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    var messages = message.data.values.map((e) => e);
    await LocalDatabase.addBreakingNews(
      BreakingNewsModel(
        dateTime: DateTime.now().toString(),
        description: message.notification!.body.toString(),
        newsImage: message.notification!.body.toString(),
        newsTitle: message.notification!.title.toString(),
      ),
    );
  });
  Bloc.observer = AppBlocObserver();
  setUp();
  runApp(const App());
}
