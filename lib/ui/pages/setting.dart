import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:vocabulary_note/provider/app_setting.dart';

class Setting extends HookConsumerWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingNotifier = ref.read(appSettingProvider.notifier);
    final _english = useState(settingNotifier.english);
    final _japanese = useState(settingNotifier.japanese);

    return Scaffold(
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('表示設定'),
            tiles: <SettingsTile>[
              SettingsTile.switchTile(
                initialValue: _english.value,
                leading: const Icon(Icons.language),
                title: const Text('English'),
                onToggle: (value) {
                  settingNotifier.english = value;
                  _english.value = value;
                },
              ),
              SettingsTile.switchTile(
                initialValue: _japanese.value,
                leading: const Icon(Icons.language),
                title: const Text('日本語'),
                onToggle: (value) {
                  settingNotifier.japanese = value;
                  _japanese.value = value;
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
