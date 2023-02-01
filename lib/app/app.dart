import 'package:fifth_exam/data/repositories/news_repository.dart';
import 'package:fifth_exam/data/services/api_service/api_service.dart';
import 'package:fifth_exam/state_manegers/cubit/connectivity/connectivity_cubit.dart';
import 'package:fifth_exam/ui/tab_box/first_task/cubit/news_single_cubit.dart';
import 'package:fifth_exam/ui/tab_box/tab_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => NewsRepository(
            apiService: ApiService(),
          ),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => NewsSingleStateCubit(
              newsRepository: context.read<NewsRepository>(),
            )..fetchNewInfo(),
          ),
          BlocProvider(
            create: (context) => ConnectivityCubit(),
          ),
        ],
        child: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabBox(),
    );
  }
}
