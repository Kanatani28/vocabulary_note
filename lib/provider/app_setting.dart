import 'package:hooks_riverpod/hooks_riverpod.dart';

final appSettingProvider =
    StateNotifierProvider<AppSettingNotifier, _AppSetting>((ref) {
  return AppSettingNotifier();
});

class _AppSetting {
  bool _english = true;
  bool _japanese = true;
}

class AppSettingNotifier extends StateNotifier<_AppSetting> {
  AppSettingNotifier() : super(_AppSetting());
  bool get english => state._english;
  set english(bool visible) {
    state._english = visible;
  }

  bool get japanese => state._japanese;
  set japanese(bool visible) {
    state._japanese = visible;
  }
}
