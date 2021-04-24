import 'package:devquiz/challenge/challenge_controller.dart';
import 'package:devquiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:devquiz/challenge/widgets/questions_indicator/question_indicator_widget.dart';
import 'package:devquiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> question;
  ChallengePage({Key? key, required this.question}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
  }

  void nextPage() {
    if(controller.currentPage < widget.question.length)
    pageController.nextPage(
        duration: Duration(milliseconds: 800), curve: Curves.easeInExpo);
  }

  @override
  Widget build(BuildContext context) {
    var pageView = PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: pageController,
      children: widget.question
          .map((e) => QuizWidget(
                quesiton: e,
                onChange: nextPage,
              ))
          .toList(),
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86),
        child: SafeArea(
            top: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                ValueListenableBuilder<int>(
                    valueListenable: controller.currentPageNotifier,
                    builder: (context, value, _) => QuestionIndicatorWidget(
                          currentPage: value,
                          length: widget.question.length,
                        )),
              ],
            )),
      ),
      body: pageView,
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child:  ValueListenableBuilder<int>(valueListenable: controller.currentPageNotifier, builder: (context,value,_) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if(value < widget.question.length)
              Expanded(
                  child: NextButtonWidget.white(
                label: "Pular",
                onTap: () {},
              )),
              
              if(value == widget.question.length)
              Expanded(
                  child: NextButtonWidget.green(
                label: "Confirmar",
                onTap: () {
                  Navigator.pop(context);
                },
              ))
              ],))
        ),
      ),
    );
  }
}
