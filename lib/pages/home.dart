import 'package:flutter/material.dart';
import 'package:user_input/components/my_button.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> buttonList = [
    "C",
    "D",
    "/",
    ")",
    "7",
    "8",
    "9",
    "*",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    "(",
    "0",
    ".",
    "=",
  ];

  bool isOperator(String x) {
    if (x == "/" || x == "%" || x == "*" || x == "-" || x == "+") {
      return true;
    }
    return false;
  }

  bool isC(String x) {
    if (x == "C") {
      return true;
    }
    return false;
  }

  bool isD(String x) {
    if (x == "D") {
      return true;
    }
    return false;
  }

  bool isEqual(String x) {
    if (x == "=") {
      return true;
    }
    return false;
  }

  void equal() {
    // final String equalQuestion = question;
    Parser p = Parser();
    Expression exp = p.parse(question);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    answer = eval.toString();
  }

  String answer = "";
  String question = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 52, left: 25, right: 10),
                  // ignore: avoid_unnecessary_containers
                  child: SingleChildScrollView(
                    child: Container(
                      alignment: Alignment.topLeft,
                      child:
                          Text(question, style: const TextStyle(fontSize: 24)),
                    ),
                  ),
                ),
                // const SizedBox(height: 100),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 5, right: 25, top: 120, bottom: 5),
                  // ignore: avoid_unnecessary_containers
                  child: SingleChildScrollView(
                    child: Container(
                      alignment: Alignment.bottomRight,
                      child: Text(answer, style: const TextStyle(fontSize: 24)),
                    ),
                  ),
                ),
                Divider(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: GridView.builder(
              itemCount: buttonList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
              // ignore: body_might_complete_normally_nullable
              itemBuilder: (BuildContext context, int index) {
                if (isOperator(buttonList[index]) == true) {
                  return MyButton(
                    /////////////
                    background: Theme.of(context).colorScheme.primaryContainer,
                    text: buttonList[index],
                    onTaped: () {
                      setState(() {
                        question = question + buttonList[index];
                      });
                    }, //////////////////////////////////////////////////
                    color: Theme.of(context).colorScheme.secondary,
                    size: 35,
                  );
                } else if (isEqual(buttonList[index]) == true) {
                  return MyButton(
                    background: Theme.of(context).colorScheme.secondary,
                    text: buttonList[index],
                    onTaped: () {
                      setState(() {
                        equal();
                      });
                    }, //////////////////////////////////////////////////
                    color: Colors.white, /////
                    size: 35,
                  );
                } else if (isC(buttonList[index]) == true) {
                  return MyButton(
                    background: Theme.of(context).colorScheme.primaryContainer,
                    text: buttonList[index],
                    onTaped: () {
                      setState(() {
                        question = "";
                        answer = "";
                      });
                    }, //////////////////////////////////////////////////
                    color: const Color.fromARGB(255, 255, 0, 0),
                    size: 30,
                  );
                } else if (isD(buttonList[index]) == true) {
                  return MyButton(
                    background: Theme.of(context).colorScheme.primaryContainer,
                    text: buttonList[index],
                    onTaped: () {
                      setState(() {
                        question = question.substring(0, question.length - 1);
                      });
                    }, //////////////////////////////////////////////////
                    color: Theme.of(context).colorScheme.inversePrimary,
                    size: 30,
                  );
                } else if (isOperator(buttonList[index]) == false) {
                  return MyButton(
                    background: Theme.of(context).colorScheme.primaryContainer,
                    text: buttonList[index],
                    onTaped: () {
                      setState(() {
                        question = question + buttonList[index];
                      });
                    }, //////////////////////////////////////////////////
                    color: Theme.of(context).colorScheme.primary,
                    size: 20,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
