import 'package:unnlimit/core/resource/data_state.dart';
import 'package:unnlimit/features/jokes/data/Modal/joke_modal.dart';
import 'package:unnlimit/features/jokes/data/source/joke_local_source.dart';
import 'package:unnlimit/features/jokes/data/source/joke_network_source.dart';
import 'package:unnlimit/features/jokes/domain/entity/joke_entity.dart';
import 'package:unnlimit/features/jokes/domain/repository/joke_repository.dart';

class JokeRepositoryImpl extends JokeRepository{

  @override
  Future<DataState> getNetworkJoke() async{
    DataState resp = await JokeNetworkSource().getJoke();
    if(resp is DataSuccess){
      return DataSuccess(data:  resp.data);
    }
    else{
      return DataFailed(error: resp.error);
    }
  }

  @override
  Future<DataState> postLocalJoke(List<JokeModal> jokeList) async{
    print('in joke-repo_imp - $jokeList');
    DataState resp = await JokeLocalSource().postJoke(jokeList);
    if(resp is DataSuccess){
      return DataSuccess(data:  resp.data);
    }
    else{
      return DataFailed(error: resp.error);
    }
  }

  @override
  Future<DataState> getLocalJoke() async{
    DataState resp = await JokeLocalSource().getJoke();
    if(resp is DataSuccess){
      return DataSuccess(data:  resp.data);
    }
    else{
      return DataFailed(error: resp.error);
    }
  }

}