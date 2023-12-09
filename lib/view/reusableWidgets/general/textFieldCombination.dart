// * this function creates a combination of the text and
// * text field used in the project
import '../../../model/utilities/imports/generalImport.dart';

Widget textAndTextField(context,
    {required TextInputType textInputType,
    required TextEditingController controller,
    required String hint,
    required String labelText,
    required Function onChanged,
    required List<TextInputFormatter> inputFormatter,
    required bool errorTextActive,
    required FocusNode focusNode,
    required Widget? prefix,
    double? height,
    double? borderRadius,
    Widget? suffix,
    Widget? suffixIcon,
    Widget? prefixIcon,
    bool? obscureText,
    Color? borderColor,
    bool? enabled,
    double? width}) {
  return FormattedTextFields(
    keyInputType: textInputType,
    textFieldController: controller,
    textFieldHint: hint,
    textFieldLineSpan: 1,
    height: height ?? 52,
    width: width ?? 430,
    containerColor: white,
    noBorder: false,
    autoFocus: false,
    inputFormatters: inputFormatter,
    onChangedFunction: (value) {
      onChanged();
    },
    errorTextActive: errorTextActive,
    focusNode: focusNode,
    prefixIcon: prefixIcon,
    prefix: prefix,
    suffixIcon: suffixIcon,
    textFont: 15,
    hintFont: 14,
    borderRadius: borderRadius ?? 10,
    cursorColor: black,
    obscureText: obscureText ?? false,
    hintColor: hexColor("1B1D1E"),
    outLineBorderColor: grey,
    focusBorderColor: errorTextActive ? transparent : grey,
    textFontWeight: FontWeight.w500,
    hintFontWeight: FontWeight.w400,
    contentPadding: EdgeInsets.only(
        left: sS(context).cW(width: 16),
        right: sS(context).cW(width: 16),
        top: sS(context).cH(height: 16),
        bottom: sS(context).cH(height: 15)),
    labelFont: 15,
    labelColor: black,
    labelFontWeight: FontWeight.w600,
  );
}