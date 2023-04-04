import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../home.dart';
import './components/components.dart';

class HomeView extends StatelessWidget {

  HomeView({Key? key}) : super(key: key);

  final _cubit = Modular.get<HomeCubit>();

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filmes Zamp'),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: _cubit,
        builder: (context, state) {

          if(state is LoadingState) {

            return const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );

          } else if(state is ErrorState) {

            return const Center(
              child: Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 80,
              ),
            );

          } else if(state is LoadedState){

            final movies = state.movies;

            return Column(
              children: [

                const SizedBox(height: 16,),

                SizedBox(
                  height: height * 0.5,
                  child: ListView.builder(
                    itemCount: movies.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index){

                      return CardMovie(
                        movie: movies[index],
                      );

                    },
                  ),
                ),
              ],
            );

          }

          return const SizedBox();
        },
      ),
    );
  }

}
