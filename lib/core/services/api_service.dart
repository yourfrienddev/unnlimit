import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:unnlimit/core/contants/api_constants.dart';
import '../resource/data_state.dart';

class ApiService {

  ApiService();

  Future<DataState> get()async{
    Uri uri = Uri.parse(jokeApi);
    final Map<String, String> reqHeaders = <String, String>{
      'Content-Type': 'application/json',
    };
    try{
      http.Response resp = await http.get(uri, headers: reqHeaders);
      if(resp.statusCode == 200){
        return DataSuccess(data: jsonDecode(resp.body) );
      }else{
        return DataFailed(error: jsonDecode(resp.body));
      }
    }catch(e){
      return DataFailed(error: e.toString());
    }
  }


}