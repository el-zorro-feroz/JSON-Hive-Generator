import 'package:flutter/widgets.dart';
import 'package:json_hive_generator/example/entities/event.dart';
import 'package:json_hive_generator/json_hive_generator.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive/hive.dart';

const String hiveDBPath = 'db';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Hive.init(hiveDBPath);
  Hive.registerAdapter(EventAdapter());

  final eventBox = await Hive.openBox<Event>('events');

  final String appDocDir =
      (await path_provider.getApplicationDocumentsDirectory()).path;
  final String exportFilePath = '$appDocDir/events.json';

  /// This is an example of how to export all [Event]`s in Hive to JSON file
  await HiveExporter<Event>(eventBox, exportFilePath).export();

  /// This is an example of how to import all [Event]`s from JSON file to Hive
  await HiveImporter<Event>(eventBox, exportFilePath).import();

  await eventBox.close();
  await Hive.close();
}
