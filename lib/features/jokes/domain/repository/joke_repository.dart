import 'package:unnlimit/core/resource/data_state.dart';

import '../../data/Modal/joke_modal.dart';
import '../entity/joke_entity.dart';

abstract class JokeRepository {

  // get joke by api call
  Future<DataState> getNetworkJoke();

  //get joke by local network
  Future<DataState> getLocalJoke();

  // save joke on local network
  Future<DataState> postLocalJoke(List<JokeModal> jokeList);
}