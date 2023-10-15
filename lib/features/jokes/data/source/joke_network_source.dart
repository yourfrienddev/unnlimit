import 'package:flutter/foundation.dart';
import 'package:unnlimit/core/resource/data_state.dart';
import 'package:unnlimit/core/services/api_service.dart';
import 'package:unnlimit/features/jokes/data/Modal/joke_modal.dart';

class JokeNetworkSource {

  Future<DataState> getJoke()async{
    DataState resp = await ApiService().get();
    if(resp is DataSuccess){
      if (kDebugMode) {
        print(resp.data.toString());
      }
      return DataSuccess(data:  JokeModal.fromJson(resp.data));
    }
    else{
      return DataFailed(error: resp.error);
    }
  }

}