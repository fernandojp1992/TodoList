import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genpag_todo/database/database.dart';
import 'package:genpag_todo/models/task_model.dart';
import 'package:genpag_todo/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqflite/sqflite.dart';
import 'addTaskPersonalScreen.dart';
import 'package:intl/intl.dart';

class PersonalTaskScreen extends StatefulWidget {


  @override
  _PersonalTaskScreenState createState() => _PersonalTaskScreenState();
}


class _PersonalTaskScreenState extends State<PersonalTaskScreen> {

  List<Task>? _taskList ;

  DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  @override
  void initState() {
    super.initState();

    refreshNotes();
  }

  Future refreshNotes() async {

    this._taskList = await DatabaseHelper.instance.readAllNotes();

  }

  Widget _buildNote(Task task){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          ListTile(
            title: Text(task.title!,
                style: GoogleFonts.raleway(
                    color: Colors.black,
                    fontSize: 16,
                    decoration: task.status == 0
                        ? TextDecoration.none
                        : TextDecoration.lineThrough
                )),
            subtitle: Text(task.description!,
                style: GoogleFonts.raleway(
                    color: Colors.black,
                    fontSize: 16,
                    decoration: task.status == 0
                        ? TextDecoration.none
                        : TextDecoration.lineThrough
                )),
            trailing: Checkbox(
              onChanged: (value){
                task.status = value! ? 1 : 0;
                DatabaseHelper.instance.updateTask(task);
                _updateTaskList();
                Navigator.pushReplacement(context, CupertinoPageRoute(builder: (_) => PersonalTaskScreen()));
              },
              activeColor: Colors.blue,
              value: task.status == 1 ? true : false,
            ),
            onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (_) => AddTaskPersonal(
                updateTaskList: _updateTaskList(),
                task: task
            ),
            ),
            ),

          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddTaskPersonal(
                    updateTaskList: _updateTaskList,
                  )));
        },
        child: Icon(Icons.add),
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: (){
            Navigator.push(context, CupertinoPageRoute(builder: (_) => HomeScreen()));
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: FutureBuilder(
          future: _taskList.length,
          builder: (context, AsyncSnapshot snapshot) {
            if(!snapshot.hasData){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top:80),
                    child: Text('Tarefas Pessoais',
                        style: GoogleFonts.raleway(
                          color: Colors.black,
                          fontSize: 30,
                        )),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('0 de 0',
                        style: GoogleFonts.raleway(
                          color: Colors.black,
                          fontSize: 16,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:60),
                    child: Center(
                      child: Text('Nenhuma tarefa criada!',
                          style: GoogleFonts.raleway(
                            color: Colors.black,
                            fontSize: 20,
                          )),
                    ),
                  )
                ],
              );
            }
            final int completeTaskCount = snapshot.data!.where((Task task) => task.status == 1).toList().lenght;
            return ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 80),
                itemCount: snapshot.data!.lenght,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Tarefas Pessoais',
                              style: GoogleFonts.raleway(
                                color: Colors.black,
                                fontSize: 30,
                              )),
                          SizedBox(height: 20),
                          Text('$completeTaskCount - ${snapshot.data.lenght}',
                              style: GoogleFonts.raleway(
                                color: Colors.black,
                                fontSize: 16,
                              )),
                        ],
                      ),
                    );
                  }
                  return _buildNote(snapshot.data![index - 1]);
                }
            );
          }
      ),
    );
  }
}
