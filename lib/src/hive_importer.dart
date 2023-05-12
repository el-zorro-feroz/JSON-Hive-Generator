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

part of json_hive_generator;

/// Generic lass `HiveImporter<T>` that imports the contents to `Box<T> _box` from a JSON file on `String _filePath`.
class HiveImporter<T> {
  /// `_box` is of type `Box<T>` and holds the data that needs to be exported
  final Box<T> _box;

  /// `_filePath` is of type `String` and holds the path of the JSON file where the data needs to be exported.
  final String _filePath;

  /// Constructor that takes `_box` and `_filePath` as parameters.
  HiveImporter(this._box, this._filePath);

  /// `FutureOr<void> import()` method that imports the data from the JSON file.
  FutureOr<void> import() async {
    final file = File(_filePath);
    final jsonEvents = await file.readAsString();
    final events = json.decode(jsonEvents) as List<dynamic>;
    await _box.clear();
    await _box.addAll(events.cast<T>());
  }
}
