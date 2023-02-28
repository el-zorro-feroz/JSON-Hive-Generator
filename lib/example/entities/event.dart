import 'package:hive/hive.dart';

part 'event.g.dart';

@HiveType(typeId: 0)
class Event extends HiveObject {
  @HiveField(0)
  String name;

  Event(this.name);
}
