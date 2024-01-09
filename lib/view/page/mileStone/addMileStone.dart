import 'package:baby_milestones_tracker/viewModel/mileStone/addMileStone.dart';

import '../../../model/utilities/imports/generalImport.dart';
import 'mileStoneDetail.dart';

class AddMileStonePage extends StatelessWidget {
  final String title;
  final List<String> milesOption;
  const AddMileStonePage(
      {required this.title, required this.milesOption, super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddMileStoneViewModel>.reactive(
        viewModelBuilder: () => AddMileStoneViewModel(),
        onViewModelReady: (model) {
          model.dropDownIndex = milesOption[0];
          print("This the value of : ${model.dropDownIndex}");
        },
        builder: (context, model, child) => BaseUi(children: [
              rowPositioned(
                  top: 60,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          print("We just pop it now");
                        },
                        child: const Icon(
                          LineIcons.angleLeft,
                          size: 24,
                          color: appBlack,
                        ),
                      ),
                      S(w: 10),
                      S(
                        w: 350,
                        h: 25,
                        child: RalewayText(
                          "Add  $title",
                          appBlack,
                          1,
                          18,
                          FontWeight.w600,
                          '',
                          letterSpacing: 0.18,
                        ),
                      ),
                    ],
                  )),
              rowPositioned(
                top: 110,
                child: SingleChildScrollView(
                  child: Container(
                    width: sS(context).cW(width: 400),
                    // height: sS(context).cH(height: 294),
                    padding: EdgeInsets.only(
                      top: sS(context).cH(height: 30),
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const GeneralTextDisplay(
                            "Select the kind of mile stone",
                            black,
                            1,
                            16,
                            FontWeight.w500,
                            ''),
                        S(h: 10),
                        DropDown(
                            // width: 300,
                            itemList: milesOption,
                            dropDown: model.dropDownIndex,
                            onChanged: (value) {
                              model.onChangeMileStone(value);
                            }),
                        S(
                          h: 25,
                        ),
                        const GeneralTextDisplay(
                            "Title", black, 1, 14, FontWeight.w600, ""),
                        S(
                          h: 5,
                        ),
                        FormattedTextFields(
                            keyInputType: TextInputType.text,
                            textFieldController: model.addTitleController,
                            textFieldHint: "Enter title of mile stone",
                            noBorder: false,
                            width: 380,
                            inputFormatters: [],
                            onChangedFunction: (onChange) {},
                            errorTextActive: model.addTitleError,
                            focusNode: model.addTitleFocusNode),
                        S(
                          h: 25,
                        ),
                        const GeneralTextDisplay(
                            "Description", black, 1, 14, FontWeight.w600, ""),
                        S(
                          h: 5,
                        ),
                        FormattedTextFields(
                            keyInputType: TextInputType.text,
                            textFieldController:
                                model.descriptionTitleController,
                            textFieldHint: "Enter title of mile stone",
                            textFieldLineSpan: 20,
                            noBorder: false,
                            width: 380,
                            height: 200,
                            inputFormatters: [],
                            onChangedFunction: (onChange) {},
                            errorTextActive: model.descriptionTitleError,
                            focusNode: model.descriptionTitleFocusNode),
                        S(
                          h: 70,
                        ),
                        buttonNoPositioned(context,
                            fontSize: 16,
                            height: 58,
                            text: "Submit", navigator: () {
                          model.onSaveMileStone(context, title);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MileStoneDetailPage(
                                      title: title, milesOption: milesOption)));
                        }, buttonColor: pink)
                      ],
                    ),
                  ),
                ),
              )
            ]));
  }
}
