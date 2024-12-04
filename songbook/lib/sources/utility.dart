import 'package:flutter/material.dart';

const kblack = Color(0xff1E1D1D);
const kyellow = Color(0xFFEBB428);

const ktext = TextStyle(
  fontFamily: 'BalsamiqSans',
  color: Colors.white,
  fontSize: 30,
);

const ktext1 = TextStyle(
  fontFamily: 'BalsamiqSans',
  color: kblack,
  fontSize: 20,
);

const ktext2 = TextStyle(
  fontFamily: 'BalsamiqSans',
  color: kblack,
  fontSize: 13,
);

const ktext3 = TextStyle(
  fontFamily: 'BalsamiqSans',
  color: Colors.white,
  fontSize: 25,
);

const ktext4 = TextStyle(
  fontFamily: 'BalsamiqSans',
  color: kblack,
  fontSize: 16,
);

const ktext5 = TextStyle(
  fontFamily: 'BalsamiqSans',
  color: kblack,
  fontSize: 15,
);

const ktext6 = TextStyle(
  fontWeight: FontWeight.bold,
  color: kblack,
  fontSize: 15,
);

const ktext7 = TextStyle(
  fontFamily: 'BalsamiqSans',
  color: Colors.black,
  fontSize: 12,
);

const ktext8 = TextStyle(
  fontFamily: 'BalsamiqSans',
  color: Colors.black,
  fontSize: 16,
);

const RadialGradient gradient = RadialGradient(
  center: Alignment(0.7, 0.6),
  radius: 2.5,
    colors: <Color>[
    Color(0xFFDAA520),
    Color(0xFFFFD700),
    Color(0xFFDAA520),
  ],
  stops: <double>[0.2,0.4,0.6],
);

const RadialGradient gradient1 = RadialGradient(
  center: Alignment(0.1, 0.6),
  radius: 2.5,
    colors: <Color>[
    Color(0xFFDAA520),
    Color(0xFFFFD700),
    Color(0xFFDAA520),
  ],
  stops: <double>[0.2,0.6,0.6],
);

textFieldDecor(String text, Widget icon, {String? errorText}) =>
  InputDecoration(
    labelStyle: kTextFormFieldStyle,
    hintStyle: kTextFormFieldStyle,
    hintText: text,
    errorText: errorText,
    filled: true,
    fillColor: Colors.grey[200],
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(35),
      borderSide:const BorderSide(
        color: Colors.transparent
      )
    ),
    suffixIcon: Padding(
      padding: const EdgeInsets.only(right: 10),
      child: icon,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(35),
      borderSide:const BorderSide(
        color: Colors.transparent
      )
    ),
  );

const kTextFormFieldStyle = TextStyle(
  fontFamily: 'BalsamiqSans',
  fontSize: 18.0,
  color: Colors.black,
  fontWeight: FontWeight.w500,
);
