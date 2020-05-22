import 'package:bmi_calculator/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({@required this.value, @required this.onChange});

  final int value;
  final Function onChange;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: Colors.white,
        inactiveTrackColor: kInactiveButtonColor,
        thumbColor: kActiveButtonColor,
        overlayColor: Color(0x29EB1555),
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
      ),
      child: Slider(
        value: value.toDouble(),
        min: kMinHeight.toDouble(),
        max: kMaxHeight.toDouble(),
        onChanged: (double newValue) {
          onChange(newValue.round());
        },
      ),
    );
  }
}
