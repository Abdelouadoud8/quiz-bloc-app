import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2_exercice01_bloc/cubit/quizpagecubit.dart';

class QuizPage extends StatelessWidget {
  QuizPage({Key? key, String? title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _quizpagecubit = context.read<QuizPageCubit>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          "Quiz",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).accentColor,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(_quizpagecubit.quizzes[_quizpagecubit.index].getImage()),
            ),
            SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.all(20),
              height: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).accentColor,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                _quizpagecubit.quizzes[_quizpagecubit.index].getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple, // Customize button color
                    elevation: 0, // Remove elevation
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Round corners
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 30,
                    ),
                  ),
                  onPressed: () {
                    if (_quizpagecubit.quizzes[_quizpagecubit.index].answer == "True") {
                      ScaffoldMessenger.of(context).showSnackBar(_quizpagecubit.correctAnswer());
                      _quizpagecubit.nextQuiz();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(_quizpagecubit.wrongAnswer());
                    }
                  },
                  child: Text(
                    "True",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple, // Customize button color
                    elevation: 0, // Remove elevation
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Round corners
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 30,
                    ),
                  ),
                  onPressed: () {
                    if (_quizpagecubit.quizzes[_quizpagecubit.index].answer == "False") {
                      ScaffoldMessenger.of(context).showSnackBar(_quizpagecubit.correctAnswer());
                      _quizpagecubit.nextQuiz();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(_quizpagecubit.wrongAnswer());
                    }
                  },
                  child: Text(
                    "False",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple, // Customize button color
                    elevation: 0, // Remove elevation
                    shape: CircleBorder(), // Make it a circle
                    padding: EdgeInsets.all(15),
                  ),
                  onPressed: () {
                    _quizpagecubit.nextQuiz();
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
