import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

bool? checkDistanceFromHomeIsMoreThenRadius(
  LatLng latLng1,
  int givenRadius,
  LatLng latLng2,
) {
  return returnDistanceBetweenTwoPoints(latLng1, latLng2)! > givenRadius;
}

double? returnDistanceBetweenTwoPoints(
  LatLng? positionOne,
  LatLng? positionTwo,
) {
  // calculate the distance between two points on a spheroid and return distance as double
  var p = 0.017453292519943295;
  var a = 0.5 -
      math.cos((positionTwo!.latitude - positionOne!.latitude) * p) / 2 +
      math.cos(positionOne.latitude * p) *
          math.cos(positionTwo.latitude * p) *
          (1 - math.cos((positionTwo.longitude - positionOne.longitude) * p)) /
          2;
  double result = 12742 * math.asin(math.sqrt(a));
  // uncomment the line below if you want the result to be rounded
  // double finalResult = result.roundToDouble();
  // if you uncommented the line above, you have to replace result in the line below with finalResult
  return result;
}

String formatDate(String date) {
  List<String> dateElements = date.split('/');
  if (dateElements[0].length <= 1) {
    dateElements[0] = "0" + dateElements[0];
  }
  if (dateElements[1].length <= 1) {
    dateElements[0] = "0" + dateElements[0];
  }
  return dateElements[2] + "-" + dateElements[0] + "-" + dateElements[1];
}
