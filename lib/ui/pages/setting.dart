import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:settings_ui/settings_ui.dart';

class Setting extends HookWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> english = useState(true);
    ValueNotifier<bool> japanese = useState(true);
    return Scaffold(
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('表示設定'),
            tiles: <SettingsTile>[
              SettingsTile.switchTile(
                initialValue: english.value,
                leading: const Icon(Icons.language),
                title: const Text('English'),
                onToggle: (value) {
                  english.value = value;
                },
              ),
              SettingsTile.switchTile(
                initialValue: japanese.value,
                leading: const Icon(Icons.language),
                title: const Text('日本語'),
                onToggle: (value) {
                  japanese.value = value;
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
