import 'package:flutter/cupertino.dart';

class StatefulWrapper extends StatefulWidget {
  final VoidCallback onInit;
  final Widget child;
  const StatefulWrapper({super.key, required this.onInit, required this.child});
  @override
  // ignore: library_private_types_in_public_api
  _StatefulWrapperState createState() => _StatefulWrapperState();
}

class _StatefulWrapperState extends State<StatefulWrapper> {
  @override
  void initState() {
    setState(() {
      widget.onInit();
      super.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
