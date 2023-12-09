import '../../../model/utilities/imports/generalImport.dart';

class DropDown extends StatelessWidget {
  final List<String> itemList;
  final String? validatorText;
  final FocusNode? focusNode;
  final String? dropDown;
  final double? width;
  final double? elevation;
  final double? fontSize;
  final Function(String) onChanged;
  final Color? containerColor, textColor, dropDownColor, focusColor;

  const DropDown(
      {super.key,
      required this.itemList,
      this.validatorText,
      required this.dropDown,
      this.focusNode,
      required this.onChanged,
      this.containerColor,
      this.textColor,
      this.width,
      this.fontSize,
      this.elevation,
      this.dropDownColor,
      this.focusColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: sS(context).cH(height: 48),
      width: sS(context).cW(width: width ?? 358),
      padding: EdgeInsets.fromLTRB(
          sS(context).cW(width: 16), sS(context).cH(height: 2), 0, 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(
            sS(context).cH(height: 8),
          )),
          border: Border.all(color: gray5),
          color: containerColor ?? white),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          hint: GeneralTextDisplay(
              itemList[0], gray2, 1, 14, FontWeight.w400, ''),
          icon: Padding(
            padding: EdgeInsets.only(right: sS(context).cW(width: 16.41)),
            child:
                GeneralIconDisplay(LineIcons.angleDown, black, UniqueKey(), 15),
          ),
          focusNode: focusNode,
          dropdownColor: dropDownColor ?? white,
          focusColor: focusColor ?? white,
          isExpanded: true,
          style: TextStyle(
              color: textColor,
              fontSize: fontSize ?? 14,
              fontWeight: FontWeight.w400),
          value: dropDown,
          items: itemList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
                value: value,
                child: GeneralTextDisplay(
                    value, textColor ?? black, 1, 14, FontWeight.w400, ''));
          }).toList(),
          onChanged: (value) {
            onChanged(value!);
          },
        ),
      ),
    );
  }
}
