import 'package:baby_milestones_tracker/viewModel/mileStone/mileStone.dart';
import 'package:hive/hive.dart';

import '../../model/models/mileStone.dart';
import '../../model/utilities/imports/generalImport.dart';

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

  onSaveMileStone(context, categoryName) {
    final formattedDate =
        DateFormat.yMMMMd().add_jm().format(DateTime.now().toLocal());
    final milestonesBox = Hive.box<Milestone>('milestones');
    milestonesBox
        .add(Milestone(
          category: categoryName,
          typeOfMilestone: dropDownIndex.toString(),
          title: addTitleController.text,
          description: descriptionTitleController.text,
          dateOfCreate: formattedDate,
        ))
        .then((value) =>
            {print("This is value that we are talking about: $value")});
    notifyListeners();
    print("Data saved");
  }
}
