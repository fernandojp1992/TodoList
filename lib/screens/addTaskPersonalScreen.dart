
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genpag_todo/database/database.dart';
import 'package:genpag_todo/models/task_model.dart';
import 'package:genpag_todo/screens/personalTask_Screen.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTaskPersonal extends StatefulWidget {

  final Task? task;
  final Function? updateTaskList;

  AddTaskPersonal({this.task, this.updateTaskList});

  @override
  _AddTaskPersonalState createState() => _AddTaskPersonalState();
}




class _AddTaskPersonalState extends State<AddTaskPersonal> {

  String _title = '';
  String _description = '';

  final _formkey = GlobalKey<FormState>();


  @override
  void initState(){
    super.initState();

    if(widget.task != null){
      _title = widget.task!.title!;
      _description = widget.task!.description!;


    }
  }

  _submit(){
    if(_formkey.currentState!.validate()){
      _formkey.currentState!.save();

      Task task = Task(title: _title, description: _description);



      if(widget.task == null){
        task.status = 0;
        DatabaseHelper.instance.insertTask(task);
        print(_title + _description);

        Navigator.pushReplacement(context, MaterialPageRoute(builder:(_)=> PersonalTaskScreen() ));
      }else{
       task.id = widget.task!.id;
       task.status = widget.task!.status;
       DatabaseHelper.instance.updateTask(task);
       Navigator.pushReplacement(context, MaterialPageRoute(builder:(_)=> PersonalTaskScreen() ));
      }

      widget.updateTaskList!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PersonalTaskScreen()));
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: GestureDetector(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top:100, left:20),
              child: Text('Adicionar Tarefa',
                  style: GoogleFonts.raleway(
                    color: Colors.black,
                    fontSize: 30,
                  )),
            ),
            Form(
              key: _formkey,
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 40, left:20, right: 25),
                    child: TextFormField(
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        labelText: 'Titulo',
                        labelStyle: TextStyle(fontSize: 18),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                      ),
                      validator: (input) =>
                      input!.trim().isEmpty ? "Porfavor insira um titulo" : null,
                      onSaved: (input) => _title = input!,
                      initialValue: _title,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40, left:20, right: 25),
                    child: TextFormField(
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                          labelText: 'Descrição',
                          labelStyle: TextStyle(fontSize: 18),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                        validator: (input) =>
                        input!.trim().isEmpty ? "Porfavor insira uma descrição" : null,
                        onSaved: (input) => _description = input!,
                        initialValue: _description
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: ElevatedButton(
                        child: Text('Criar Tarefa',
                            style: GoogleFonts.raleway(
                              color: Colors.white,
                              fontSize: 18,
                            )),
                        onPressed: (){
                          _submit();
                        },
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
