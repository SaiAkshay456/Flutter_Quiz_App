import 'package:flutter/material.dart';
import 'package:flutter_basics/quiz_cubit.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:flutter_basics/Questions.dart';
import "package:flutter_bloc/flutter_bloc.dart";

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  bool quizStarted = false;
  final quiz_cubit = QuizCubit();
  @override
  Widget build(BuildContext context) {
    final toggleHere = quiz_cubit.state;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 132, 151, 244),
              Color.fromARGB(255, 85, 105, 210),
            ],
          ),
        ),
        child: quizStarted
            ? const Question()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Image.asset(
                      "assets/quiz_game.png",
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Start Quiz",
                      style: GoogleFonts.titilliumWeb(),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
