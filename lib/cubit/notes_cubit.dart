import 'package:cubit_note_app/cubit/note_state.dart';
import 'package:cubit_note_app/database/cubit_database.dart';
import 'package:cubit_note_app/model/cubit_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteCubit extends Cubit<CubitState> {
  DbHelper dbHelper;
  NoteCubit({required this.dbHelper}) : super(InitialState());

  addData(Note_Model note_model) async {
    emit(LoadingState());
    var check = await dbHelper.addData(note_model);
    if (check) {
      var note = await dbHelper.getNotes();
      emit(LoadedState(arrNotes: note));
    } else {
      emit(ErrorState(ErrorMsg: "Error Occured While Adding Data in DataBase"));
    }
  }

  updateDataCubit(Note_Model note_model) async {
    emit(LoadingState());
    var check = await dbHelper.updateData(note_model);
    if (check) {
      var notes = await dbHelper.getNotes();
      emit(LoadedState(arrNotes: notes));
    } else {
      emit(ErrorState(ErrorMsg: 'Data Not Updated'));
    }
  }

  deleteDataDatabase(int? id) async {
    emit(LoadingState());
    var check = await dbHelper.deleteData(id!);
    if(check){
      var note = await dbHelper.getNotes();
      emit(LoadedState(arrNotes: note));
    }
    else{
      emit(ErrorState(ErrorMsg: "Data Not Deleted"));
    }
  }

  getAllNotes() async {
    emit(LoadingState());
    var note = await dbHelper.getNotes();
    emit(LoadedState(arrNotes: note));
  }
}
