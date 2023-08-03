import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../appUtilities/app_colors.dart';

class mobileScanfold extends StatefulWidget {
  const mobileScanfold({super.key});

  @override
  State<mobileScanfold> createState() => _mobileScanfoldState();
}

class _mobileScanfoldState extends State<mobileScanfold> {
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is the capital of France?',
      'answers': ['London', 'Paris', 'Berlin', 'Madrid'],
      'correctAnswer': '2',
      'selectedAnswer': '0',
    },
    {
      'question': 'What is 2 + 2?',
      'answers': ['3', '4', '5', '6'],
      'correctAnswer': '2',
      'selectedAnswer': '0'
    },
    {
      'question': 'What is the tallest mountain in the world?',
      'answers': ['K2', 'Mount Everest', 'Kanchenjunga', 'Lhotse'],
      'correctAnswer': '2',
      'selectedAnswer': '0'
    },
  ];

  Color checkAnswerColor(int correctAnswer, int selectAnswer, int answerIndex) {
    if (selectAnswer > 0) {
      if (answerIndex == selectAnswer) {
        if (correctAnswer == selectAnswer) {
          return greenColor;
        } else {
          return redColor;
        }
      } else if (answerIndex == correctAnswer) {
        return greenColor;
      } else {
        return lightgreyColor;
      }
    } else {
      return lightgreyColor;
    }
  }

  String getAnswerStatusText(
      int correctAnswer, int selectedAnswer, int answerIndex) {
    if (selectedAnswer > 0) {
      if (answerIndex == selectedAnswer) {
        if (correctAnswer == selectedAnswer) {
          return 'Right Answer';
        } else {
          return 'Wrong Answer';
        }
      } else if (answerIndex == correctAnswer) {
        return 'Right Answer';
      } else {
        return '';
      }
    } else {
      return '';
    }
  }

  Color selectedBorderColor = greenColor;
  Color unselectedBorderColor = greyColor;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(type: BottomNavigationBarType.fixed,elevation: 0.5,items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.account_box), label: 'Study'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Textbook'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Guides'),
        ]),
        body: Column(
          children: [
            Card(
              margin: EdgeInsets.zero,
              elevation: 0.5,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Quiz App',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.normal),
                          ),
                          Spacer(),
                          Container(
                            alignment: Alignment.center,
                            width: 100,
                            height: 35,
                            decoration: BoxDecoration(
                                border: Border.all(width: 2, color: blueColor),
                                borderRadius: BorderRadius.circular(20)),
                            child: const Text(
                              'Join/Login ',
                              style: TextStyle(fontSize: 14),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(bottom: 10),
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      decoration: BoxDecoration(
                          color: searchBarColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.search, size: 22),
                                border: InputBorder.none)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _questions.length,
                itemBuilder: (context, index) {
                  final question = _questions[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 15, left: 15, top: 15),
                        child: Text(
                          question['question'],
                          style: const TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.normal),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: question['answers'].length,
                        itemBuilder: (context, answerIndex) {
                          int selectedAnswer =
                          int.parse(question['selectedAnswer']);
                          int correctAnswer =
                          int.parse(question['correctAnswer']);
                          return GestureDetector(
                            onTap: () {
                              if (int.parse(question['selectedAnswer']) < 1) {
                                setState(() {
                                  question['selectedAnswer'] =
                                      (answerIndex + 1).toString();
                                });
                              }
                            },
                            child: Container(
                              margin: const EdgeInsets.all(15),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: checkAnswerColor(correctAnswer,
                                        selectedAnswer, (answerIndex + 1)),
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.black12.withOpacity(0.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Text((answerIndex + 1).toString()),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    question['answers'][answerIndex],
                                    textAlign: TextAlign.start,
                                    style: TextStyle(color: blackColor),
                                  ),
                                  const Spacer(),
                                  Text(
                                    getAnswerStatusText(correctAnswer,
                                        selectedAnswer, (answerIndex + 1)),
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: checkAnswerColor(correctAnswer,
                                          selectedAnswer, (answerIndex + 1)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}