// GENERATED CODE - DO NOT MODIFY BY HAND
// This file was generated for the offline tailor app.
// Run `dart run build_runner build --delete-conflicting-outputs` if you change tables.

part of 'app_database.dart';

class $CustomersTable extends Customers
    with TableInfo<$CustomersTable, Customer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomersTable(this.attachedDatabase, [this._alias]);

  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));

  static const VerificationMeta _serialNumberMeta =
      const VerificationMeta('serialNumber');
  @override
  late final GeneratedColumn<String> serialNumber = GeneratedColumn<String>(
      'serial_number', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));

  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);

  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);

  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);

  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);

  @override
  List<GeneratedColumn> get $columns =>
      [id, serialNumber, name, phone, createdAt, updatedAt];

  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => 'customers';

  @override
  VerificationContext validateIntegrity(Insertable<Customer> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('serial_number')) {
      context.handle(_serialNumberMeta,
          serialNumber.isAcceptableOrUnknown(data['serial_number']!, _serialNumberMeta));
    } else if (isInserting) {
      context.missing(_serialNumberMeta);
    }
    if (data.containsKey('name')) {
      context.handle(_nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(_phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  Customer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Customer(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      serialNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}serial_number'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $CustomersTable createAlias(String alias) =>
      $CustomersTable(attachedDatabase, alias);
}

class Customer extends DataClass implements Insertable<Customer> {
  final int id;
  final String serialNumber;
  final String name;
  final String? phone;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Customer({
    required this.id,
    required this.serialNumber,
    required this.name,
    this.phone,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['serial_number'] = Variable<String>(serialNumber);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CustomersCompanion toCompanion(bool nullToAbsent) {
    return CustomersCompanion(
      id: Value(id),
      serialNumber: Value(serialNumber),
      name: Value(name),
      phone: phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Customer.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Customer(
      id: serializer.fromJson<int>(json['id']),
      serialNumber: serializer.fromJson<String>(json['serialNumber']),
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<String?>(json['phone']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return {
      'id': serializer.toJson<int>(id),
      'serialNumber': serializer.toJson<String>(serialNumber),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<String?>(phone),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Customer copyWith({
    int? id,
    String? serialNumber,
    String? name,
    Value<String?> phone = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Customer(
        id: id ?? this.id,
        serialNumber: serialNumber ?? this.serialNumber,
        name: name ?? this.name,
        phone: phone.present ? phone.value : this.phone,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  @override
  String toString() {
    return (StringBuffer('Customer(')
          ..write('id: $id, ')
          ..write('serialNumber: $serialNumber, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, serialNumber, name, phone, createdAt, updatedAt);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Customer &&
          other.id == this.id &&
          other.serialNumber == this.serialNumber &&
          other.name == this.name &&
          other.phone == this.phone &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CustomersCompanion extends UpdateCompanion<Customer> {
  final Value<int> id;
  final Value<String> serialNumber;
  final Value<String> name;
  final Value<String?> phone;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;

  const CustomersCompanion({
    this.id = const Value.absent(),
    this.serialNumber = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });

  CustomersCompanion.insert({
    this.id = const Value.absent(),
    required String serialNumber,
    required String name,
    this.phone = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
  })  : serialNumber = Value(serialNumber),
        name = Value(name),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);

  static Insertable<Customer> custom({
    Expression<int>? id,
    Expression<String>? serialNumber,
    Expression<String>? name,
    Expression<String>? phone,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (serialNumber != null) 'serial_number': serialNumber,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  CustomersCompanion copyWith({
    Value<int>? id,
    Value<String>? serialNumber,
    Value<String>? name,
    Value<String?>? phone,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return CustomersCompanion(
      id: id ?? this.id,
      serialNumber: serialNumber ?? this.serialNumber,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) map['id'] = Variable<int>(id.value);
    if (serialNumber.present) {
      map['serial_number'] = Variable<String>(serialNumber.value);
    }
    if (name.present) map['name'] = Variable<String>(name.value);
    if (phone.present) map['phone'] = Variable<String>(phone.value);
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomersCompanion(')
          ..write('id: $id, ')
          ..write('serialNumber: $serialNumber, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

// ==================== MEASUREMENTS ====================

class $MeasurementsTable extends Measurements
    with TableInfo<$MeasurementsTable, Measurement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MeasurementsTable(this.attachedDatabase, [this._alias]);

  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));

  static const VerificationMeta _customerIdMeta =
      const VerificationMeta('customerId');
  @override
  late final GeneratedColumn<int> customerId = GeneratedColumn<int>(
      'customer_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES customers (id)'));

  static const VerificationMeta _measuredAtMeta =
      const VerificationMeta('measuredAt');
  @override
  late final GeneratedColumn<DateTime> measuredAt = GeneratedColumn<DateTime>(
      'measured_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);

  static const VerificationMeta _isCurrentMeta =
      const VerificationMeta('isCurrent');
  @override
  late final GeneratedColumn<bool> isCurrent = GeneratedColumn<bool>(
      'is_current', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_current" IN (0, 1))'),
      defaultValue: const Constant(true));

  static const VerificationMeta _lengthMeta = const VerificationMeta('length');
  @override
  late final GeneratedColumn<double> length = GeneratedColumn<double>(
      'length', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);

  static const VerificationMeta _shoulderMeta =
      const VerificationMeta('shoulder');
  @override
  late final GeneratedColumn<double> shoulder = GeneratedColumn<double>(
      'shoulder', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);

  static const VerificationMeta _chestMeta = const VerificationMeta('chest');
  @override
  late final GeneratedColumn<double> chest = GeneratedColumn<double>(
      'chest', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);

  static const VerificationMeta _waistMeta = const VerificationMeta('waist');
  @override
  late final GeneratedColumn<double> waist = GeneratedColumn<double>(
      'waist', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);

  static const VerificationMeta _sleeveMeta = const VerificationMeta('sleeve');
  @override
  late final GeneratedColumn<double> sleeve = GeneratedColumn<double>(
      'sleeve', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);

  static const VerificationMeta _neckMeta = const VerificationMeta('neck');
  @override
  late final GeneratedColumn<double> neck = GeneratedColumn<double>(
      'neck', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);

  static const VerificationMeta _damanMeta = const VerificationMeta('daman');
  @override
  late final GeneratedColumn<double> daman = GeneratedColumn<double>(
      'daman', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);

  static const VerificationMeta _shalwarLengthMeta =
      const VerificationMeta('shalwarLength');
  @override
  late final GeneratedColumn<double> shalwarLength = GeneratedColumn<double>(
      'shalwar_length', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);

  static const VerificationMeta _shalwarWaistMeta =
      const VerificationMeta('shalwarWaist');
  @override
  late final GeneratedColumn<double> shalwarWaist = GeneratedColumn<double>(
      'shalwar_waist', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);

  static const VerificationMeta _shalwarBottomMeta =
      const VerificationMeta('shalwarBottom');
  @override
  late final GeneratedColumn<double> shalwarBottom = GeneratedColumn<double>(
      'shalwar_bottom', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);

  static const VerificationMeta _collarStyleMeta =
      const VerificationMeta('collarStyle');
  @override
  late final GeneratedColumn<String> collarStyle = GeneratedColumn<String>(
      'collar_style', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);

  static const VerificationMeta _shapeMeta = const VerificationMeta('shape');
  @override
  late final GeneratedColumn<String> shape = GeneratedColumn<String>(
      'shape', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);

  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);

  @override
  List<GeneratedColumn> get $columns => [
        id, customerId, measuredAt, isCurrent,
        length, shoulder, chest, waist, sleeve, neck, daman,
        shalwarLength, shalwarWaist, shalwarBottom,
        collarStyle, shape, notes
      ];

  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => 'measurements';

  @override
  VerificationContext validateIntegrity(Insertable<Measurement> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('customer_id')) {
      context.handle(_customerIdMeta,
          customerId.isAcceptableOrUnknown(data['customer_id']!, _customerIdMeta));
    } else if (isInserting) {
      context.missing(_customerIdMeta);
    }
    if (data.containsKey('measured_at')) {
      context.handle(_measuredAtMeta,
          measuredAt.isAcceptableOrUnknown(data['measured_at']!, _measuredAtMeta));
    } else if (isInserting) {
      context.missing(_measuredAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  Measurement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Measurement(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      customerId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}customer_id'])!,
      measuredAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}measured_at'])!,
      isCurrent: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_current'])!,
      length: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}length']),
      shoulder: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}shoulder']),
      chest: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}chest']),
      waist: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}waist']),
      sleeve: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}sleeve']),
      neck: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}neck']),
      daman: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}daman']),
      shalwarLength: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}shalwar_length']),
      shalwarWaist: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}shalwar_waist']),
      shalwarBottom: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}shalwar_bottom']),
      collarStyle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}collar_style']),
      shape: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}shape']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
    );
  }

  @override
  $MeasurementsTable createAlias(String alias) =>
      $MeasurementsTable(attachedDatabase, alias);
}

class Measurement extends DataClass implements Insertable<Measurement> {
  final int id;
  final int customerId;
  final DateTime measuredAt;
  final bool isCurrent;
  final double? length;
  final double? shoulder;
  final double? chest;
  final double? waist;
  final double? sleeve;
  final double? neck;
  final double? daman;
  final double? shalwarLength;
  final double? shalwarWaist;
  final double? shalwarBottom;
  final String? collarStyle;
  final String? shape;
  final String? notes;

  const Measurement({
    required this.id,
    required this.customerId,
    required this.measuredAt,
    required this.isCurrent,
    this.length,
    this.shoulder,
    this.chest,
    this.waist,
    this.sleeve,
    this.neck,
    this.daman,
    this.shalwarLength,
    this.shalwarWaist,
    this.shalwarBottom,
    this.collarStyle,
    this.shape,
    this.notes,
  });

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['customer_id'] = Variable<int>(customerId);
    map['measured_at'] = Variable<DateTime>(measuredAt);
    map['is_current'] = Variable<bool>(isCurrent);
    if (!nullToAbsent || length != null) map['length'] = Variable<double>(length);
    if (!nullToAbsent || shoulder != null) map['shoulder'] = Variable<double>(shoulder);
    if (!nullToAbsent || chest != null) map['chest'] = Variable<double>(chest);
    if (!nullToAbsent || waist != null) map['waist'] = Variable<double>(waist);
    if (!nullToAbsent || sleeve != null) map['sleeve'] = Variable<double>(sleeve);
    if (!nullToAbsent || neck != null) map['neck'] = Variable<double>(neck);
    if (!nullToAbsent || daman != null) map['daman'] = Variable<double>(daman);
    if (!nullToAbsent || shalwarLength != null) map['shalwar_length'] = Variable<double>(shalwarLength);
    if (!nullToAbsent || shalwarWaist != null) map['shalwar_waist'] = Variable<double>(shalwarWaist);
    if (!nullToAbsent || shalwarBottom != null) map['shalwar_bottom'] = Variable<double>(shalwarBottom);
    if (!nullToAbsent || collarStyle != null) map['collar_style'] = Variable<String>(collarStyle);
    if (!nullToAbsent || shape != null) map['shape'] = Variable<String>(shape);
    if (!nullToAbsent || notes != null) map['notes'] = Variable<String>(notes);
    return map;
  }

  MeasurementsCompanion toCompanion(bool nullToAbsent) {
    return MeasurementsCompanion(
      id: Value(id),
      customerId: Value(customerId),
      measuredAt: Value(measuredAt),
      isCurrent: Value(isCurrent),
      length: length == null && nullToAbsent ? const Value.absent() : Value(length),
      shoulder: shoulder == null && nullToAbsent ? const Value.absent() : Value(shoulder),
      chest: chest == null && nullToAbsent ? const Value.absent() : Value(chest),
      waist: waist == null && nullToAbsent ? const Value.absent() : Value(waist),
      sleeve: sleeve == null && nullToAbsent ? const Value.absent() : Value(sleeve),
      neck: neck == null && nullToAbsent ? const Value.absent() : Value(neck),
      daman: daman == null && nullToAbsent ? const Value.absent() : Value(daman),
      shalwarLength: shalwarLength == null && nullToAbsent ? const Value.absent() : Value(shalwarLength),
      shalwarWaist: shalwarWaist == null && nullToAbsent ? const Value.absent() : Value(shalwarWaist),
      shalwarBottom: shalwarBottom == null && nullToAbsent ? const Value.absent() : Value(shalwarBottom),
      collarStyle: collarStyle == null && nullToAbsent ? const Value.absent() : Value(collarStyle),
      shape: shape == null && nullToAbsent ? const Value.absent() : Value(shape),
      notes: notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  @override
  String toString() {
    return (StringBuffer('Measurement(')
          ..write('id: $id, ')
          ..write('customerId: $customerId, ')
          ..write('measuredAt: $measuredAt, ')
          ..write('isCurrent: $isCurrent')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, customerId, measuredAt, isCurrent, length,
      shoulder, chest, waist, sleeve, neck, daman, shalwarLength, shalwarWaist,
      shalwarBottom, collarStyle, shape, notes);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Measurement &&
          other.id == this.id &&
          other.customerId == this.customerId &&
          other.measuredAt == this.measuredAt &&
          other.isCurrent == this.isCurrent);
}

class MeasurementsCompanion extends UpdateCompanion<Measurement> {
  final Value<int> id;
  final Value<int> customerId;
  final Value<DateTime> measuredAt;
  final Value<bool> isCurrent;
  final Value<double?> length;
  final Value<double?> shoulder;
  final Value<double?> chest;
  final Value<double?> waist;
  final Value<double?> sleeve;
  final Value<double?> neck;
  final Value<double?> daman;
  final Value<double?> shalwarLength;
  final Value<double?> shalwarWaist;
  final Value<double?> shalwarBottom;
  final Value<String?> collarStyle;
  final Value<String?> shape;
  final Value<String?> notes;

  const MeasurementsCompanion({
    this.id = const Value.absent(),
    this.customerId = const Value.absent(),
    this.measuredAt = const Value.absent(),
    this.isCurrent = const Value.absent(),
    this.length = const Value.absent(),
    this.shoulder = const Value.absent(),
    this.chest = const Value.absent(),
    this.waist = const Value.absent(),
    this.sleeve = const Value.absent(),
    this.neck = const Value.absent(),
    this.daman = const Value.absent(),
    this.shalwarLength = const Value.absent(),
    this.shalwarWaist = const Value.absent(),
    this.shalwarBottom = const Value.absent(),
    this.collarStyle = const Value.absent(),
    this.shape = const Value.absent(),
    this.notes = const Value.absent(),
  });

  MeasurementsCompanion.insert({
    this.id = const Value.absent(),
    required int customerId,
    required DateTime measuredAt,
    this.isCurrent = const Value.absent(),
    this.length = const Value.absent(),
    this.shoulder = const Value.absent(),
    this.chest = const Value.absent(),
    this.waist = const Value.absent(),
    this.sleeve = const Value.absent(),
    this.neck = const Value.absent(),
    this.daman = const Value.absent(),
    this.shalwarLength = const Value.absent(),
    this.shalwarWaist = const Value.absent(),
    this.shalwarBottom = const Value.absent(),
    this.collarStyle = const Value.absent(),
    this.shape = const Value.absent(),
    this.notes = const Value.absent(),
  })  : customerId = Value(customerId),
        measuredAt = Value(measuredAt);

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) map['id'] = Variable<int>(id.value);
    if (customerId.present) map['customer_id'] = Variable<int>(customerId.value);
    if (measuredAt.present) map['measured_at'] = Variable<DateTime>(measuredAt.value);
    if (isCurrent.present) map['is_current'] = Variable<bool>(isCurrent.value);
    if (length.present) map['length'] = Variable<double>(length.value);
    if (shoulder.present) map['shoulder'] = Variable<double>(shoulder.value);
    if (chest.present) map['chest'] = Variable<double>(chest.value);
    if (waist.present) map['waist'] = Variable<double>(waist.value);
    if (sleeve.present) map['sleeve'] = Variable<double>(sleeve.value);
    if (neck.present) map['neck'] = Variable<double>(neck.value);
    if (daman.present) map['daman'] = Variable<double>(daman.value);
    if (shalwarLength.present) map['shalwar_length'] = Variable<double>(shalwarLength.value);
    if (shalwarWaist.present) map['shalwar_waist'] = Variable<double>(shalwarWaist.value);
    if (shalwarBottom.present) map['shalwar_bottom'] = Variable<double>(shalwarBottom.value);
    if (collarStyle.present) map['collar_style'] = Variable<String>(collarStyle.value);
    if (shape.present) map['shape'] = Variable<String>(shape.value);
    if (notes.present) map['notes'] = Variable<String>(notes.value);
    return map;
  }
}

// ==================== DATABASE IMPLEMENTATION ====================

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $CustomersTable customers = $CustomersTable(this);
  late final $MeasurementsTable measurements = $MeasurementsTable(this);

  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();

  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [customers, measurements];
}
