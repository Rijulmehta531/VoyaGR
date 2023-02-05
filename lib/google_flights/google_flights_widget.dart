import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_web_view.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GoogleFlightsWidget extends StatefulWidget {
  const GoogleFlightsWidget({
    Key? key,
    int? budget,
    this.startDate,
    this.returnDate,
    this.airportCode,
  })  : this.budget = budget ?? 0,
        super(key: key);

  final int budget;
  final String? startDate;
  final String? returnDate;
  final String? airportCode;

  @override
  _GoogleFlightsWidgetState createState() => _GoogleFlightsWidgetState();
}

class _GoogleFlightsWidgetState extends State<GoogleFlightsWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: FlutterFlowWebView(
                  url:
                      'https://www.google.com/travel/flights?q=Flights%20to%20${widget.airportCode}%20from%20ATL%20on%20${functions.formatDate(widget.startDate!)}%20through%20${functions.formatDate(widget.returnDate!)}%20cheap',
                  bypass: false,
                  height: 500,
                  verticalScroll: false,
                  horizontalScroll: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
