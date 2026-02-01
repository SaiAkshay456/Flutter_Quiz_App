import 'package:flutter/material.dart';
import "package:flutter_basics/questionsJson.dart";

List<QuestionsJson> questionAnswers = [
  QuestionsJson(
    question: "What is your age?",
    options: ["under 18", "19 to 25", "26 to 36"],
  ),
  QuestionsJson(
    question: "What branch in b.tech?",
    options: ["CSE", "ECE", "EEE", "AI/ML"],
  ),
  QuestionsJson(
    question: "Which is your favorite language?",
    options: ["C++", "Java", "IavaScript", "Python"],
  ),
  QuestionsJson(
    question: "What is preferred AI tool for coding?",
    options: ["ChatGpt", "GeminiAI", "Claude", "V0"],
  ),
];

class Question extends StatefulWidget {
  const Question({super.key});
  @override
  State<StatefulWidget> createState() {
    return _QuestionState();
  }
}

class _QuestionState extends State<Question> {
  int currentQuestionIndex = 0;
  List<QuestionsJson> answeredQuestions = [];
  bool quizEnd = false;
  void handleAnswer(String selectedOption, String question) {
    setState(() {
      answeredQuestions.add(
        QuestionsJson(question: question, options: [selectedOption]),
      );
      if (currentQuestionIndex < questionAnswers.length - 1) {
        currentQuestionIndex++;
      } else {
        quizEnd = true;
      }
    });
  }

  void handleBack() {
    setState(() {
      if (quizEnd) {
        quizEnd = false; // go back to last question
        currentQuestionIndex = questionAnswers.length - 1;
      } else if (currentQuestionIndex > 0) {
        currentQuestionIndex--;
        answeredQuestions.removeLast();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: quizEnd
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Quiz Review",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ...answeredQuestions.map(
                        (q) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                q.question!,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "Your answer: ${q.options.first}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // restart quiz
                          setState(() {
                            quizEnd = false;
                            currentQuestionIndex = 0;
                            answeredQuestions.clear();
                          });
                        },
                        child: const Text("Restart Quiz"),
                      ),
                    ],
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (currentQuestionIndex > 0)
                        TextButton(
                          onPressed: handleBack,
                          child: const Text(
                            "Back",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      Text(
                        questionAnswers[currentQuestionIndex].question!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 30),
                      ...questionAnswers[currentQuestionIndex].options.map(
                        (item) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              handleAnswer(
                                item,
                                questionAnswers[currentQuestionIndex].question!,
                              );
                            },
                            child: Text(
                              item,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
