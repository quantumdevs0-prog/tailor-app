import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

class Customers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get serialNumber => text().unique()();
  TextColumn get name => text()();
  TextColumn get phone => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

class Measurements extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get customerId => integer().references(Customers, #id)();
  DateTimeColumn get measuredAt => dateTime()();
  BoolColumn get isCurrent => boolean().withDefault(const Constant(true))();

  RealColumn get length => real().nullable()();
  RealColumn get shoulder => real().nullable()();
  RealColumn get chest => real().nullable()();
  RealColumn get waist => real().nullable()();
  RealColumn get sleeve => real().nullable()();
  RealColumn get neck => real().nullable()();
  RealColumn get daman => real().nullable()();

  RealColumn get shalwarLength => real().nullable()();
  RealColumn get shalwarWaist => real().nullable()();
  RealColumn get shalwarBottom => real().nullable()();

  TextColumn get collarStyle => text().nullable()();
  TextColumn get shape => text().nullable()();
  TextColumn get notes => text().nullable()();
}

@DriftDatabase(tables: [Customers, Measurements])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Customer>> getAllCustomers() =>
      (select(customers)..orderBy([(t) => OrderingTerm.desc(t.createdAt)])).get();

  Future<Customer?> getCustomerById(int id) =>
      (select(customers)..where((t) => t.id.equals(id))).getSingleOrNull();

  Stream<List<Customer>> watchAllCustomers() =>
      (select(customers)..orderBy([(t) => OrderingTerm.desc(t.createdAt)])).watch();

  Future<int> getCustomerCount() async {
    final count = countAll();
    final query = selectOnly(customers)..addColumns([count]);
    return await query.map((row) => row.read(count)!).getSingle();
  }

  Future<String> generateNextSerial() async {
    final result = await (select(customers)
      ..orderBy([(t) => OrderingTerm.desc(t.id)])
      ..limit(1))
        .get();
    int next = 1;
    if (result.isNotEmpty) {
      final parsed = int.tryParse(result.first.serialNumber);
      if (parsed != null) next = parsed + 1;
    }
    return next.toString().padLeft(6, '0');
  }

  Future<int> insertCustomer(CustomersCompanion entry) => into(customers).insert(entry);

  Future<bool> updateCustomer(Customer entry) => update(customers).replace(entry);

  Future<Measurement?> getCurrentMeasurement(int customerId) =>
      (select(measurements)
        ..where((t) => t.customerId.equals(customerId) & t.isCurrent.equals(true)))
          .getSingleOrNull();

  Future<List<Measurement>> getMeasurementHistory(int customerId) =>
      (select(measurements)
        ..where((t) => t.customerId.equals(customerId))
        ..orderBy([(t) => OrderingTerm.desc(t.measuredAt)]))
          .get();

  Stream<List<Measurement>> watchMeasurementHistory(int customerId) =>
      (select(measurements)
        ..where((t) => t.customerId.equals(customerId))
        ..orderBy([(t) => OrderingTerm.desc(t.measuredAt)]))
          .watch();

  Future<int> addMeasurement(MeasurementsCompanion entry) async {
    return transaction(() async {
      await (update(measurements)
        ..where((t) => t.customerId.equals(entry.customerId.value)))
          .write(const MeasurementsCompanion(isCurrent: Value(false)));
      return into(measurements).insert(entry);
    });
  }

  Future<List<Customer>> searchCustomers(String query) {
    final q = '%${query.trim()}%';
    return (select(customers)
      ..where((t) => t.serialNumber.like(q) | t.name.like(q) | t.phone.like(q))
      ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
        .get();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'tailor_app.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}