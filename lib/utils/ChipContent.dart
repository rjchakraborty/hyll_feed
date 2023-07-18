import 'package:flutter/material.dart';

class ChipContent extends StatefulWidget {
  final String title;
  final Widget child;

  ChipContent({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  _ChipContentState createState() => _ChipContentState();
}

class _ChipContentState extends State<ChipContent> with AutomaticKeepAliveClientMixin<ChipContent> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(5),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            color: Colors.blueGrey[50],
            child: Text(
              widget.title,
              style: const TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.w500),
            ),
          ),
          Flexible(fit: FlexFit.loose, child: widget.child),
        ],
      ),
    );
  }
}
