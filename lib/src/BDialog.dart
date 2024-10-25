import 'package:bdialog/BDialog.dart';
import 'package:bdialog/src/Styles/BDialogStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum dialogType { message, info, error, warning, yes }

enum dialogSize { tiny, min, medium, max }


class _CustomDialog extends StatelessWidget {
  final dialogType type;
  final dialogSize size;
  final String title;
  final String description;
  final Widget? body;
  final Function()? yesAction;
  final Function()? noAction;
  final String? yesText;
  final String? noText;
  final Widget? customIcon;
  final double? iconSize;

  _CustomDialog(
      {required this.type,
      required this.size,
      required this.title,
      required this.description,
      this.body,
      this.yesAction,
      this.noAction,
      this.yesText='yes',
      this.noText='no',
        this.customIcon,
        this.iconSize
      });

  @override
  Widget build(BuildContext context) {

    return FractionallySizedBox(
        widthFactor: 0.9,
        heightFactor: getDialogHeight(),
        child: Column(children: [
          Stack(children: [
            Align(
              alignment: Alignment.topCenter,
              child: customIcon??
                  AvatarBDialog(size:iconSize??90,
                      child:  Icon(getIconByDialog(),size: iconSize??80,color: getIconColor(),), marginColor: Colors.white,padding: 0,)
            ),
          ]),
          Flexible(
              child: Card(
                  child: Column(children: [
                    Flexible(
                        child:
            Text(
              '$title',
              style: titleStyle,textAlign: TextAlign.center,)),
            Expanded(
                flex: 2,
                child: SingleChildScrollView(
                    child: Column(children: [
                  Divider(),
                  Container(
                    child: Text('$description',
                        style: normalTextStyle,
                        textAlign: TextAlign.center),
                  ),
                ]))),
            Expanded(
                flex: 1,
                child: Visibility(
                    visible: type == dialogType.yes,
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ActionChip(
                          side: BorderSide.none,
                          label: Text(yesText!),
                          onPressed: yesAction ?? () {},
                          avatar: Icon(Icons.check_circle),
                          color: WidgetStateProperty.resolveWith(
                              (v0) => Colors.green),
                          labelStyle: TextStyle(color: Colors.white),
                          iconTheme: IconThemeData(color: Colors.white),
                        ),

                        ActionChip(
                          side: BorderSide.none,
                          label: Text(noText!),
                          onPressed: noAction ?? () {},
                          avatar: Icon(Icons.cancel),
                          color: WidgetStateProperty.resolveWith(
                              (v0) => Colors.red),
                          labelStyle: TextStyle(color: Colors.white),
                          iconTheme: IconThemeData(color: Colors.white),
                        )
                      ],
                    )))])
          ))
        ]));
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
      case dialogType.yes:
        return Icons.info;
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
      case dialogType.yes:
        return Colors.blue.shade300;
      default:
        return Colors.blue.shade700;
    }
  }

  double getDialogHeight() {
    switch (size) {
      case dialogSize.tiny:
        return 0.25;
      case dialogSize.min:
        return 0.35;
      case dialogSize.medium:
        return 0.45;
      case dialogSize.max:
        return 0.55;
    }
  }
}

class bDialog {
  showBigDialog(BuildContext context, dialogType typed, String title,
      String description, bool autoDismiss, Duration timeOut) {
    if (autoDismiss) {
      showDialog(
          context: context,
          builder: (context) => _CustomDialog(
                type: typed,
                size: dialogSize.max,
                title: title,
                description: description,
                body: null,
              )).timeout(timeOut.inSeconds > 0 ? timeOut : Duration(seconds: 3),
          onTimeout: () => Navigator.pop(context));
    } else {
      showDialog(
          context: context,
          builder: (context) => _CustomDialog(
                type: typed,
                size: dialogSize.max,
                title: title,
                description: description,
                body: null,
              ));
    }
  }

  showMediumDialog(BuildContext context, dialogType typed, String title,
      String description, bool autoDismiss, Duration timeOut) {
    if (autoDismiss) {
      showDialog(
          context: context,
          builder: (context) => _CustomDialog(
                type: typed,
                size: dialogSize.medium,
                title: title,
                description: description,
                body: null,
              )).timeout(timeOut.inSeconds > 0 ? timeOut : Duration(seconds: 3),
          onTimeout: () => Navigator.of(context,rootNavigator: false).pop());
    } else {
      showDialog(
          context: context,
          builder: (context) => _CustomDialog(
                type: typed,
                size: dialogSize.medium,
                title: title,
                description: description,
                body: null,
              ));
    }
  }

  showSmallDialog(BuildContext context, dialogType typed, String title,
      String description, bool autoDismiss, Duration timeOut) {
    if (autoDismiss) {
      showDialog(
          context: context,
          builder: (context) => _CustomDialog(
                type: typed,
                size: dialogSize.min,
                title: title,
                description: description,
                body: null,
              )).timeout(timeOut.inSeconds > 0 ? timeOut : Duration(seconds: 3),
          onTimeout: () =>Navigator.of(context,rootNavigator: false).pop());
    } else {
      showDialog(
          context: context,
          builder: (context) => _CustomDialog(
                type: typed,
                size: dialogSize.min,
                title: title,
                description: description,
                body: null,
              ));
    }
  }

  showTinyDialog(BuildContext context, dialogType typed, String title,
      String description, bool autoDismiss, Duration timeOut) {
    if (autoDismiss) {
      showDialog(
          context: context,
          builder: (context) => _CustomDialog(
                type: typed,
                size: dialogSize.tiny,
                title: title,
                description: description,
                body: null,
              )).timeout(timeOut.inSeconds > 0 ? timeOut : Duration(seconds: 3),
          onTimeout: () => Navigator.of(context,rootNavigator: false).pop());
    } else {
      showDialog(
          context: context,
          builder: (context) => _CustomDialog(
                type: typed,
                size: dialogSize.tiny,
                title: title,
                description: description,
                body: null,
              ));
    }
  }

  showOptionDialog(
      BuildContext context, String title, String description, dialogSize size,
      {Function()? option1, Function()? option2,Widget? customIcon}) {
    showDialog(
        context: context,
        builder: (context) => _CustomDialog(
              type: dialogType.yes,
              size: size,
              title: title,
              description: description,
              body: null,
              yesAction: option1,
              noAction: option2,
          customIcon: customIcon,
            ));
  }
}
