// this textField is for otp textField

import '../../model/utilities/imports/generalImport.dart';

class PinTextField extends StatelessWidget {
  final TextInputType keyInputType;
  final TextEditingController textFieldController;
  final int textFieldLineSpan;
  final String textFieldLabel;
  final String textFieldHint;
  final dynamic functionValue;
  final double height;
  final double width;
  final Color containerColor;
  final bool greyBackground;
  final FocusNode focus;
  final Function onFieldSubmitted;
  final int maxIndex;
  final bool? errorTextActive;

  const PinTextField(
      this.keyInputType,
      this.textFieldController,
      this.textFieldLabel,
      this.textFieldHint,
      this.functionValue,
      this.textFieldLineSpan,
      this.height,
      this.width,
      this.containerColor,
      this.greyBackground,
      this.focus,
      this.onFieldSubmitted,
      this.maxIndex,
      {super.key, this.errorTextActive});

  @override
  Widget build(BuildContext context) {
    Size dynamicSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Container(
      height: sS(context).cH(height: height),
      width: sS(context).cW(width: width),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(
            MediaQuery.of(context).size.height * (4 / 932)),
      ),
      alignment: Alignment.center,
      child: Align(
        alignment: Alignment.center,
        child: TextFormField(
          textAlignVertical: TextAlignVertical.bottom,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly
          ],
          cursorColor: blue,
          keyboardType: keyInputType,
          controller: textFieldController,
          maxLines: textFieldLineSpan,
          focusNode: focus,
          textInputAction:
          maxIndex == 4 ? TextInputAction.done : TextInputAction.done,
          onChanged: (change) {
            onFieldSubmitted();
          },
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: blue,
                  fontSize: orientation == Orientation.portrait
                      ? sS(context).cH(height: 30)
                      : dynamicSize.width * (16 / 932),
                  fontWeight: FontWeight.w500)),
          autocorrect: true,
          decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              labelText: textFieldLabel,
              hintStyle: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: orientation == Orientation.portrait
                          ? MediaQuery.of(context).size.height * (30 / 932)
                          : dynamicSize.width * (16 / 932),
                      color: blue,
                      fontWeight: FontWeight.w500)),
              hintText: textFieldHint,
              labelStyle: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      fontSize: orientation == Orientation.portrait
                          ? MediaQuery.of(context).size.height * (15 / 932)
                          : dynamicSize.width * (16 / 800),
                      color: const Color.fromRGBO(186, 186, 186, 1.0),
                      fontWeight: FontWeight.w500)),
              contentPadding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * (15 / 390),
                  MediaQuery.of(context).size.height * (5 / 844),
                  MediaQuery.of(context).size.width * (2 / 390),
                  MediaQuery.of(context).size.height * (5 / 932)),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: grey, width: 1.0, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(
                    orientation == Orientation.portrait
                        ? MediaQuery.of(context).size.height * (4 / 932)
                        : dynamicSize.width * (4 / 800),
                  )),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: errorTextActive == true ? red : blue,
                      width: 1.0,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(
                    orientation == Orientation.portrait
                        ? MediaQuery.of(context).size.height * (4 / 932)
                        : dynamicSize.width * (4 / 932),
                  ))),
        ),
      ),
    );
  }
}

class FormattedTextFields extends StatelessWidget {
  final TextInputType keyInputType;
  final TextInputAction? textInputAction;
  final TextEditingController? textFieldController;
  final int? textFieldMinLineSpan, textFieldLineSpan, maxLength;
  final String? textFieldHint;
  final double? height, width, textFont, hintFont, labelFont, borderRadius;
  final Color? containerColor,
      cursorColor,
      hintColor,
      labelColor,
      outLineBorderColor,
      focusBorderColor;
  final bool? noBorder, autoFocus, obscureText, readOnly;
  final Function(dynamic)? onChangedFunction;
  final Function? onTap,onEditingComplete;
  final List<TextInputFormatter> inputFormatters;
  final bool errorTextActive;
  final FocusNode? focusNode;
  final Widget? prefixIcon, suffixIcon;
  final Widget? prefix;
  final FontWeight? textFontWeight, hintFontWeight, labelFontWeight;
  final FloatingLabelBehavior? labelBehaviour;
  final bool? enableInteractiveSelection;
  final Alignment? align;
  final double? cursorHeight;
  final TextAlign? textAlign;
  final EdgeInsets? contentPadding;

  const FormattedTextFields({
    Key? key,
    required this.keyInputType,
    required this.textFieldController,
    required this.textFieldHint,
    this.textFieldLineSpan,
    this.height,
    this.width,
    this.textFieldMinLineSpan,
    this.containerColor,
    this.enableInteractiveSelection,
    required this.noBorder,
    this.autoFocus,
    this.textInputAction,
    required this.inputFormatters,
    required this.onChangedFunction,
    required this.errorTextActive,
    required this.focusNode,
    this.prefixIcon,
    this.prefix,
    this.suffixIcon,
    this.textFont,
    this.hintFont,
    this.labelFont,
    this.cursorHeight,
    this.borderRadius,
    this.cursorColor,
    this.hintColor,
    this.labelColor,
    this.outLineBorderColor,
    this.focusBorderColor,
    this.textFontWeight,
    this.hintFontWeight,
    this.labelFontWeight,
    this.obscureText,
    this.labelBehaviour,
    this.maxLength,
    this.align,
    this.onTap,
    this.readOnly,
    this.textAlign,
    this.contentPadding, this.onEditingComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sS(context).cH(height: height ?? 52),
      width: sS(context).cW(width: width ?? 400),
      decoration: BoxDecoration(
        color: containerColor ?? white,
        borderRadius:
        BorderRadius.circular(sS(context).cW(width: borderRadius ?? 8)),
      ),
      alignment: align ?? Alignment.center,
      child: TextFormField(
        focusNode: focusNode,
        onTap: () {
          if (onTap != null) onTap!();
        },

        onChanged: 
          onChangedFunction!, // this function to validate the

        // text field as the user types in it
        autofocus: autoFocus ?? false,
        enabled: readOnly ?? true,
        cursorHeight: cursorHeight,
        cursorColor: cursorColor ?? gray4,
        textInputAction: textInputAction ?? TextInputAction.done,
        keyboardType: keyInputType,
        obscureText: obscureText ?? false,
        obscuringCharacter: '*',
        controller: textFieldController,
        textAlign: textAlign ?? TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        enableInteractiveSelection: enableInteractiveSelection,
        minLines: textFieldMinLineSpan,
        maxLines: textFieldLineSpan ?? 1,
        inputFormatters: inputFormatters,
        onEditingComplete: (){
          if (onEditingComplete != null) onEditingComplete!();



        },

        style: GoogleFonts.raleway(
            textStyle: TextStyle(
                color: black,
                fontSize: textFont ?? 15,
                fontWeight: textFontWeight ?? FontWeight.w500)),
        decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            prefix: prefix,
            hintStyle: GoogleFonts.raleway(
                textStyle: TextStyle(
                    fontSize: sS(context).cH(height: hintFont ?? 14),
                    color: hintColor ?? gray3,
                    fontWeight: hintFontWeight ?? FontWeight.normal)),
            hintText: textFieldHint,
            prefixIconConstraints:
            const BoxConstraints(minWidth: 0, minHeight: 0),
            contentPadding: contentPadding ??
                EdgeInsets.fromLTRB(sS(context).cW(width: 16),
                    sS(context).cH(height: 12), 0, 0),
            disabledBorder: OutlineInputBorder(
                borderSide: noBorder == true
                    ? BorderSide.none
                    : BorderSide(
                    color: outLineBorderColor ?? gray5,
                    width: 1.0,
                    style: noBorder == true
                        ? BorderStyle.none
                        : BorderStyle.solid),
                borderRadius: BorderRadius.circular(
                    sS(context).cW(width: borderRadius ?? 4))),
            enabledBorder: OutlineInputBorder(
                borderSide: noBorder == true
                    ? BorderSide.none
                    : BorderSide(
                    color: outLineBorderColor ?? gray5,
                    width: 1.0,
                    style: noBorder == true
                        ? BorderStyle.none
                        : BorderStyle.solid),
                borderRadius: BorderRadius.circular(
                    sS(context).cW(width: borderRadius ?? 8))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: errorTextActive == true
                        ? red
                        : focusBorderColor ?? gray500,
                    width: 1.0,
                    style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(
                    sS(context).cW(width: borderRadius ?? 8)))),
      ),
    );
  }
}
