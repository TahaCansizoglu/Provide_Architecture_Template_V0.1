import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../ui/addbill/viewmodel/add_bill_viewmodel.dart';
import '../../ui/home/viewmodel/home_viewmodel.dart';

class ProviderManager {
  static ProviderManager? _instance;
  static ProviderManager get instance {
    _instance ??= ProviderManager._init();
    return _instance!;
  }

  ProviderManager._init();

  List<SingleChildWidget> singleProvider = [
    ChangeNotifierProvider<HomeViewModel>(
      create: (_) => HomeViewModel(),
    ),
    ChangeNotifierProvider<AddBillViewModel>(
      create: (_) => AddBillViewModel(),
    ),
  ];
}
