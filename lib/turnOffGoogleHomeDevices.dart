import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> turnOffGoogleHomeDevices(String apiKey) async {
  // Make a request to get a list of all the Google Home devices
  var response = await http.get(Uri.dataFromString('https://homecontrol.googleapis.com/v1/devices?key=$apiKey'));

  // Check if the request was successful
  if (response.statusCode == 200) {
    // Decode the JSON response
    var devices = jsonDecode(response.body)['devices'] as List;

    // Loop through each device and turn it off
    for (var device in devices) {
      var deviceId = device['id'];
      var requestBody = jsonEncode({
        'execution': [
          {
            'command': 'action.devices.commands.OnOff',
            'params': {'on': false}
          }
        ]
      });

      // Make a request to turn off the device
      var turnOffResponse = await http.post(
          Uri.dataFromString('https://homecontrol.googleapis.com/v1/devices?key=$apiKey'),
          headers: {'Content-Type': 'application/json'},
          body: requestBody);

      // Check if the request to turn off the device was successful
      if (turnOffResponse.statusCode != 200) {
        print('Failed to turn off device: $deviceId');
      }
    }
  } else {
    print('Failed to get list of devices');
  }
}

