import '../../model/utilities/imports/generalImport.dart';

class DropDown extends StatelessWidget {
  final List<String> itemList;
  final String? validatorText;
  final FocusNode? focusNode;
  final String? dropDown, hint;
  final double? elevation, width, height, fontsize;
  final Function onTap;
  final FontWeight? fontWeight;
  final Function(String) onChanged;
  final Color? containerColor,
      textColor,
      dropDownColor,
      focusColor,
      borderColor;

  const DropDown(
      {super.key,
      required this.itemList,
      this.validatorText,
      required this.dropDown,
      this.focusNode,
      required this.onChanged,
      this.containerColor,
      this.textColor,
      this.hint,
      required this.onTap,
      this.elevation,
      this.dropDownColor,
      this.borderColor,
      this.focusColor,
      this.width,
      this.height,
      this.fontsize,
      this.fontWeight});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: sS(context).cH(height: height ?? 52),
        width: sS(context).cW(width: width ?? 400),
        padding: EdgeInsets.fromLTRB(
            sS(context).cW(width: 16), sS(context).cH(height: 2), 0, 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(
              sS(context).cH(height: 8),
            )),
            border: Border.all(color: borderColor ?? gray5),
            color: containerColor ?? white),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            hint: GeneralTextDisplay(
                hint ?? '', gray3, 1, 14, FontWeight.w400, ''),
            icon: Padding(
              padding: EdgeInsets.only(right: sS(context).cW(width: 16.41)),
              child: GeneralIconDisplay(
                  LineIcons.angleDown, black, UniqueKey(), 15),
            ),
            focusNode: focusNode,
            dropdownColor: dropDownColor ?? white,
            focusColor: focusColor ?? white,
            isExpanded: true,
            style: TextStyle(
                color: textColor,
                fontSize: fontsize ?? 14,
                fontWeight: fontWeight ?? FontWeight.w400),
            value: dropDown,
            items: itemList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                  value: value,
                  child: GeneralTextDisplay(value, textColor ?? black, 1,
                      fontsize ?? 14, FontWeight.w400, ''));
            }).toList(),
            onChanged: (value) {
              onChanged(value!);
            },
          ),
        ),
      ),
    );
  }
}
