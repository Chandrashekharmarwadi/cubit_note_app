import 'package:cubit_note_app/model/cubit_model.dart';

abstract class CubitState{}

class InitialState extends CubitState{}

class LoadingState extends CubitState{}

class LoadedState extends CubitState{
  List<Note_Model>? arrNotes = [];
  int? id;
  LoadedState({this.id,required this.arrNotes});
}

class ErrorState extends CubitState{
  String ErrorMsg;
  ErrorState({required this.ErrorMsg});
}