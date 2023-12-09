import 'package:baby_milestones_tracker/model/utilities/imports/flutterImport.dart';
import 'package:baby_milestones_tracker/viewModel/mileStone/mileStone.dart';

class AddMileStoneViewModel extends MileStoneViewModel {
  // drop down section
  String dropDownIndex = "Select an option";

  onChangeMileStone(value) {
    dropDownIndex = value;
    notifyListeners();
    print(dropDownIndex);
  }

  // title section
  TextEditingController addTitleController = TextEditingController();
  FocusNode addTitleFocusNode = FocusNode();
  bool addTitleError = false;

  // description
  TextEditingController descriptionTitleController = TextEditingController();
  FocusNode descriptionTitleFocusNode = FocusNode();
  bool descriptionTitleError = false;
}
