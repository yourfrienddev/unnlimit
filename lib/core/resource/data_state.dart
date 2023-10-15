
abstract class DataState{
  var error;
  var data;
  DataState({this.data, this.error});
}

class DataSuccess extends DataState{
  DataSuccess({var data}):super(data: data);
}

class DataFailed extends DataState{
  DataFailed({var error}):super(data: error);
}