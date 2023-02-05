import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetHotelsCall {
  static Future<ApiCallResponse> call({
    int? destIds,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getHotels',
      apiUrl: 'https://apidojo-booking-v1.p.rapidapi.com/properties/list',
      callType: ApiCallType.GET,
      headers: {
        'X-RapidAPI-Key': 'ed4c1b2fa2msh01c1ff6628f84eap14e384jsn9ac76688cb8f',
        'X-RapidAPI-Host': 'apidojo-booking-v1.p.rapidapi.com',
      },
      params: {
        'offset': 0,
        'arrival_date': "2023-02-05",
        'departure_date': "2023-02-11",
        'guest_qty': 1,
        'dest_ids': destIds,
        'room_qty': 1,
        'search_type': "city",
        'order_by': "price",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic hotelName(dynamic response) => getJsonField(
        response,
        r'''$.result[:].hotel_name''',
        true,
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
