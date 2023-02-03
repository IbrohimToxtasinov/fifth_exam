import 'package:fifth_exam/state_manegers/cubit/get_notification/get_notification_cubit.dart';
import 'package:fifth_exam/state_manegers/cubit/get_notification/get_notification_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FourthTaskScreen extends StatelessWidget {
  const FourthTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => BreakingNewsCubit(),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.blue),
          title: const Text(
            "Fourth Screen",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: BlocConsumer<BreakingNewsCubit, BreakingNewsCubitState>(
            listener: (context, state) {
              if (state is LoadBreakingNewsProgress) {
                BlocProvider.of<BreakingNewsCubit>(context)
                    .getAllBreakingNews();
              }
            },
            builder: (context, state) {
              if (state is LoadBreakingNewsProgress) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is LoadBreakingNewsSuccess) {
                return Column(
                  children: [
                    ...List.generate(
                      state.breakingNewsModel.length,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: ListTile(
                              title: Row(
                                children: [
                                  Image.network(
                                    state.breakingNewsModel[index].newsImage,
                                    width: 70,
                                    height: 70,
                                  ),
                                  const SizedBox(height: 30),
                                  Text(
                                    state.breakingNewsModel[index].newsTitle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'You don`t have an notification',
                    style: TextStyle(),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
