import 'package:fifth_exam/ui/tab_box/first_task/cubit/news_single_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstTaskScreen extends StatelessWidget {
  const FirstTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("First Task")),
      body: Center(
        child: BlocBuilder<NewsSingleStateCubit, NewsSingleState>(
          builder: (context, state) {
            if(state.status==Status.ERROR){
              return Text(state.error.toString());
            }
            if(state.status==Status.SUCCESS){
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.network(
                            state.newsModel!.links.patch.small,
                          ),
                        ),
                        const SizedBox(height: 50),
                        Text("Name: ${state.newsModel?.name}",
                            style: const TextStyle(fontSize: 18)),
                        SizedBox(
                          height: 100,
                          child: ListView.builder(
                            itemCount: state.newsModel?.crew.length,
                            itemBuilder: (context, index) {
                              return Text("Position: ${state.newsModel?.crew[index].role}",
                                  style: const TextStyle(fontSize: 18));
                            },
                          ),
                        ),
                        Text("YoutubeId: ${state.newsModel?.links.youtubeId}",
                            style: const TextStyle(fontSize: 18)),
                        Text("Launch Library Id: ${state.newsModel?.launchLibraryId}",
                            style: const TextStyle(fontSize: 18)),
                        Text("Id: ${state.newsModel?.id}",
                            style: const TextStyle(fontSize: 18)),
                      ],
                    ),
                  )
                ],
              );
            }
            if(state.status==Status.LOADING){
              return const CircularProgressIndicator();
            }
            return Container();
          },
        ),
      ),
    );
  }
}