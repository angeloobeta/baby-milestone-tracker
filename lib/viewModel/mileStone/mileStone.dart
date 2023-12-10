import 'package:baby_milestones_tracker/model/models/mileStone.dart';
import 'package:baby_milestones_tracker/viewModel/dashboard/dashboard.dart';
import 'package:hive/hive.dart';

class MileStoneViewModel extends DashBoardViewModel {
  onDeleteMileStone(context, index) {
    final milestonesBox = Hive.box<Milestone>('milestones');
    milestonesBox.delete(index);
    print("Successfully deleted");
  }
}
