Multi-platform library to add JSON import/export features for Hive

## Features

Use this plugin in your Flutter app to:

- Export Hive objects to JSON file
- Import JSON file as Hive objects

## Usage

```dart
  final eventBox = await Hive.openBox<Event>('events');

  /// This is an example of how to export all [Event]`s in Hive to JSON file
  await HiveExporter<Event>(eventBox, exportFilePath).export();

  /// This is an example of how to import all [Event]`s from JSON file to Hive
  await HiveImporter<Event>(eventBox, importFilePath).import();
```
