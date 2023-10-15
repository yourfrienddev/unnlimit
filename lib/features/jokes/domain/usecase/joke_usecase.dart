import 'package:unnlimit/features/jokes/data/Modal/joke_modal.dart';

import '../../../../core/resource/data_state.dart';
import '../../data/repository/joke_repository_impl.dart';
import '../entity/joke_entity.dart';

class JokeUseCase {

  Future<DataState> getNetworkJoke()async{
    DataState resp = await JokeRepositoryImpl().getNetworkJoke();
    if(resp is DataSuccess){
      return DataSuccess(data:  resp.data);
    }
    else{
      return DataFailed(error: resp.error);
    }
  }

  Future<DataState> postLocalJoke(List<JokeModal> jokeList)async{
    print('in joke-usercase - $jokeList');
    DataState resp = await JokeRepositoryImpl().postLocalJoke(jokeList);
    if(resp is DataSuccess){
      return DataSuccess(data:  resp.data);
    }
    else{
      return DataFailed(error: resp.error);
    }
  }

  Future<DataState> getLocalJoke()async{
    DataState resp = await JokeRepositoryImpl().getLocalJoke();
    if(resp is DataSuccess){
      return DataSuccess(data:  resp.data);
    }
    else{
      return DataFailed(error: resp.error);
    }
  }

}