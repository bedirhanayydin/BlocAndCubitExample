import 'package:bloc_sample_project/cubit/cats_cubit.dart';
import 'package:bloc_sample_project/data/repository/cats_repository.dart';
import 'package:bloc_sample_project/cubit/cats_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocCatsView extends StatefulWidget {
  const BlocCatsView({super.key});

  @override
  State<BlocCatsView> createState() => _BlocCatsViewState();
}

class _BlocCatsViewState extends State<BlocCatsView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CatsCubit(SampleCatsRepository()),
      child: buildScaffold(context),
    );
  }

  Scaffold buildScaffold(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Hello'),
        ),
        body: BlocConsumer<CatsCubit, CatsState>(
          listener: (context, state) {
            if (state is CatsError) {
              Scaffold.of(context).showBottomSheet((context) => Text(state.message));
            }
          },
          builder: (context, state) {
            if (state is CatsInitial) {
              return Center(
                child: Column(
                  children: [
                    const Text('Initial'),
                    FloatingActionButton(
                      onPressed: () {
                        context.read<CatsCubit>().getCats();
                      },
                      child: const Icon(Icons.read_more_outlined),
                    ),
                  ],
                ),
              );
            } else if (state is CatsLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              );
            } else if (state is CatsCompleted) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Image.network(state.response[index].imageUrl ?? ''),
                    subtitle: Text(state.response[index].description ?? ''),
                  );
                },
                itemCount: state.response.length,
              );
            } else {
              final error = state as CatsError;
              return Center(
                child: Text(error.message),
              );
            }
          },
        ),
      );
}
