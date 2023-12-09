import '../../model/utilities/imports/generalImport.dart';

class GeneralTextDisplay extends StatelessWidget {
  final String inputText;
  final double? textFontSize, letterSpacing;
  final FontWeight textFontWeight;
  final int noOfTextLine;
  final String textSemanticLabel;
  final Color textColor;
  final TextDecoration? textDecoration;
  final TextAlign? textAlign;
  final Color? decorationColor;
  final List<Shadow>? shadow;

  const GeneralTextDisplay(this.inputText, this.textColor, this.noOfTextLine,
      this.textFontSize, this.textFontWeight, this.textSemanticLabel,
      {super.key,
      this.textDecoration,
      this.shadow,
      this.textAlign,
      this.decorationColor,
      this.letterSpacing});

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Text(
      inputText,
      style: GoogleFonts.raleway(
        textStyle: TextStyle(
            // add line height to the text widget if the design look different
            color: textColor,
            letterSpacing: letterSpacing ?? 0.02,
            fontSize: orientation == Orientation.portrait
                ? sS(context).cH(height: textFontSize)
                : sS(context).cW(width: textFontSize),
            shadows: shadow ?? [],
            fontWeight: textFontWeight,
            decoration: textDecoration ?? TextDecoration.none,
            decorationColor: decorationColor ?? black,
            decorationStyle: TextDecorationStyle.solid),
      ),
      maxLines: noOfTextLine,
      semanticsLabel: textSemanticLabel,
      textAlign: textAlign ?? TextAlign.left,
      overflow: TextOverflow.ellipsis,
    );
  }
}

// rubik text

class RalewayText extends StatelessWidget {
  final String inputText;
  final double? textFontSize, letterSpacing;
  final FontWeight textFontWeight;
  final int noOfTextLine;
  final String textSemanticLabel;
  final Color textColor;
  final TextDecoration? textDecoration;
  final TextAlign? textAlign;
  final Color? decorationColor;
  final List<Shadow>? shadow;

  const RalewayText(this.inputText, this.textColor, this.noOfTextLine,
      this.textFontSize, this.textFontWeight, this.textSemanticLabel,
      {super.key,
      this.textDecoration,
      this.shadow,
      this.textAlign,
      this.decorationColor,
      this.letterSpacing});

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Text(
      inputText,
      style: GoogleFonts.raleway(
          textStyle: TextStyle(
              // add line height to the text widget if the design look different
              color: textColor,
              letterSpacing: letterSpacing ?? 0.02,
              shadows: shadow,
              fontSize: orientation == Orientation.portrait
                  ? sS(context).cH(height: textFontSize)
                  : sS(context).cW(width: textFontSize),
              fontWeight: textFontWeight,
              decoration: textDecoration ?? TextDecoration.none,
              decorationColor: decorationColor ?? black,
              decorationStyle: TextDecorationStyle.solid)),
      maxLines: noOfTextLine,
      semanticsLabel: textSemanticLabel,
      textAlign: textAlign ?? TextAlign.left,
    );
  }
}

// text span\
