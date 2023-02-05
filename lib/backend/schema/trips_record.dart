import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'trips_record.g.dart';

abstract class TripsRecord implements Built<TripsRecord, TripsRecordBuilder> {
  static Serializer<TripsRecord> get serializer => _$tripsRecordSerializer;

  DocumentReference? get cityRef;

  DocumentReference? get userRef;

  DateTime? get checkinDate;

  DateTime? get checkoutDate;

  String? get hotelName;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TripsRecordBuilder builder) =>
      builder..hotelName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('trips');

  static Stream<TripsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TripsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TripsRecord._();
  factory TripsRecord([void Function(TripsRecordBuilder) updates]) =
      _$TripsRecord;

  static TripsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTripsRecordData({
  DocumentReference? cityRef,
  DocumentReference? userRef,
  DateTime? checkinDate,
  DateTime? checkoutDate,
  String? hotelName,
}) {
  final firestoreData = serializers.toFirestore(
    TripsRecord.serializer,
    TripsRecord(
      (t) => t
        ..cityRef = cityRef
        ..userRef = userRef
        ..checkinDate = checkinDate
        ..checkoutDate = checkoutDate
        ..hotelName = hotelName,
    ),
  );

  return firestoreData;
}
