import 'package:flutterapitest/arch/view_model.dart';
import 'factory.dart';

class ViewModelProviders {
  static T of<T extends ViewModel>(Factory factory) {
    return factory.create() as T;
  }
}