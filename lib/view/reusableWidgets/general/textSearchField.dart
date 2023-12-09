import '../../../model/utilities/imports/generalImport.dart';

Widget textAndSearchField(context,
    {required TextInputType textInputType,
    required TextEditingController controller,
    required String hint,
    required String labelText,
    required Function onChanged,
    required List<TextInputFormatter> inputFormatter,
    required bool errorTextActive,
    required FocusNode focusNode,
    required String textFieldLabel,
    required Color outLineBorderColor,
    Widget? prefix,
    Widget? suffixIcon,
    double? height,
    required Widget? prefixIcon,
    double? borderRadius,
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
    containerColor: hexColor('FFF7F4F9'),
    noBorder: false,
    autoFocus: false,
    inputFormatters: inputFormatter,
    onChangedFunction: (onChange) {},
    errorTextActive: errorTextActive,
    focusNode: focusNode,
    prefixIcon: prefixIcon,
    prefix: prefix,
    suffixIcon: suffixIcon,
    textFont: 15,
    hintFont: 14,
    borderRadius: 10,
    cursorColor: gray3,
    obscureText: obscureText ?? false,
    hintColor: gray3,
    outLineBorderColor: outLineBorderColor,
    focusBorderColor: errorTextActive ? transparent : hexColor('BDBDBD'),
    textFontWeight: FontWeight.w500,
    hintFontWeight: FontWeight.w400,
    contentPadding: EdgeInsets.only(
        left: sS(context).cW(width: 16),
        right: sS(context).cW(width: 16),
        top: sS(context).cH(height: 16),
        bottom: sS(context).cH(height: 15)),
    labelFont: 15,
    labelColor: hexColor('BDBDBD'),
    labelFontWeight: FontWeight.w600,
  );
}

// search prefix icon
class SearchPrefix extends StatelessWidget {
  const SearchPrefix({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralContainer(
      height: 44,
      width: 44,
      color: primary400,
      allBorder: false,
      noBorderRadius: false,
      topLeft: 6,
      bottomLeft: 6,
      rightMargin: 22,
      child: Center(
          child:
              GeneralIconDisplay(Icons.search_sharp, white, UniqueKey(), 25)),
    );
  }
}

class FilterWidget extends StatelessWidget {
  final Function onTap;
  const FilterWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap();
      },
      child: GeneralContainer(
        height: 44,
        width: 48,
        color: primary400,
        borderRadius: 8,
        child: Center(
          child: GeneralIconDisplay(
              LineIcons.horizontalSliders, white, UniqueKey(), 24),
        ),
      ),
    );
  }
}
