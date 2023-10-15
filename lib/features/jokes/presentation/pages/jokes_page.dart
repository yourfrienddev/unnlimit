import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unnlimit/features/jokes/presentation/bloc/joke_bloc.dart';
import 'package:unnlimit/features/jokes/presentation/bloc/joke_event.dart';
import '../widget/joke_tile_widget.dart';
import 'package:provider/provider.dart';

class JokePage extends StatelessWidget {
  const JokePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (BuildContext context) => JokeBloc())],
        child: const JokeScreen());
  }
}

class JokeScreen extends StatelessWidget {
  const JokeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var jokeBloc = Provider.of<JokeBloc>(context, listen: false);
    jokeBloc.add(InitEvent());
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(context),
    );
  }

  buildAppBar(context) {
    return AppBar(
      title: const Text('Joke Page'),
      actions: [
        buildJokeCounter(context),
      ],
    );
  }

  buildJokeCounter(context){
    var jokeBloc = Provider.of<JokeBloc>(context);
    return Text('Joke in ${jokeBloc.state.timer}s ');
  }

  buildBody(context) {
    var jokeBloc = Provider.of<JokeBloc>(context);
    if (jokeBloc.state.jokes!.length>=1) {
      return ListView.builder(
          itemCount: (jokeBloc.state.jokes!.length>=10)?10:jokeBloc.state.jokes?.length,
          itemBuilder: (context, index) {
            return JokeTileWidget(
              joke: jokeBloc.state.jokes![index].joke!,
            );
          });
    } else {
      return Center(
        child: buildJokeCounter(context),
      );
    }
  }
}
