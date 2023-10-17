import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harsatapp/widget/custom_color.dart';

// ignore: must_be_immutable
class BlackText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextAlign textAlign;
  FontWeight? fontWeight;
  int maxLines; // Changed to nullable int
  final TextOverflow overflow;

  BlackText({
    Key? key,
    this.color = CustomColors.mainBlack,
    required this.text,
    required this.size,
    this.textAlign = TextAlign.center,
    required this.fontWeight,
    this.maxLines = 2, // Updated to nullable int
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'Lato-Regular', // Updated to use the correct font name
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }
}

// ignore: must_be_immutable
class WhiteText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextAlign textAlign;
  FontWeight? fontWeight;
  WhiteText(
      {Key? key,
      this.color = CustomColors.mainWhite,
      required this.text,
      required this.size,
      this.textAlign = TextAlign.start,
      required this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          fontFamily: 'assets/fonts/Lato-Regular.ttf',
          color: color,
          fontSize: size,
          fontWeight: fontWeight),
    );
  }
}

// ignore: must_be_immutable
class PurpleText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextAlign textAlign;
  PurpleText({
    Key? key,
    this.color = CustomColors.mainPurple,
    this.text = "Tümünü Gör",
    this.size = 16,
    this.textAlign = TextAlign.end,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: 'assets/fonts/Lato-Regular.ttf',
        color: color,
        fontSize: size,
      ),
    );
  }
}

// ignore: must_be_immutable
class GreyText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextAlign textAlign;
  FontWeight? fontWeight;
  int maxLines; // Changed to nullable int
  final TextOverflow overflow;
  GreyText({
    Key? key,
    this.color = CustomColors.mainGrey,
    required this.text,
    required this.size,
    this.textAlign = TextAlign.center,
    required this.fontWeight,
    this.maxLines = 3, // Updated to nullable int
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'assets/fonts/Lato-Regular.ttf',
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }
}

// ignore: must_be_immutable
class GreyText2 extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextAlign textAlign;
  FontWeight? fontWeight;
  GreyText2({
    Key? key,
    this.color = CustomColors.mainGrey,
    required this.text,
    required this.size,
    this.textAlign = TextAlign.center,
    required this.fontWeight, // Updated to nullable int
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: 'assets/fonts/Lato-Regular.ttf',
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }
}

// ignore: must_be_immutable
class GreenText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextAlign textAlign;
  GreenText(
      {Key? key,
      this.color = CustomColors.darkGreen,
      required this.text,
      required this.size,
      this.textAlign = TextAlign.center})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: 'assets/fonts/Lato-Regular.ttf',
        color: color,
        fontSize: size,
      ),
    );
  }
}

// ignore: must_be_immutable
class ColorText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextAlign textAlign;
  int maxLine;
  final TextOverflow overflow;
  ColorText(
      {Key? key,
      required this.color,
      required this.text,
      required this.size,
      this.textAlign = TextAlign.center,
      this.maxLine = 2,
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLine,
      style: TextStyle(
        fontFamily: 'assets/fonts/Lato-Regular.ttf',
        color: color,
        fontSize: size,
      ),
    );
  }
}
