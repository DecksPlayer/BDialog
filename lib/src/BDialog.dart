import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

 enum dialogType{
   message,info,error,warning
 }

 enum dialogSize{
   tiny,min,medium,max
 }

class _CustomDialog extends StatelessWidget {
  final dialogType type;
  final dialogSize size;
  final String title;
  final String description;
  final Widget? body;

  _CustomDialog(
      {required this.type, required this.size, required this.title, required this.description, this.body});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child:
      FractionallySizedBox(
          heightFactor: getDialogHeight(),
          widthFactor: 0.9,
          child:
          Stack(
              children: [
                Column(
                    children: [
                      Stack(
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                  child:
                                  Icon(getIconByDialog(), size: 90,
                                    color: getIconColor(),),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(130),
                                    color: Colors.white,)),
                            ),
                          ]),

                      Expanded(
                          child:
                      Card(
                          elevation: 1,
                          child: SingleChildScrollView(
                              child:
                              Column(
                                  children: [
                                    Align(child: Text('$title',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 24),), alignment: Alignment
                                        .topCenter,),
                                    Divider(),

                                    Text('$description',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),textAlign: TextAlign.center),
                                  ])
                          )
                      ))
                    ])
              ])),
    );
  }

  getIconByDialog() {
    switch (type) {
      case dialogType.info:
        return Icons.info;
      case dialogType.warning:
        return Icons.warning_amber;
      case dialogType.error:
        return Icons.error;
      case dialogType.message:
        return Icons.message;
      default:
        return Icons.info;
    }
  }

  getIconColor() {
    switch (type) {
      case dialogType.info:
        return Colors.blue.shade700;
      case dialogType.warning:
        return Colors.yellow.shade800;
      case dialogType.error:
        return Colors.red;
      case dialogType.message:
        return Colors.black;
      default:
        return Colors.blue.shade700;
    }
  }

  double getDialogHeight(){
    switch(size){
      case dialogSize.tiny:
        return 0.25;
      case dialogSize.min:
        return  0.35;
      case dialogSize.medium:
        return 0.45;
      case dialogSize.max:
        return 0.55;
    }
  }



}

class bDialog{

  showBigDialog(BuildContext context,dialogType typed,String title,String description,bool autoDismiss,Duration timeOut){
    if(autoDismiss)
    showDialog(context: context, builder:(context)=>_CustomDialog(type: typed,size: dialogSize.max,title: title,description: description,body: null,)).timeout(timeOut.inSeconds>0?timeOut:Duration(seconds: 3),onTimeout:()=> Navigator.pop(context));
    else
    showDialog(context: context, builder:(context)=>_CustomDialog(type: typed,size: dialogSize.max,title: title,description: description,body: null,));
  }

  showMediumDialog(BuildContext context,dialogType typed,String title,String description,bool autoDismiss,Duration timeOut){
    if(autoDismiss)
      showDialog(context: context, builder:(context)=>_CustomDialog(type: typed,size: dialogSize.medium,title: title,description: description,body: null,)).timeout(timeOut.inSeconds>0?timeOut:Duration(seconds: 3),onTimeout:()=> Navigator.pop(context));
    else
      showDialog(context: context, builder:(context)=>_CustomDialog(type: typed,size: dialogSize.medium,title: title,description: description,body: null,));

  }

  showSmallDialog(BuildContext context,dialogType typed,String title,String description,bool autoDismiss,Duration timeOut){
    if(autoDismiss)
      showDialog(context: context, builder:(context)=>_CustomDialog(type: typed,size: dialogSize.min,title: title,description: description,body: null,)).timeout(timeOut.inSeconds>0?timeOut:Duration(seconds: 3),onTimeout:()=> Navigator.pop(context));
    else
      showDialog(context: context, builder:(context)=>_CustomDialog(type: typed,size: dialogSize.min,title: title,description: description,body: null,));

  }

  showTinyDialog(BuildContext context,dialogType typed,String title,String description,bool autoDismiss,Duration timeOut){
    if(autoDismiss)
      showDialog(context: context, builder:(context)=>_CustomDialog(type: typed,size: dialogSize.tiny,title: title,description: description,body: null,)).timeout(timeOut.inSeconds>0?timeOut:Duration(seconds: 3),onTimeout:()=> Navigator.pop(context));
    else
      showDialog(context: context, builder:(context)=>_CustomDialog(type: typed,size: dialogSize.tiny,title: title,description: description,body: null,));

  }
}