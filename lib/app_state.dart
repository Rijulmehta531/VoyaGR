import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _foregroundImages = [
    'https://user-images.githubusercontent.com/71979346/216753936-88349ff3-6868-4f90-b052-f0751658571a.png',
    'https://user-images.githubusercontent.com/71979346/216793162-e0ac78a5-3aee-45b8-927e-17a0c342f585.png',
    'https://user-images.githubusercontent.com/71979346/216793231-3496a0c5-4f8b-42f6-a3fa-4a9102506b72.png'
  ];
  List<String> get foregroundImages => _foregroundImages;
  set foregroundImages(List<String> _value) {
    _foregroundImages = _value;
  }

  void addToForegroundImages(String _value) {
    _foregroundImages.add(_value);
  }

  void removeFromForegroundImages(String _value) {
    _foregroundImages.remove(_value);
  }

  List<String> _backgroundImages = [
    'https://user-images.githubusercontent.com/71979346/216753168-66998c29-791a-4d20-a665-495b082c9433.jpg',
    'https://user-images.githubusercontent.com/71979346/216792323-74bf80cd-ddf5-442a-af2f-b9d60c9c927d.png',
    'https://user-images.githubusercontent.com/71979346/216792573-04bc769b-0f04-4868-81f6-b910333a5e31.jpeg'
  ];
  List<String> get backgroundImages => _backgroundImages;
  set backgroundImages(List<String> _value) {
    _backgroundImages = _value;
  }

  void addToBackgroundImages(String _value) {
    _backgroundImages.add(_value);
  }

  void removeFromBackgroundImages(String _value) {
    _backgroundImages.remove(_value);
  }

  List<String> _texts = ['New York', 'Houston', 'Chicago'];
  List<String> get texts => _texts;
  set texts(List<String> _value) {
    _texts = _value;
  }

  void addToTexts(String _value) {
    _texts.add(_value);
  }

  void removeFromTexts(String _value) {
    _texts.remove(_value);
  }

  List<String> _homeState = [];
  List<String> get homeState => _homeState;
  set homeState(List<String> _value) {
    _homeState = _value;
  }

  void addToHomeState(String _value) {
    _homeState.add(_value);
  }

  void removeFromHomeState(String _value) {
    _homeState.remove(_value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
