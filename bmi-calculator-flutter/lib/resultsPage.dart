import 'package:bmi_calculator/constants/constants.dart';
import 'package:bmi_calculator/widgets/bottomButton.dart';
import 'package:bmi_calculator/widgets/reusableCard.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  Map arguments;
  @override
  Widget build(BuildContext context) {
    arguments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(left: 30, top: 15),
                  child: Text(
                    'Your Result',
                    style: kResultHeaderStyle,
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: ReusableCard(
                  color: kActiveCardColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        arguments['header'],
                        style: kResultTextStyle,
                      ),
                      Text(
                        arguments['value'],
                        style: kResultValueStyle,
                      ),
                      Text(
                        arguments['description'],
                        style: kResultDescriptionStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              BottomButton(
                label: 'RE-CALCULATE BMI',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
