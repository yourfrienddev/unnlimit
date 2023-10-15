import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unnlimit/features/jokes/data/Modal/joke_modal.dart';
import 'package:unnlimit/features/jokes/presentation/bloc/joke_event.dart';
import 'package:unnlimit/features/jokes/presentation/bloc/joke_state.dart';
import '../../../../core/resource/data_state.dart';
import '../../domain/usecase/joke_usecase.dart';


class JokeBloc extends Bloc<JokeEvent,JokeState>{
  int timeRemain = 60;
  List<JokeModal>? jokeList = [];

  JokeBloc():super(InitJokeState(60,[])){
    _countDownTimer();
    getLocalJokes();
    on<InitEvent>(_onInit);
  }

  _countDownTimer()async{
    while(true){
      await Future.delayed(const Duration(seconds: 1));
      timeRemain = timeRemain - 1;
      if(timeRemain < 1){
        timeRemain = 60;
        getNewJoke();
      }
    }
  }

  getNewJoke()async{
    DataState resp = await JokeUseCase().getNetworkJoke();
    if(resp is DataSuccess){
      jokeList?.insert(0, resp.data);
      await JokeUseCase().postLocalJoke(jokeList!);
    }
  }

  getLocalJokes()async{
    DataState resp = await JokeUseCase().getLocalJoke();
    if(resp is DataSuccess){
      jokeList = resp.data;
    }
  }

  _onInit(InitEvent event, Emitter<JokeState> emit)async{
    emit(InitJokeState(timeRemain,jokeList));
  }

}