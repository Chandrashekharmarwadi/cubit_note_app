import 'package:cubit_note_app/cubit/note_state.dart';
import 'package:cubit_note_app/cubit/notes_cubit.dart';
import 'package:cubit_note_app/screen/update.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<NoteCubit>().getAllNotes();
  }

  deleteData(int id)async{
    context.read<NoteCubit>().deleteDataDatabase(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Home Screen"),
        centerTitle: true,
      ),
      body: BlocBuilder<NoteCubit, CubitState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ErrorState) {
            return Center(child: Text("${state.ErrorMsg}"));
          } else if (state is LoadedState) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateDateScreen(
                          noteUId: state.arrNotes![index].noteId,
                          title: state.arrNotes![index].title,
                          desc: state.arrNotes![index].desc,
                        ),
                      ),
                    );
                  },
                  leading: CircleAvatar(child: Text("${index+1}")),
                  title: Text("${state.arrNotes![index].title}"),
                  subtitle: Text("${state.arrNotes![index].desc}"),
                  trailing: IconButton(onPressed: (){
                    deleteData(state.arrNotes![index].noteId!);
                  }, icon: Icon(Icons.delete),color: Colors.green,highlightColor: Colors.red,),
                );
              },
              itemCount: state.arrNotes!.length,
            );
          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddScreen()),
          );
        },
        backgroundColor: Colors.lightGreenAccent,
        child: Icon(Icons.add),
      ),
    );
  }
}
