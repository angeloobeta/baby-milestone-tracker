import 'package:baby_milestones_tracker/model/utilities/imports/generalImport.dart';
import 'package:baby_milestones_tracker/viewModel/mileStone/mileStone.dart';
import 'package:hive/hive.dart';

import '../../../model/models/mileStone.dart';
import 'addMileStone.dart';

class MileStoneDetailPage extends StatelessWidget {
  final String title;
  final List<String> milesOption;
  const MileStoneDetailPage(
      {required this.title, required this.milesOption, super.key});

  @override
  Widget build(BuildContext context) {
    final milestonesBox = Hive.box<Milestone>('milestones');
    final categoryMilestones = milestonesBox.values
        .where((milestone) => milestone.category == title)
        .toList();
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
                  rowPositioned(
                    top: 60,
                    child: S(
                      h: 800,
                      w: 400,
                      child: ListView.builder(
                        itemCount: categoryMilestones.length,
                        itemBuilder: (context, index) {
                          final milestone = categoryMilestones[index];
                          return Card(
                            child: milestone.title == ""
                                ? const Center(
                                    child: GeneralTextDisplay(
                                        "No miles has been recordered, the floating icon button to record a milestone for your baby",
                                        black,
                                        4,
                                        14,
                                        FontWeight.w600,
                                        ""),
                                  )
                                : ListTile(
                                    title: GeneralTextDisplay(milestone.title,
                                        black, 1, 16, FontWeight.w500, ""),
                                    subtitle: GeneralTextDisplay(
                                        '${milestone.description} \n ${milestone.typeOfMilestone} \n${milestone.dateOfCreate}',
                                        black,
                                        6,
                                        12,
                                        FontWeight.w400,
                                        ""),
                                  ),
                          );
                        },
                      ),
                    ),
                  )
                ]));
  }
}
