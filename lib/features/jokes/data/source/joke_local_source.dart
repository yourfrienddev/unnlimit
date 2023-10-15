import 'dart:convert';
import 'package:unnlimit/core/resource/data_state.dart';
import 'package:unnlimit/core/services/secure_storage_sevice.dart';
import 'package:unnlimit/features/jokes/data/Modal/joke_modal.dart';
import '../../domain/entity/joke_entity.dart';
class JokeLocalSource{

  final String jokeKey = 'jokeKey';

  Future<DataState> postJoke(List<JokeModal> jokeList)async{
    print('in joke-local_source - '+jokeList.toString());
    print('in joke-local_source encode- '+jsonEncode(jokeList));
    var jokes = jokeList.map((e) => e.toJson()).toList();
    await SecureStorageService().write(key: jokeKey, value: jsonEncode(jokes));
    return DataSuccess(data: 'success');
  }

  Future<DataState> getJoke()async{
    String? resp = await SecureStorageService().read(key: jokeKey) ;
    if(resp != null){
      List<dynamic>? respJson = jsonDecode(resp!);
      List<JokeModal>? jokeList =  respJson?.map( (v) => JokeModal.fromJson(v)).toList();
      return DataSuccess(data: jokeList);
    }
    return DataFailed(error: 'no local data');

  }

}