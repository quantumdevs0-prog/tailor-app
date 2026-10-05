// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
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
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
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
  String get actualTableName => $name;
  static const String $name = 'customers';
  @override
  VerificationContext validateIntegrity(Insertable<Customer> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('serial_number')) {
      context.handle(
          _serialNumberMeta,
          serialNumber.isAcceptableOrUnknown(
              data['serial_number']!, _serialNumberMeta));
    } else if (isInserting) {
      context.missing(_serialNumberMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
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
  $CustomersTable createAlias(String alias) {
    return $CustomersTable(attachedDatabase, alias);
  }
}

class Customer extends DataClass implements Insertable<Customer> {
  final int id;
  final String serialNumber;
  final String name;
  final String? phone;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Customer(
      {required this.id,
      required this.serialNumber,
      required this.name,
      this.phone,
      required this.createdAt,
      required this.updatedAt});
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
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
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
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'serialNumber': serializer.toJson<String>(serialNumber),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<String?>(phone),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Customer copyWith(
          {int? id,
          String? serialNumber,
          String? name,
          Value<String?> phone = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Customer(
        id: id ?? this.id,
        serialNumber: serialNumber ?? this.serialNumber,
        name: name ?? this.name,
        phone: phone.present ? phone.value : this.phone,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Customer copyWithCompanion(CustomersCompanion data) {
    return Customer(
      id: data.id.present ? data.id.value : this.id,
      serialNumber: data.serialNumber.present
          ? data.serialNumber.value
          : this.serialNumber,
      name: data.name.present ? data.name.value : this.name,
      phone: data.phone.present ? data.phone.value : this.phone,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

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

  CustomersCompanion copyWith(
      {Value<int>? id,
      Value<String>? serialNumber,
      Value<String>? name,
      Value<String?>? phone,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
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
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (serialNumber.present) {
      map['serial_number'] = Variable<String>(serialNumber.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
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
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
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
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_current" IN (0, 1))'),
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
        id,
        customerId,
        measuredAt,
        isCurrent,
        length,
        shoulder,
        chest,
        waist,
        sleeve,
        neck,
        daman,
        shalwarLength,
        shalwarWaist,
        shalwarBottom,
        collarStyle,
        shape,
        notes
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'measurements';
  @override
  VerificationContext validateIntegrity(Insertable<Measurement> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('customer_id')) {
      context.handle(
          _customerIdMeta,
          customerId.isAcceptableOrUnknown(
              data['customer_id']!, _customerIdMeta));
    } else if (isInserting) {
      context.missing(_customerIdMeta);
    }
    if (data.containsKey('measured_at')) {
      context.handle(
          _measuredAtMeta,
          measuredAt.isAcceptableOrUnknown(
              data['measured_at']!, _measuredAtMeta));
    } else if (isInserting) {
      context.missing(_measuredAtMeta);
    }
    if (data.containsKey('is_current')) {
      context.handle(_isCurrentMeta,
          isCurrent.isAcceptableOrUnknown(data['is_current']!, _isCurrentMeta));
    }
    if (data.containsKey('length')) {
      context.handle(_lengthMeta,
          length.isAcceptableOrUnknown(data['length']!, _lengthMeta));
    }
    if (data.containsKey('shoulder')) {
      context.handle(_shoulderMeta,
          shoulder.isAcceptableOrUnknown(data['shoulder']!, _shoulderMeta));
    }
    if (data.containsKey('chest')) {
      context.handle(
          _chestMeta, chest.isAcceptableOrUnknown(data['chest']!, _chestMeta));
    }
    if (data.containsKey('waist')) {
      context.handle(
          _waistMeta, waist.isAcceptableOrUnknown(data['waist']!, _waistMeta));
    }
    if (data.containsKey('sleeve')) {
      context.handle(_sleeveMeta,
          sleeve.isAcceptableOrUnknown(data['sleeve']!, _sleeveMeta));
    }
    if (data.containsKey('neck')) {
      context.handle(
          _neckMeta, neck.isAcceptableOrUnknown(data['neck']!, _neckMeta));
    }
    if (data.containsKey('daman')) {
      context.handle(
          _damanMeta, daman.isAcceptableOrUnknown(data['daman']!, _damanMeta));
    }
    if (data.containsKey('shalwar_length')) {
      context.handle(
          _shalwarLengthMeta,
          shalwarLength.isAcceptableOrUnknown(
              data['shalwar_length']!, _shalwarLengthMeta));
    }
    if (data.containsKey('shalwar_waist')) {
      context.handle(
          _shalwarWaistMeta,
          shalwarWaist.isAcceptableOrUnknown(
              data['shalwar_waist']!, _shalwarWaistMeta));
    }
    if (data.containsKey('shalwar_bottom')) {
      context.handle(
          _shalwarBottomMeta,
          shalwarBottom.isAcceptableOrUnknown(
              data['shalwar_bottom']!, _shalwarBottomMeta));
    }
    if (data.containsKey('collar_style')) {
      context.handle(
          _collarStyleMeta,
          collarStyle.isAcceptableOrUnknown(
              data['collar_style']!, _collarStyleMeta));
    }
    if (data.containsKey('shape')) {
      context.handle(
          _shapeMeta, shape.isAcceptableOrUnknown(data['shape']!, _shapeMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
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
  $MeasurementsTable createAlias(String alias) {
    return $MeasurementsTable(attachedDatabase, alias);
  }
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
  const Measurement(
      {required this.id,
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
      this.notes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['customer_id'] = Variable<int>(customerId);
    map['measured_at'] = Variable<DateTime>(measuredAt);
    map['is_current'] = Variable<bool>(isCurrent);
    if (!nullToAbsent || length != null) {
      map['length'] = Variable<double>(length);
    }
    if (!nullToAbsent || shoulder != null) {
      map['shoulder'] = Variable<double>(shoulder);
    }
    if (!nullToAbsent || chest != null) {
      map['chest'] = Variable<double>(chest);
    }
    if (!nullToAbsent || waist != null) {
      map['waist'] = Variable<double>(waist);
    }
    if (!nullToAbsent || sleeve != null) {
      map['sleeve'] = Variable<double>(sleeve);
    }
    if (!nullToAbsent || neck != null) {
      map['neck'] = Variable<double>(neck);
    }
    if (!nullToAbsent || daman != null) {
      map['daman'] = Variable<double>(daman);
    }
    if (!nullToAbsent || shalwarLength != null) {
      map['shalwar_length'] = Variable<double>(shalwarLength);
    }
    if (!nullToAbsent || shalwarWaist != null) {
      map['shalwar_waist'] = Variable<double>(shalwarWaist);
    }
    if (!nullToAbsent || shalwarBottom != null) {
      map['shalwar_bottom'] = Variable<double>(shalwarBottom);
    }
    if (!nullToAbsent || collarStyle != null) {
      map['collar_style'] = Variable<String>(collarStyle);
    }
    if (!nullToAbsent || shape != null) {
      map['shape'] = Variable<String>(shape);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  MeasurementsCompanion toCompanion(bool nullToAbsent) {
    return MeasurementsCompanion(
      id: Value(id),
      customerId: Value(customerId),
      measuredAt: Value(measuredAt),
      isCurrent: Value(isCurrent),
      length:
          length == null && nullToAbsent ? const Value.absent() : Value(length),
      shoulder: shoulder == null && nullToAbsent
          ? const Value.absent()
          : Value(shoulder),
      chest:
          chest == null && nullToAbsent ? const Value.absent() : Value(chest),
      waist:
          waist == null && nullToAbsent ? const Value.absent() : Value(waist),
      sleeve:
          sleeve == null && nullToAbsent ? const Value.absent() : Value(sleeve),
      neck: neck == null && nullToAbsent ? const Value.absent() : Value(neck),
      daman:
          daman == null && nullToAbsent ? const Value.absent() : Value(daman),
      shalwarLength: shalwarLength == null && nullToAbsent
          ? const Value.absent()
          : Value(shalwarLength),
      shalwarWaist: shalwarWaist == null && nullToAbsent
          ? const Value.absent()
          : Value(shalwarWaist),
      shalwarBottom: shalwarBottom == null && nullToAbsent
          ? const Value.absent()
          : Value(shalwarBottom),
      collarStyle: collarStyle == null && nullToAbsent
          ? const Value.absent()
          : Value(collarStyle),
      shape:
          shape == null && nullToAbsent ? const Value.absent() : Value(shape),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory Measurement.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Measurement(
      id: serializer.fromJson<int>(json['id']),
      customerId: serializer.fromJson<int>(json['customerId']),
      measuredAt: serializer.fromJson<DateTime>(json['measuredAt']),
      isCurrent: serializer.fromJson<bool>(json['isCurrent']),
      length: serializer.fromJson<double?>(json['length']),
      shoulder: serializer.fromJson<double?>(json['shoulder']),
      chest: serializer.fromJson<double?>(json['chest']),
      waist: serializer.fromJson<double?>(json['waist']),
      sleeve: serializer.fromJson<double?>(json['sleeve']),
      neck: serializer.fromJson<double?>(json['neck']),
      daman: serializer.fromJson<double?>(json['daman']),
      shalwarLength: serializer.fromJson<double?>(json['shalwarLength']),
      shalwarWaist: serializer.fromJson<double?>(json['shalwarWaist']),
      shalwarBottom: serializer.fromJson<double?>(json['shalwarBottom']),
      collarStyle: serializer.fromJson<String?>(json['collarStyle']),
      shape: serializer.fromJson<String?>(json['shape']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'customerId': serializer.toJson<int>(customerId),
      'measuredAt': serializer.toJson<DateTime>(measuredAt),
      'isCurrent': serializer.toJson<bool>(isCurrent),
      'length': serializer.toJson<double?>(length),
      'shoulder': serializer.toJson<double?>(shoulder),
      'chest': serializer.toJson<double?>(chest),
      'waist': serializer.toJson<double?>(waist),
      'sleeve': serializer.toJson<double?>(sleeve),
      'neck': serializer.toJson<double?>(neck),
      'daman': serializer.toJson<double?>(daman),
      'shalwarLength': serializer.toJson<double?>(shalwarLength),
      'shalwarWaist': serializer.toJson<double?>(shalwarWaist),
      'shalwarBottom': serializer.toJson<double?>(shalwarBottom),
      'collarStyle': serializer.toJson<String?>(collarStyle),
      'shape': serializer.toJson<String?>(shape),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  Measurement copyWith(
          {int? id,
          int? customerId,
          DateTime? measuredAt,
          bool? isCurrent,
          Value<double?> length = const Value.absent(),
          Value<double?> shoulder = const Value.absent(),
          Value<double?> chest = const Value.absent(),
          Value<double?> waist = const Value.absent(),
          Value<double?> sleeve = const Value.absent(),
          Value<double?> neck = const Value.absent(),
          Value<double?> daman = const Value.absent(),
          Value<double?> shalwarLength = const Value.absent(),
          Value<double?> shalwarWaist = const Value.absent(),
          Value<double?> shalwarBottom = const Value.absent(),
          Value<String?> collarStyle = const Value.absent(),
          Value<String?> shape = const Value.absent(),
          Value<String?> notes = const Value.absent()}) =>
      Measurement(
        id: id ?? this.id,
        customerId: customerId ?? this.customerId,
        measuredAt: measuredAt ?? this.measuredAt,
        isCurrent: isCurrent ?? this.isCurrent,
        length: length.present ? length.value : this.length,
        shoulder: shoulder.present ? shoulder.value : this.shoulder,
        chest: chest.present ? chest.value : this.chest,
        waist: waist.present ? waist.value : this.waist,
        sleeve: sleeve.present ? sleeve.value : this.sleeve,
        neck: neck.present ? neck.value : this.neck,
        daman: daman.present ? daman.value : this.daman,
        shalwarLength:
            shalwarLength.present ? shalwarLength.value : this.shalwarLength,
        shalwarWaist:
            shalwarWaist.present ? shalwarWaist.value : this.shalwarWaist,
        shalwarBottom:
            shalwarBottom.present ? shalwarBottom.value : this.shalwarBottom,
        collarStyle: collarStyle.present ? collarStyle.value : this.collarStyle,
        shape: shape.present ? shape.value : this.shape,
        notes: notes.present ? notes.value : this.notes,
      );
  Measurement copyWithCompanion(MeasurementsCompanion data) {
    return Measurement(
      id: data.id.present ? data.id.value : this.id,
      customerId:
          data.customerId.present ? data.customerId.value : this.customerId,
      measuredAt:
          data.measuredAt.present ? data.measuredAt.value : this.measuredAt,
      isCurrent: data.isCurrent.present ? data.isCurrent.value : this.isCurrent,
      length: data.length.present ? data.length.value : this.length,
      shoulder: data.shoulder.present ? data.shoulder.value : this.shoulder,
      chest: data.chest.present ? data.chest.value : this.chest,
      waist: data.waist.present ? data.waist.value : this.waist,
      sleeve: data.sleeve.present ? data.sleeve.value : this.sleeve,
      neck: data.neck.present ? data.neck.value : this.neck,
      daman: data.daman.present ? data.daman.value : this.daman,
      shalwarLength: data.shalwarLength.present
          ? data.shalwarLength.value
          : this.shalwarLength,
      shalwarWaist: data.shalwarWaist.present
          ? data.shalwarWaist.value
          : this.shalwarWaist,
      shalwarBottom: data.shalwarBottom.present
          ? data.shalwarBottom.value
          : this.shalwarBottom,
      collarStyle:
          data.collarStyle.present ? data.collarStyle.value : this.collarStyle,
      shape: data.shape.present ? data.shape.value : this.shape,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Measurement(')
          ..write('id: $id, ')
          ..write('customerId: $customerId, ')
          ..write('measuredAt: $measuredAt, ')
          ..write('isCurrent: $isCurrent, ')
          ..write('length: $length, ')
          ..write('shoulder: $shoulder, ')
          ..write('chest: $chest, ')
          ..write('waist: $waist, ')
          ..write('sleeve: $sleeve, ')
          ..write('neck: $neck, ')
          ..write('daman: $daman, ')
          ..write('shalwarLength: $shalwarLength, ')
          ..write('shalwarWaist: $shalwarWaist, ')
          ..write('shalwarBottom: $shalwarBottom, ')
          ..write('collarStyle: $collarStyle, ')
          ..write('shape: $shape, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      customerId,
      measuredAt,
      isCurrent,
      length,
      shoulder,
      chest,
      waist,
      sleeve,
      neck,
      daman,
      shalwarLength,
      shalwarWaist,
      shalwarBottom,
      collarStyle,
      shape,
      notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Measurement &&
          other.id == this.id &&
          other.customerId == this.customerId &&
          other.measuredAt == this.measuredAt &&
          other.isCurrent == this.isCurrent &&
          other.length == this.length &&
          other.shoulder == this.shoulder &&
          other.chest == this.chest &&
          other.waist == this.waist &&
          other.sleeve == this.sleeve &&
          other.neck == this.neck &&
          other.daman == this.daman &&
          other.shalwarLength == this.shalwarLength &&
          other.shalwarWaist == this.shalwarWaist &&
          other.shalwarBottom == this.shalwarBottom &&
          other.collarStyle == this.collarStyle &&
          other.shape == this.shape &&
          other.notes == this.notes);
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
  static Insertable<Measurement> custom({
    Expression<int>? id,
    Expression<int>? customerId,
    Expression<DateTime>? measuredAt,
    Expression<bool>? isCurrent,
    Expression<double>? length,
    Expression<double>? shoulder,
    Expression<double>? chest,
    Expression<double>? waist,
    Expression<double>? sleeve,
    Expression<double>? neck,
    Expression<double>? daman,
    Expression<double>? shalwarLength,
    Expression<double>? shalwarWaist,
    Expression<double>? shalwarBottom,
    Expression<String>? collarStyle,
    Expression<String>? shape,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (customerId != null) 'customer_id': customerId,
      if (measuredAt != null) 'measured_at': measuredAt,
      if (isCurrent != null) 'is_current': isCurrent,
      if (length != null) 'length': length,
      if (shoulder != null) 'shoulder': shoulder,
      if (chest != null) 'chest': chest,
      if (waist != null) 'waist': waist,
      if (sleeve != null) 'sleeve': sleeve,
      if (neck != null) 'neck': neck,
      if (daman != null) 'daman': daman,
      if (shalwarLength != null) 'shalwar_length': shalwarLength,
      if (shalwarWaist != null) 'shalwar_waist': shalwarWaist,
      if (shalwarBottom != null) 'shalwar_bottom': shalwarBottom,
      if (collarStyle != null) 'collar_style': collarStyle,
      if (shape != null) 'shape': shape,
      if (notes != null) 'notes': notes,
    });
  }

  MeasurementsCompanion copyWith(
      {Value<int>? id,
      Value<int>? customerId,
      Value<DateTime>? measuredAt,
      Value<bool>? isCurrent,
      Value<double?>? length,
      Value<double?>? shoulder,
      Value<double?>? chest,
      Value<double?>? waist,
      Value<double?>? sleeve,
      Value<double?>? neck,
      Value<double?>? daman,
      Value<double?>? shalwarLength,
      Value<double?>? shalwarWaist,
      Value<double?>? shalwarBottom,
      Value<String?>? collarStyle,
      Value<String?>? shape,
      Value<String?>? notes}) {
    return MeasurementsCompanion(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      measuredAt: measuredAt ?? this.measuredAt,
      isCurrent: isCurrent ?? this.isCurrent,
      length: length ?? this.length,
      shoulder: shoulder ?? this.shoulder,
      chest: chest ?? this.chest,
      waist: waist ?? this.waist,
      sleeve: sleeve ?? this.sleeve,
      neck: neck ?? this.neck,
      daman: daman ?? this.daman,
      shalwarLength: shalwarLength ?? this.shalwarLength,
      shalwarWaist: shalwarWaist ?? this.shalwarWaist,
      shalwarBottom: shalwarBottom ?? this.shalwarBottom,
      collarStyle: collarStyle ?? this.collarStyle,
      shape: shape ?? this.shape,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (customerId.present) {
      map['customer_id'] = Variable<int>(customerId.value);
    }
    if (measuredAt.present) {
      map['measured_at'] = Variable<DateTime>(measuredAt.value);
    }
    if (isCurrent.present) {
      map['is_current'] = Variable<bool>(isCurrent.value);
    }
    if (length.present) {
      map['length'] = Variable<double>(length.value);
    }
    if (shoulder.present) {
      map['shoulder'] = Variable<double>(shoulder.value);
    }
    if (chest.present) {
      map['chest'] = Variable<double>(chest.value);
    }
    if (waist.present) {
      map['waist'] = Variable<double>(waist.value);
    }
    if (sleeve.present) {
      map['sleeve'] = Variable<double>(sleeve.value);
    }
    if (neck.present) {
      map['neck'] = Variable<double>(neck.value);
    }
    if (daman.present) {
      map['daman'] = Variable<double>(daman.value);
    }
    if (shalwarLength.present) {
      map['shalwar_length'] = Variable<double>(shalwarLength.value);
    }
    if (shalwarWaist.present) {
      map['shalwar_waist'] = Variable<double>(shalwarWaist.value);
    }
    if (shalwarBottom.present) {
      map['shalwar_bottom'] = Variable<double>(shalwarBottom.value);
    }
    if (collarStyle.present) {
      map['collar_style'] = Variable<String>(collarStyle.value);
    }
    if (shape.present) {
      map['shape'] = Variable<String>(shape.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MeasurementsCompanion(')
          ..write('id: $id, ')
          ..write('customerId: $customerId, ')
          ..write('measuredAt: $measuredAt, ')
          ..write('isCurrent: $isCurrent, ')
          ..write('length: $length, ')
          ..write('shoulder: $shoulder, ')
          ..write('chest: $chest, ')
          ..write('waist: $waist, ')
          ..write('sleeve: $sleeve, ')
          ..write('neck: $neck, ')
          ..write('daman: $daman, ')
          ..write('shalwarLength: $shalwarLength, ')
          ..write('shalwarWaist: $shalwarWaist, ')
          ..write('shalwarBottom: $shalwarBottom, ')
          ..write('collarStyle: $collarStyle, ')
          ..write('shape: $shape, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CustomersTable customers = $CustomersTable(this);
  late final $MeasurementsTable measurements = $MeasurementsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [customers, measurements];
}

typedef $$CustomersTableCreateCompanionBuilder = CustomersCompanion Function({
  Value<int> id,
  required String serialNumber,
  required String name,
  Value<String?> phone,
  required DateTime createdAt,
  required DateTime updatedAt,
});
typedef $$CustomersTableUpdateCompanionBuilder = CustomersCompanion Function({
  Value<int> id,
  Value<String> serialNumber,
  Value<String> name,
  Value<String?> phone,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$CustomersTableReferences
    extends BaseReferences<_$AppDatabase, $CustomersTable, Customer> {
  $$CustomersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$MeasurementsTable, List<Measurement>>
      _measurementsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.measurements,
              aliasName: 'customers__id__measurements__customer_id');

  $$MeasurementsTableProcessedTableManager get measurementsRefs {
    final manager = $$MeasurementsTableTableManager($_db, $_db.measurements)
        .filter((f) => f.customerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_measurementsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CustomersTableFilterComposer
    extends Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get serialNumber => $composableBuilder(
      column: $table.serialNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> measurementsRefs(
      Expression<bool> Function($$MeasurementsTableFilterComposer f) f) {
    final $$MeasurementsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.measurements,
        getReferencedColumn: (t) => t.customerId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MeasurementsTableFilterComposer(
              $db: $db,
              $table: $db.measurements,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CustomersTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get serialNumber => $composableBuilder(
      column: $table.serialNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$CustomersTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get serialNumber => $composableBuilder(
      column: $table.serialNumber, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> measurementsRefs<T extends Object>(
      Expression<T> Function($$MeasurementsTableAnnotationComposer a) f) {
    final $$MeasurementsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.measurements,
        getReferencedColumn: (t) => t.customerId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MeasurementsTableAnnotationComposer(
              $db: $db,
              $table: $db.measurements,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CustomersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CustomersTable,
    Customer,
    $$CustomersTableFilterComposer,
    $$CustomersTableOrderingComposer,
    $$CustomersTableAnnotationComposer,
    $$CustomersTableCreateCompanionBuilder,
    $$CustomersTableUpdateCompanionBuilder,
    (Customer, $$CustomersTableReferences),
    Customer,
    PrefetchHooks Function({bool measurementsRefs})> {
  $$CustomersTableTableManager(_$AppDatabase db, $CustomersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> serialNumber = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              CustomersCompanion(
            id: id,
            serialNumber: serialNumber,
            name: name,
            phone: phone,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String serialNumber,
            required String name,
            Value<String?> phone = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
          }) =>
              CustomersCompanion.insert(
            id: id,
            serialNumber: serialNumber,
            name: name,
            phone: phone,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$CustomersTable, Customer>(table),
                    $$CustomersTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({measurementsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (measurementsRefs) db.measurements],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (measurementsRefs)
                    await $_getPrefetchedData<Customer, $CustomersTable,
                            Measurement>(
                        currentTable: table,
                        referencedTable: $$CustomersTableReferences
                            ._measurementsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CustomersTableReferences(db, table, p0)
                                .measurementsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.customerId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CustomersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CustomersTable,
    Customer,
    $$CustomersTableFilterComposer,
    $$CustomersTableOrderingComposer,
    $$CustomersTableAnnotationComposer,
    $$CustomersTableCreateCompanionBuilder,
    $$CustomersTableUpdateCompanionBuilder,
    (Customer, $$CustomersTableReferences),
    Customer,
    PrefetchHooks Function({bool measurementsRefs})>;
typedef $$MeasurementsTableCreateCompanionBuilder = MeasurementsCompanion
    Function({
  Value<int> id,
  required int customerId,
  required DateTime measuredAt,
  Value<bool> isCurrent,
  Value<double?> length,
  Value<double?> shoulder,
  Value<double?> chest,
  Value<double?> waist,
  Value<double?> sleeve,
  Value<double?> neck,
  Value<double?> daman,
  Value<double?> shalwarLength,
  Value<double?> shalwarWaist,
  Value<double?> shalwarBottom,
  Value<String?> collarStyle,
  Value<String?> shape,
  Value<String?> notes,
});
typedef $$MeasurementsTableUpdateCompanionBuilder = MeasurementsCompanion
    Function({
  Value<int> id,
  Value<int> customerId,
  Value<DateTime> measuredAt,
  Value<bool> isCurrent,
  Value<double?> length,
  Value<double?> shoulder,
  Value<double?> chest,
  Value<double?> waist,
  Value<double?> sleeve,
  Value<double?> neck,
  Value<double?> daman,
  Value<double?> shalwarLength,
  Value<double?> shalwarWaist,
  Value<double?> shalwarBottom,
  Value<String?> collarStyle,
  Value<String?> shape,
  Value<String?> notes,
});

final class $$MeasurementsTableReferences
    extends BaseReferences<_$AppDatabase, $MeasurementsTable, Measurement> {
  $$MeasurementsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CustomersTable _customerIdTable(_$AppDatabase db) =>
      db.customers.createAlias('measurements__customer_id__customers__id');

  $$CustomersTableProcessedTableManager get customerId {
    final $_column = $_itemColumn<int>('customer_id')!;

    final manager = $$CustomersTableTableManager($_db, $_db.customers)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_customerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$MeasurementsTableFilterComposer
    extends Composer<_$AppDatabase, $MeasurementsTable> {
  $$MeasurementsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get measuredAt => $composableBuilder(
      column: $table.measuredAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isCurrent => $composableBuilder(
      column: $table.isCurrent, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get length => $composableBuilder(
      column: $table.length, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get shoulder => $composableBuilder(
      column: $table.shoulder, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get chest => $composableBuilder(
      column: $table.chest, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get waist => $composableBuilder(
      column: $table.waist, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get sleeve => $composableBuilder(
      column: $table.sleeve, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get neck => $composableBuilder(
      column: $table.neck, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get daman => $composableBuilder(
      column: $table.daman, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get shalwarLength => $composableBuilder(
      column: $table.shalwarLength, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get shalwarWaist => $composableBuilder(
      column: $table.shalwarWaist, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get shalwarBottom => $composableBuilder(
      column: $table.shalwarBottom, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get collarStyle => $composableBuilder(
      column: $table.collarStyle, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get shape => $composableBuilder(
      column: $table.shape, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  $$CustomersTableFilterComposer get customerId {
    final $$CustomersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.customerId,
        referencedTable: $db.customers,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CustomersTableFilterComposer(
              $db: $db,
              $table: $db.customers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MeasurementsTableOrderingComposer
    extends Composer<_$AppDatabase, $MeasurementsTable> {
  $$MeasurementsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get measuredAt => $composableBuilder(
      column: $table.measuredAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isCurrent => $composableBuilder(
      column: $table.isCurrent, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get length => $composableBuilder(
      column: $table.length, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get shoulder => $composableBuilder(
      column: $table.shoulder, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get chest => $composableBuilder(
      column: $table.chest, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get waist => $composableBuilder(
      column: $table.waist, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get sleeve => $composableBuilder(
      column: $table.sleeve, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get neck => $composableBuilder(
      column: $table.neck, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get daman => $composableBuilder(
      column: $table.daman, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get shalwarLength => $composableBuilder(
      column: $table.shalwarLength,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get shalwarWaist => $composableBuilder(
      column: $table.shalwarWaist,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get shalwarBottom => $composableBuilder(
      column: $table.shalwarBottom,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get collarStyle => $composableBuilder(
      column: $table.collarStyle, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get shape => $composableBuilder(
      column: $table.shape, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  $$CustomersTableOrderingComposer get customerId {
    final $$CustomersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.customerId,
        referencedTable: $db.customers,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CustomersTableOrderingComposer(
              $db: $db,
              $table: $db.customers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MeasurementsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MeasurementsTable> {
  $$MeasurementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get measuredAt => $composableBuilder(
      column: $table.measuredAt, builder: (column) => column);

  GeneratedColumn<bool> get isCurrent =>
      $composableBuilder(column: $table.isCurrent, builder: (column) => column);

  GeneratedColumn<double> get length =>
      $composableBuilder(column: $table.length, builder: (column) => column);

  GeneratedColumn<double> get shoulder =>
      $composableBuilder(column: $table.shoulder, builder: (column) => column);

  GeneratedColumn<double> get chest =>
      $composableBuilder(column: $table.chest, builder: (column) => column);

  GeneratedColumn<double> get waist =>
      $composableBuilder(column: $table.waist, builder: (column) => column);

  GeneratedColumn<double> get sleeve =>
      $composableBuilder(column: $table.sleeve, builder: (column) => column);

  GeneratedColumn<double> get neck =>
      $composableBuilder(column: $table.neck, builder: (column) => column);

  GeneratedColumn<double> get daman =>
      $composableBuilder(column: $table.daman, builder: (column) => column);

  GeneratedColumn<double> get shalwarLength => $composableBuilder(
      column: $table.shalwarLength, builder: (column) => column);

  GeneratedColumn<double> get shalwarWaist => $composableBuilder(
      column: $table.shalwarWaist, builder: (column) => column);

  GeneratedColumn<double> get shalwarBottom => $composableBuilder(
      column: $table.shalwarBottom, builder: (column) => column);

  GeneratedColumn<String> get collarStyle => $composableBuilder(
      column: $table.collarStyle, builder: (column) => column);

  GeneratedColumn<String> get shape =>
      $composableBuilder(column: $table.shape, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$CustomersTableAnnotationComposer get customerId {
    final $$CustomersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.customerId,
        referencedTable: $db.customers,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CustomersTableAnnotationComposer(
              $db: $db,
              $table: $db.customers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MeasurementsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MeasurementsTable,
    Measurement,
    $$MeasurementsTableFilterComposer,
    $$MeasurementsTableOrderingComposer,
    $$MeasurementsTableAnnotationComposer,
    $$MeasurementsTableCreateCompanionBuilder,
    $$MeasurementsTableUpdateCompanionBuilder,
    (Measurement, $$MeasurementsTableReferences),
    Measurement,
    PrefetchHooks Function({bool customerId})> {
  $$MeasurementsTableTableManager(_$AppDatabase db, $MeasurementsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MeasurementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MeasurementsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MeasurementsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> customerId = const Value.absent(),
            Value<DateTime> measuredAt = const Value.absent(),
            Value<bool> isCurrent = const Value.absent(),
            Value<double?> length = const Value.absent(),
            Value<double?> shoulder = const Value.absent(),
            Value<double?> chest = const Value.absent(),
            Value<double?> waist = const Value.absent(),
            Value<double?> sleeve = const Value.absent(),
            Value<double?> neck = const Value.absent(),
            Value<double?> daman = const Value.absent(),
            Value<double?> shalwarLength = const Value.absent(),
            Value<double?> shalwarWaist = const Value.absent(),
            Value<double?> shalwarBottom = const Value.absent(),
            Value<String?> collarStyle = const Value.absent(),
            Value<String?> shape = const Value.absent(),
            Value<String?> notes = const Value.absent(),
          }) =>
              MeasurementsCompanion(
            id: id,
            customerId: customerId,
            measuredAt: measuredAt,
            isCurrent: isCurrent,
            length: length,
            shoulder: shoulder,
            chest: chest,
            waist: waist,
            sleeve: sleeve,
            neck: neck,
            daman: daman,
            shalwarLength: shalwarLength,
            shalwarWaist: shalwarWaist,
            shalwarBottom: shalwarBottom,
            collarStyle: collarStyle,
            shape: shape,
            notes: notes,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int customerId,
            required DateTime measuredAt,
            Value<bool> isCurrent = const Value.absent(),
            Value<double?> length = const Value.absent(),
            Value<double?> shoulder = const Value.absent(),
            Value<double?> chest = const Value.absent(),
            Value<double?> waist = const Value.absent(),
            Value<double?> sleeve = const Value.absent(),
            Value<double?> neck = const Value.absent(),
            Value<double?> daman = const Value.absent(),
            Value<double?> shalwarLength = const Value.absent(),
            Value<double?> shalwarWaist = const Value.absent(),
            Value<double?> shalwarBottom = const Value.absent(),
            Value<String?> collarStyle = const Value.absent(),
            Value<String?> shape = const Value.absent(),
            Value<String?> notes = const Value.absent(),
          }) =>
              MeasurementsCompanion.insert(
            id: id,
            customerId: customerId,
            measuredAt: measuredAt,
            isCurrent: isCurrent,
            length: length,
            shoulder: shoulder,
            chest: chest,
            waist: waist,
            sleeve: sleeve,
            neck: neck,
            daman: daman,
            shalwarLength: shalwarLength,
            shalwarWaist: shalwarWaist,
            shalwarBottom: shalwarBottom,
            collarStyle: collarStyle,
            shape: shape,
            notes: notes,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$MeasurementsTable, Measurement>(table),
                    $$MeasurementsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({customerId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (customerId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.customerId,
                    referencedTable:
                        $$MeasurementsTableReferences._customerIdTable(db),
                    referencedColumn:
                        $$MeasurementsTableReferences._customerIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$MeasurementsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MeasurementsTable,
    Measurement,
    $$MeasurementsTableFilterComposer,
    $$MeasurementsTableOrderingComposer,
    $$MeasurementsTableAnnotationComposer,
    $$MeasurementsTableCreateCompanionBuilder,
    $$MeasurementsTableUpdateCompanionBuilder,
    (Measurement, $$MeasurementsTableReferences),
    Measurement,
    PrefetchHooks Function({bool customerId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CustomersTableTableManager get customers =>
      $$CustomersTableTableManager(_db, _db.customers);
  $$MeasurementsTableTableManager get measurements =>
      $$MeasurementsTableTableManager(_db, _db.measurements);
}
