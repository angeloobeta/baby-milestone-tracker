// this is used to return the substring of a long string
// that might possibly overflow when put inside a widget
import '../imports/generalImport.dart';

String processLongString(
    {required String unProcessedString,
    required int minimumStringLength,
    required int substringLength}) {
  return unProcessedString.length > minimumStringLength
      ? "${unProcessedString.substring(0, substringLength)}.."
      : unProcessedString;
}

processLongDouble(
    {required String unProcessedDoubleString,
    required int maximumStringLength}) {
  String processString =
      (double.parse(unProcessedDoubleString.replaceAll(",", ""))).toString();
  if (processString.contains('.') &&
      int.parse(processString.split('.')[1]) == 0) {
    processString = processString.split('.')[0];
  }
  return processString.length > maximumStringLength
      ? displayWithComma(
          k_m_b_generator(double.parse(unProcessedDoubleString.toString())))
      : displayWithComma(processString);
}
