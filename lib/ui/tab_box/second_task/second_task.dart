import 'package:fifth_exam/data/repositories/news_repository.dart';
import 'package:fifth_exam/data/services/api_service/api_service.dart';
import 'package:fifth_exam/ui/tab_box/second_task/cubit/multi_cubit_state.dart';
import 'package:fifth_exam/ui/tab_box/second_task/cubit/multi_state_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondTaskScreen extends StatelessWidget {
  const SecondTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsMultiCubit(
          newsRepository: NewsRepository(apiService: ApiService())),
      child: BlocBuilder<NewsMultiCubit, NewsMultiState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text("Second Task")),
            body: state is LoadNewsInProgress
                ? const Center(child: CircularProgressIndicator())
                : state is LoadNewsInSuccess
                    ? Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Image.network(
                                state.newsModel.links.patch.small,
                              ),
                            ),
                            const SizedBox(height: 50),
                            Text("Name: ${state.newsModel.name}",
                                style: const TextStyle(fontSize: 18)),
                            SizedBox(
                              height: 100,
                              child: ListView.builder(
                                itemCount: state.newsModel.crew.length,
                                itemBuilder: (context, index) {
                                  return Text("Position: ${state.newsModel.crew[index].role}",
                                      style: const TextStyle(fontSize: 18));
                                },
                              ),
                            ),
                            Text("YoutubeId: ${state.newsModel.links.youtubeId}",
                                style: const TextStyle(fontSize: 18)),
                            Text("Launch Library Id: ${state.newsModel.launchLibraryId}",
                                style: const TextStyle(fontSize: 18)),
                            Text("Id: ${state.newsModel.id}",
                                style: const TextStyle(fontSize: 18)),
                          ],
                        ),
                    )
                    : state is LoadNewsInFailure
                        ? Center(
                            child: Text(state.error.toString()),
                          )
                        : const SizedBox(),
          );
        },
      ),
    );
  }
}
