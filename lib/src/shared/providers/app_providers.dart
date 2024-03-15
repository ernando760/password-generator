import 'package:password_generator/src/modules/services/local_storage.dart';
import 'package:password_generator/src/modules/services/shared_preferences_local_storage.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProvider {
  static final List<SingleChildWidget> providers = [
    Provider<LocalStorage>(
        create: (context) => SharedPreferencesLocalStorage()),
  ];
}
