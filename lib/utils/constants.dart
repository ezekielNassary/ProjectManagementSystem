import 'package:flutter/material.dart';

import '../themes/color_scheme.dart';

const apiBaseUrl = 'https://easydigitaltz.000webhostapp.com/pms/';
const sampleUrl = 'https://easydigitaltz.000webhostapp.com/pms/sample.php';
const apiKey = '';
const imageBaseUrl = 'https://easydigitaltz.000webhostapp.com/pms/images/';
const defaultDuration = Duration(milliseconds: 250);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(color: ThemeColor.primaryGrey),
  );
}

TextStyle headingstyle = const TextStyle(
    fontSize: 16,
    color: ThemeColor.primaryBlack,
    letterSpacing: 1,
    fontFamily: 'Muli');
