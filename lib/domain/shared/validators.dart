import 'dart:async';

class Validator {
  static bool containsOnlyWhitespace(String input) {
    return RegExp(r'^\s*$').hasMatch(input);
  }

  static bool phone(String input) {
    if (input.isNotEmpty && input.length != 10) {
      return false;
    }
    return num.tryParse(input) != null ? true : false;
  }

  static final RegExp alphaExp = RegExp('[a-zA-Z]');
  static final RegExp alphaRegex = RegExp(r'^[a-zA-Z]+$');
  static const _emailRegExpString =
      r'[a-zA-Z0-9\+\.\_\%\-\+]{1,256}\@[a-zA-Z0-9]'
      r'[a-zA-Z0-9\-]{0,64}(\.[a-zA-Z0-9][a-zA-Z0-9\-]{0,25})+';
  static final _emailRegex = RegExp(_emailRegExpString, caseSensitive: false);

  static bool isValidPassword(String password) => password.length >= 3;

  static bool isValidEmail(String email) => _emailRegex.hasMatch(email);

  static bool isString1(String val) => alphaRegex.hasMatch(val);

  static bool isString(String val) => alphaExp.hasMatch(val);

  // ? null
  // : 'Only Alphabets are allowed in a username');

  static bool isValidUserName(String userName) => userName.length >= 3;

  static bool isValidContactNo(String phoneNo) => phoneNo.length == 10;

  static bool isValidContactNoWithZero(String phoneNo) =>
      phoneNo.length == 11 || phoneNo.length == 10;

  static bool isValidWhiteSpace(String val) => RegExp(r"\s").hasMatch(val);

  static bool validateUKPhoneNumber(String phoneNumber) {
    // Define a regular expression for a UK phone number pattern.
    // This regex pattern allows for various formats including:
    // - +44 1234 567890
    // - 01234 567890
    // - 07700 900000
    // - 020 7946 0958
    // - and more
    if (phoneNumber.isNotEmpty && phoneNumber[0] == '0') {
      // Check if the string is not empty and starts with '0'
      phoneNumber = phoneNumber.substring(1); // Remove the first character
    }
    print(phoneNumber);

    RegExp ukPhoneNumberRegExp =
        RegExp(r'^(\+44)[0|1|2|7][0-9]{0,4}(\s)?[1-9][0-9]{2,4}(\s)?[0-9]{4}$');

    // RegExp ukPhoneNumberRegExp = RegExp(
    //     r'^((\+44)|(0)) ?\d{4} ?\d{6}$');

    return ukPhoneNumberRegExp.hasMatch("+44$phoneNumber");
  }

  static bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  var contactValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (phone, sink) {
    if (phone.isNotEmpty && phone != null) {
      if (isValidContactNo(phone)) {
        sink.add(phone);
      } else {
        sink.addError("Mobile number must be 10 digit");
      }
    } else {
      sink.addError("null");
    }
  });

  var contactNoValidator =
      StreamTransformer<String, bool>.fromHandlers(handleData: (phone, sink) {
    if (phone.isNotEmpty && phone != null) {
      if (isValidContactNo(phone)) {
        sink.add(true);
      } else {
        sink.addError(false);
      }
    } else {
      sink.addError(false);
    }
  });
}
