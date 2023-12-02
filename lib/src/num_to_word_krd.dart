import 'string_extension.dart';

abstract class NumberToWordKrdConverter {
  static const List<String> _units = [
    'سفر',
    'یه‌ک',
    'دوو',
    'سێ',
    'چوار',
    'پێنج',
    'شەش',
    'حەوت',
    'هەشت',
    'نۆ',
    'دە',
    'یازدە',
    'دوازدە',
    'سێزدە',
    'چواردە',
    'پازدە',
    'شازدە',
    'حەڤدە',
    'هەژدە',
    'نوزدە'
  ];

  static const List<String> _tens = ['', '', 'بیست', 'سی', 'چل', 'پەنجا', 'شەست', 'حەفتا', 'هەشتا', 'نەوەد'];

  static const List<String> _hundreds = ['', 'سەد', 'دوو سەد', 'سێ سەد', 'چوار سەد', 'پێنج سەد', 'شەش سەد', 'حەوت سەد', 'هەشت سەد', 'نۆ سەد'];

  static const List<String> _thousands = ['', 'هەزار', 'ملیۆن', 'ملیار', 'ملیۆن ملیار'];

  static String convert(int number) {
    if (number == 0) return _units[0];

    String result = '';
    int groupIndex = 0;

    while (number > 0) {
      if (number % 1000 != 0) {
        result = '${_convertHundreds(number % 1000)} ${_thousands[groupIndex]} و $result';
      }
      number ~/= 1000;
      groupIndex++;
    }

    return result.trim().removeLastLetter().trim();
  }

  static String _convertHundreds(int number) {
    if (number == 0) return '';

    if (number < 20) {
      return _units[number];
    } else if (number < 100) {
      final convertedOnes = _convertHundreds(number % 10);
      final convertedTens = _tens[number ~/ 10];
      if (convertedOnes.isEmpty) {
        return convertedTens;
      }
      return '$convertedTens و $convertedOnes';
    } else {
      final convertedHundredsPart = _convertHundreds(number % 100);
      final convertedHundredsFull = _hundreds[number ~/ 100];
      if (convertedHundredsPart.isEmpty) {
        return convertedHundredsFull;
      }
      return '$convertedHundredsFull و $convertedHundredsPart';
    }
  }
}
