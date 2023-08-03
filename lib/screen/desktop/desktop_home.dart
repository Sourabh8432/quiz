import 'package:flutter/material.dart';
import '../../appUtilities/app_colors.dart';




class desktopScanfold extends StatefulWidget {
  const desktopScanfold({super.key});

  @override
  State<desktopScanfold> createState() => _desktopScanfoldState();
}

class _desktopScanfoldState extends State<desktopScanfold> {
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
        appBar: AppBar(
            backgroundColor: whiteColor,
            elevation: 0.8,
            title: Container(
              margin: const EdgeInsets.symmetric(horizontal: 100),
              child: Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: Text(
                      'Quiz App',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    flex: 4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 15),
                          margin: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 6),
                          decoration: BoxDecoration(
                              color: menuColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            'Home',
                            style: TextStyle(fontSize: 14, color: blackColor),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 15),
                          margin: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 6),
                          decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            'Study',
                            style: TextStyle(fontSize: 14, color: blackColor),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 15),
                          margin: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 6),
                          decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            'Textbooks',
                            style: TextStyle(fontSize: 14, color: blackColor),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 15),
                          margin: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 6),
                          decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            'Guides',
                            style: TextStyle(fontSize: 14, color: blackColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    flex: 3,
                    child: Container(
                      alignment: Alignment.center,
                      width: 400,
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
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                          color: blueColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text(
                        'Join/Login ',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  )
                ],
              ),
            )),
        body: Center(
          child: ScrollConfiguration(
            behavior:
            ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              child: Container(
                alignment: Alignment.centerLeft,
                width: 650,
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _questions.length,
                  itemBuilder: (context, index) {
                    final question = _questions[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          question['question'],
                          style: const TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.normal),
                          textAlign: TextAlign.start,
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
                                width: 600,
                                margin: const EdgeInsets.all(5),
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
            ),
          ),
        ),
      ),
    );
  }
}