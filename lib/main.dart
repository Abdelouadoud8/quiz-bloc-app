import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp2_exercice01_bloc/cubit/quizpagecubit.dart';
import 'package:tp2_exercice01_bloc/data/quizdataset.dart';
import 'package:tp2_exercice01_bloc/views/quizmainpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        create: (_) => QuizPageCubit(0, getQuizzes()),
        child: BlocBuilder<QuizPageCubit, QuizPageState>(
          builder: (_, theme) {
            return MaterialApp(
              title: 'Quiz',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: Scaffold(
                backgroundColor: Colors.white,
                body: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.10),
                    child: QuizPage(title: "Quiz"),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
