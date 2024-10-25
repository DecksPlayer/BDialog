import 'package:flutter/material.dart';

class AvatarBDialog extends StatelessWidget{
  double size;
  Widget child;
  Color? marginColor;
  double? padding;
  AvatarBDialog({required this.size,required this.child,this.marginColor,this.padding});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
        height: size,
        width: size,
        child:
        Container(
            decoration:BoxDecoration(color:marginColor??Colors.white,borderRadius: BorderRadius.all(Radius.circular(size))),
            padding:  EdgeInsets.all(padding??0),
            child:
            ClipOval(
                child: Center(
                    child: child)))
    );
  }
}