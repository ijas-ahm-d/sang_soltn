import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sang/features/form/view_model/add_project_view_model.dart';
import 'package:sang/features/home/view_model/home_view_model.dart';

class ProvidersList {
  static List<SingleChildWidget> provider = [
    ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => AddProjectViewModel(),
    )
  ];
}
