import 'package:num_to_word_krd/num_to_word_krd.dart';

void main() {
  for (var i = 100000; i <= 1000000; i = i + 10500) {
    print('$i = ${NumberToWordKrdConverter.convert(i)}');
  }
}
