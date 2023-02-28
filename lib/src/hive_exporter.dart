part of json_hive_generator;

class HiveExporter<T> {
  final Box<T> _box;
  final String _filePath;

  HiveExporter(this._box, this._filePath);

  FutureOr<void> export() async {
    final file = File(_filePath);
    final events = _box.values.toList();
    final jsonEvents = json.encode(events);
    await file.writeAsString(jsonEvents);
  }
}
