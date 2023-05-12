/// Title: JSON-Hive-Generator
/// Author: Savin, V
/// Date: 2023
/// Code version: 1.0.2
/// Type: source code
/// Web address: https://github.com/pocket-red-fox
/// License: MIT License
///
/// Copyright (c) 2023, Savin, V
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy of
/// this software and associated documentation files (the "Software"), to deal in
/// the Software without restriction, including without limitation the rights to
/// use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
/// of the Software, and to permit persons to whom the Software is furnished to do
/// so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:json_hive_generator/json_hive_generator.dart';
import 'package:example/entities/event.dart';

/// Path to store [Hive] database files
const String hiveDBPath = 'example_db_path';

void main() async {
  /// Init [Hive] Database
  Hive.init(hiveDBPath);
  Hive.registerAdapter(EventAdapter());

  /// Open [Box] for storing [Event]`s
  final eventBox = await Hive.openBox<Event>('events');

  final String appDocDir = (await path_provider.getApplicationDocumentsDirectory()).path;
  final String exportFilePath = '$appDocDir/events.json';

  /// This is an example of how to export all [Event]`s in Hive to JSON file
  await HiveExporter<Event>(eventBox, exportFilePath).export();

  /// This is an example of how to import all [Event]`s from JSON file to Hive
  await HiveImporter<Event>(eventBox, exportFilePath).import();
}