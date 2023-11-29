import 'package:flutter/material.dart';

sealed class Constants {
  static ThemeData theme(BuildContext context) => Theme.of(context);
  static const String apiUrl =
      'https://test-frontend-developer.s3.amazonaws.com/data/locations.json';
}
