import 'package:flutter/cupertino.dart';

class FormValidators {

  FormValidators._();

   static FormFieldValidator<String?> getLeastValueValidator(int minValue, String errorMessage) {
    return (String? value) {
      if (value == null ||
          value.trim().isEmpty ||
          value.trim().length < minValue) {
        return errorMessage;
      }
      return null;
    };
  }

  static FormFieldValidator<String?> getEmptyValueValidator(String errorMessage) {
    return (String? value) {
      if (value == null || value.trim().isEmpty) {
        return errorMessage;
      }
      return null;
    };
  }
}