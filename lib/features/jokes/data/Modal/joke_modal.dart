import 'package:unnlimit/features/jokes/domain/entity/joke_entity.dart';

class JokeModal extends JokeEntity {

  JokeModal.fromJson(Map<String, dynamic> json) {
    joke = json['joke'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['joke'] = joke!;
    return data;
  }

}