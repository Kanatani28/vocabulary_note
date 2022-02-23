import 'package:flutter/material.dart';

class DataCard extends StatelessWidget {
  final Map<String, String> _data;

  const DataCard(this._data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: _data.entries
                .map((pair) => _CardRow(pair.key, pair.value))
                .toList()));
  }
}

class _CardRow extends StatelessWidget {
  final String _label;
  final String _value;

  const _CardRow(this._label, this._value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          Text(_label, style: const TextStyle(fontWeight: FontWeight.bold)),
          const Spacer(),
          Text(_value)
        ],
      ),
    );
  }
}
