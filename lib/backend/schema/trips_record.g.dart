// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trips_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TripsRecord> _$tripsRecordSerializer = new _$TripsRecordSerializer();

class _$TripsRecordSerializer implements StructuredSerializer<TripsRecord> {
  @override
  final Iterable<Type> types = const [TripsRecord, _$TripsRecord];
  @override
  final String wireName = 'TripsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, TripsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.cityRef;
    if (value != null) {
      result
        ..add('cityRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.userRef;
    if (value != null) {
      result
        ..add('userRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.checkinDate;
    if (value != null) {
      result
        ..add('checkinDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.checkoutDate;
    if (value != null) {
      result
        ..add('checkoutDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.hotelName;
    if (value != null) {
      result
        ..add('hotelName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  TripsRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TripsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'cityRef':
          result.cityRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'userRef':
          result.userRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'checkinDate':
          result.checkinDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'checkoutDate':
          result.checkoutDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'hotelName':
          result.hotelName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$TripsRecord extends TripsRecord {
  @override
  final DocumentReference<Object?>? cityRef;
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final DateTime? checkinDate;
  @override
  final DateTime? checkoutDate;
  @override
  final String? hotelName;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TripsRecord([void Function(TripsRecordBuilder)? updates]) =>
      (new TripsRecordBuilder()..update(updates))._build();

  _$TripsRecord._(
      {this.cityRef,
      this.userRef,
      this.checkinDate,
      this.checkoutDate,
      this.hotelName,
      this.ffRef})
      : super._();

  @override
  TripsRecord rebuild(void Function(TripsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TripsRecordBuilder toBuilder() => new TripsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TripsRecord &&
        cityRef == other.cityRef &&
        userRef == other.userRef &&
        checkinDate == other.checkinDate &&
        checkoutDate == other.checkoutDate &&
        hotelName == other.hotelName &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, cityRef.hashCode), userRef.hashCode),
                    checkinDate.hashCode),
                checkoutDate.hashCode),
            hotelName.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TripsRecord')
          ..add('cityRef', cityRef)
          ..add('userRef', userRef)
          ..add('checkinDate', checkinDate)
          ..add('checkoutDate', checkoutDate)
          ..add('hotelName', hotelName)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TripsRecordBuilder implements Builder<TripsRecord, TripsRecordBuilder> {
  _$TripsRecord? _$v;

  DocumentReference<Object?>? _cityRef;
  DocumentReference<Object?>? get cityRef => _$this._cityRef;
  set cityRef(DocumentReference<Object?>? cityRef) => _$this._cityRef = cityRef;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  DateTime? _checkinDate;
  DateTime? get checkinDate => _$this._checkinDate;
  set checkinDate(DateTime? checkinDate) => _$this._checkinDate = checkinDate;

  DateTime? _checkoutDate;
  DateTime? get checkoutDate => _$this._checkoutDate;
  set checkoutDate(DateTime? checkoutDate) =>
      _$this._checkoutDate = checkoutDate;

  String? _hotelName;
  String? get hotelName => _$this._hotelName;
  set hotelName(String? hotelName) => _$this._hotelName = hotelName;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TripsRecordBuilder() {
    TripsRecord._initializeBuilder(this);
  }

  TripsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cityRef = $v.cityRef;
      _userRef = $v.userRef;
      _checkinDate = $v.checkinDate;
      _checkoutDate = $v.checkoutDate;
      _hotelName = $v.hotelName;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TripsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TripsRecord;
  }

  @override
  void update(void Function(TripsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TripsRecord build() => _build();

  _$TripsRecord _build() {
    final _$result = _$v ??
        new _$TripsRecord._(
            cityRef: cityRef,
            userRef: userRef,
            checkinDate: checkinDate,
            checkoutDate: checkoutDate,
            hotelName: hotelName,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
