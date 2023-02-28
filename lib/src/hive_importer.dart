part of json_hive_generator;

class HiveImporter<T> {
  final Box<T> _box;
  final String _filePath;

  HiveImporter(this._box, this._filePath);

  FutureOr<void> import() async {
    final file = File(_filePath);
    final jsonEvents = await file.readAsString();
    final events = json.decode(jsonEvents) as List<dynamic>;
    await _box.clear();
    await _box.addAll(events.cast<T>());
  }
}
