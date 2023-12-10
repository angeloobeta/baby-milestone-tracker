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
                              title,
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
                    top: 100,
                    child: S(
                        h: 800,
                        w: 400,
                        child: categoryMilestones.isEmpty
                            ? const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: GeneralTextDisplay(
                                      "No miles has been reordered yet, press the pink button to record a milestone for your baby",
                                      black,
                                      4,
                                      18,
                                      FontWeight.w600,
                                      ""),
                                ),
                              )
                            : SingleChildScrollView(
                                child: Column(
                                  children: [
                                    for (int index in List.generate(
                                        categoryMilestones.length,
                                        (index) => index)) ...[
                                      Card(
                                        child: ListTile(
                                          title: GeneralTextDisplay(
                                              "Title: ${categoryMilestones[index].title}",
                                              black,
                                              1,
                                              16,
                                              FontWeight.w500,
                                              ""),
                                          subtitle: GeneralTextDisplay(
                                              'Description: ${categoryMilestones[index].description} \nMile Stone: ${categoryMilestones[index].typeOfMilestone} \nDate of creation: ${categoryMilestones[index].dateOfCreate}',
                                              black,
                                              6,
                                              12,
                                              FontWeight.w400,
                                              ""),
                                          trailing: GestureDetector(
                                            onTap: () {
                                              model.onDeleteMileStone(
                                                  context, index);
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          MileStoneDetailPage(
                                                              title: title,
                                                              milesOption:
                                                                  milesOption)));
                                            },
                                            child: const Icon(
                                                Icons.delete_forever_sharp),
                                          ),
                                        ),
                                      )
                                    ]
                                  ],
                                ),
                              )),
                  )
                ]));
  }
}
