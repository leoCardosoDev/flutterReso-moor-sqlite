import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

class Tasks extends Table {
  IntColumn get id => integer().autoIncrement().call();
  TextColumn get name => text().withLength(min: 1, max: 50).call();
  DateTimeColumn get dueData => dateTime().nullable().call();
  BoolColumn get completed => boolean().withDefault(Constant(false)).call();
}

@UseMoor(tables: [Tasks])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));
  @override
  int get schemaVersion => 1;
}
