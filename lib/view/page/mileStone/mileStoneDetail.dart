import 'package:baby_milestones_tracker/model/utilities/imports/generalImport.dart';
import 'package:baby_milestones_tracker/viewModel/mileStone/mileStone.dart';

import 'addMileStone.dart';

class MileStoneDetailPage extends StatelessWidget {
  final String title;
  final List<String> milesOption;
  const MileStoneDetailPage(
      {required this.title, required this.milesOption, super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MileStoneViewModel>.reactive(
        viewModelBuilder: () => MileStoneViewModel(),
        builder: (context, model, child) => BaseUi(
                floatingActionButton: FloatingActionButton(
                  backgroundColor: pink,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddMileStonePage(
                                  title: title,
                                  milesOption: milesOption,
                                )));
                  },
                  child: GeneralIconDisplay(Icons.add, white, UniqueKey(), 40),
                ),
                children: [
                  header(context, title),
                  rowPositioned(top: 130, child: Text("No data found"))
                ]));
  }
}
