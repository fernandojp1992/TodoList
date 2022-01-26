import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genpag_todo/screens/personalTask_Screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.blue,
          leading: Icon(
            Icons.view_headline,
            color: Colors.white,
          ),
          title: Center(
            child: Text('TODO',
                style: GoogleFonts.raleway(
                  color: Colors.white,
                  fontSize: 16,
                )),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(16.0),
                color: Colors.blue,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 100, left: 10, bottom: 10),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                        'https://cdn.pensador.com/img/authors/st/ev/steve-jobs-2-l.jpg'),
                  ),
                  title: Text('Oi, Fernando pacheco.',
                      style: GoogleFonts.raleway(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600)),
                  subtitle: Text('Você tem 3 tarefas para concluir hoje.',
                      style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontSize: 16,
                      )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20, top:30, bottom:30),
              child: Text('Minhas Tarefas',
                  style: GoogleFonts.raleway(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600)),
            ),
            ListTile(
              leading: Icon(
                Icons.access_time,
                color: Colors.red,
                size: 40,
              ),
              title: Text('Pendente',
                  style: GoogleFonts.raleway(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600)),
              subtitle: Text('4 tarefas pendentes.',
                  style: GoogleFonts.raleway(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w500)),
            ),
            ListTile(
              leading: Icon(
                Icons.update,
                color: Colors.orange,
                size: 40,
              ),
              title: Text('Em progresso',
                  style: GoogleFonts.raleway(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600)),
              subtitle: Text('7 tarefas em progresso.',
                  style: GoogleFonts.raleway(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w500)),
            ),
            ListTile(
              leading: Icon(
                Icons.done_all,
                color: Colors.green,
                size: 40,
              ),
              title: Text('Concluido',
                  style: GoogleFonts.raleway(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600)),
              subtitle: Text('20 tarefas concluidas.',
                  style: GoogleFonts.raleway(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w500)),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, CupertinoPageRoute(builder: (_) => PersonalTaskScreen()));
                      },
                      child: Card(
                        color: Colors.blue,
                        child: Container(
                          width: 200,
                          padding: EdgeInsets.all(5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ListTile(
                                leading: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                trailing: Icon(
                                  Icons.settings,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:10, bottom:5, top:50),
                                child: Text('9 tasks',
                                    style: GoogleFonts.raleway(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:10, bottom:5),
                                child: Text('Pessoal',
                                    style: GoogleFonts.raleway(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w800)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom:10),
                                child: LinearPercentIndicator(
                                  width: 180,
                                  lineHeight: 10,
                                  percent: 0.8,
                                  backgroundColor: Colors.white,
                                  progressColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left:5),
                    child: Card(
                      color: Colors.blue,
                      child: Container(
                        width: 200,
                        padding: EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ListTile(
                              leading: Icon(
                                Icons.work,
                                color: Colors.white,
                                size: 20,
                              ),
                              trailing: Icon(
                                Icons.settings,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:10, bottom:5, top:50),
                              child: Text('3 tasks',
                                  style: GoogleFonts.raleway(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:10, bottom:10),
                              child: Text('Trabalho',
                                  style: GoogleFonts.raleway(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w800)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom:5),
                              child: LinearPercentIndicator(
                                width: 180,
                                lineHeight: 10,
                                percent: 0.2,
                                backgroundColor: Colors.white,
                                progressColor: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
