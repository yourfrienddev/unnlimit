import '../../domain/entity/joke_entity.dart';

abstract class JokeState {
  int timer;
  List<JokeEntity>? jokes;
  JokeState(this.timer,this.jokes);
}

class InitJokeState extends JokeState{
  InitJokeState(super.timer,super.jokes);
}


