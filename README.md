Multi-platform library to add JSON import/export features for Hive

## Features

- Export Hive objects to JSON file
- Import JSON file as Hive objects

## Usage

```dart
  final eventBox = await Hive.openBox<Event>('events');

  /// Export all [Event]`s in Hive to JSON file
  await HiveExporter<Event>(eventBox, exportFilePath).export();

  /// Import all [Event]`s from JSON file to Hive
  await HiveImporter<Event>(eventBox, importFilePath).import();
```
## Learn more

- [API Documentation](https://pocket-red-fox.github.io/JSON-Hive-Generator/)
