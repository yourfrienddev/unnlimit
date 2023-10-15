import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../resource/data_state.dart';


class SecureStorageService{

  final FlutterSecureStorage storage;

  SecureStorageService()
      : storage = const FlutterSecureStorage();

  write({required String key, required String value})async{
    await storage.write(key: key, value: value);
   // String? resp = await read(key: key);
    if (kDebugMode) {
     // print('local db - $resp');
    }
  }

  Future<String?> read({required String key})async{
    String? resp = await storage.read(key: key);
    return resp;
  }

}