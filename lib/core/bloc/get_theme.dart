import 'package:moviehub/extentions/theme.dart';
import 'package:rxdart/subjects.dart';

class ThemeBloc {
  final _theme = BehaviorSubject<AppTheme>();


  getThemeBloc() {  
    inTheme(myTheme[0]);
  }
  dispose() {
    _theme.close();
  }

  Function(AppTheme) get inTheme => _theme.sink.add;
  Stream<AppTheme> get outTheme => _theme.stream;
}