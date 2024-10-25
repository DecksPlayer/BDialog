import 'package:bdialog/BDialog.dart';
import 'package:flutter/material.dart';

enum DialogType { message, info, error, warning }

enum HideType { none, btnOk, yesNo}

enum DialogSize { tiny, min, medium, max }

class _CustomDialog extends StatelessWidget {
  final DialogType type;
  final DialogSize size;
  final HideType hideType;
  final String title;
  final String description;
  final Widget? body;
  final Function()? okAction;
  final Function()? yesAction;
  final Function()? noAction;
  final String? okText;
  final String? yesText;
  final String? noText;
  final Widget? customIcon;
  final double? iconSize;

  const _CustomDialog(
      {required this.type,
      required this.size,
      required this.title,
      required this.description,
      required this.hideType,
      this.body,
      this.okAction,
      this.yesAction,
      this.noAction,
        this.okText ='Ok',
      this.yesText = 'yes',
      this.noText = 'no',
      this.customIcon,
      this.iconSize});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        widthFactor: 0.9,
        heightFactor: getDialogHeight(),
        child: Column(children: [
          Stack(children: [
            Align(
                alignment: Alignment.topCenter,
                child: customIcon ??
                    AvatarBDialog(
                      size: iconSize ?? 90,
                      color: Colors.white,
                      padding: 0,
                      child: Icon(
                        getIconByDialog(),
                        size: iconSize ?? 80,
                        color: getIconColor(),
                      ),
                    )),
          ]),
          Flexible(
              child: Card(
                  child: Column(children: [
            Expanded(
              flex: 1,
                    child: Text(
                  '$title',
                  style: titleStyle,
                  textAlign: TextAlign.center,
                )),
            Expanded(
                flex: 3,
                child: SingleChildScrollView(
                    child: Column(children: [
                  Divider(),
                  Container(
                    child: Text('$description',
                        style: normalTextStyle, textAlign: TextAlign.center),
                  ),
                ]))),
            Visibility(
                visible: (hideType == HideType.yesNo||hideType == HideType.btnOk),
                child: Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: HideType==HideType.btnOk? MainAxisAlignment.center:MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children:hideType==HideType.btnOk?[
                        ActionChip(
                          side: BorderSide.none,
                          label: Text(okText??'Ok'),
                          onPressed: okAction ??()=>Navigator.of(context,rootNavigator: false).pop(),
                          avatar: Icon(Icons.check_circle),
                          color: WidgetStateProperty.resolveWith(
                                  (v0) => Colors.teal.shade800),
                          labelStyle: TextStyle(color: Colors.white),
                          iconTheme: IconThemeData(color: Colors.white),
                        ),
                      ]: [
                        ActionChip(
                          side: BorderSide.none,
                          label: Text(yesText??'Yes'),
                          onPressed: yesAction ?? ()=>Navigator.of(context,rootNavigator: false).pop(),
                          avatar: Icon(Icons.check_circle),
                          color: WidgetStateProperty.resolveWith(
                              (v0) => Colors.green),
                          labelStyle: TextStyle(color: Colors.white),
                          iconTheme: IconThemeData(color: Colors.white),
                        ),
                        ActionChip(
                          side: BorderSide.none,
                          label: Text(noText??'No'),
                          onPressed: noAction ?? ()=>Navigator.of(context,rootNavigator: false).pop(),
                          avatar: Icon(Icons.cancel),
                          color: WidgetStateProperty.resolveWith(
                              (v0) => Colors.red),
                          labelStyle: TextStyle(color: Colors.white),
                          iconTheme: IconThemeData(color: Colors.white),
                        )
                      ],
                    )))
            ])))
        ]));
  }

  getIconByDialog() {
    switch (type) {
      case DialogType.info:
        return Icons.info;
      case DialogType.warning:
        return Icons.warning_amber;
      case DialogType.error:
        return Icons.error;
      case DialogType.message:
        return Icons.message;
      default:
        return Icons.info;
    }
  }

  getIconColor() {
    switch (type) {
      case DialogType.info:
        return Colors.blue.shade700;
      case DialogType.warning:
        return Colors.yellow.shade800;
      case DialogType.error:
        return Colors.red;
      case DialogType.message:
        return Colors.black;
      default:
        return Colors.blue.shade700;
    }
  }

  double getDialogHeight() {
    switch (size) {
      case DialogSize.tiny:
        return 0.35;
      case DialogSize.min:
        return 0.45;
      case DialogSize.medium:
        return 0.75;
      case DialogSize.max:
        return 0.85;
    }
  }
}

class BDialog {
  showBDialog(BuildContext context, DialogType typed, DialogSize size,
      String title, String description, bool autoDismiss, Duration timeOut,
      {HideType? action,
      Function()? yesAction,
      Function()? noAction,
      Function()? okAction,
       String? yesText,
       String? noText,
       String? okText,
      Widget? customIcon,
      double? iconSize}) {
    if (autoDismiss) {
      showDialog(
          context: context,
          builder: (context) => _CustomDialog(
                type: typed,
                hideType: HideType.none,
                size: size,
                title: title,
                description: description,
                body: null,
                yesAction: yesAction,
                noAction: noAction,
                okAction: okAction,
                yesText: yesText,
                noText: noText,
                okText: okText,
                iconSize: iconSize,
                customIcon: customIcon,
              )).timeout(timeOut.inSeconds > 0 ? timeOut : Duration(seconds: 3),
          onTimeout: () => Navigator.of(context, rootNavigator: false).pop());
    } else {
      showDialog(
          context: context,
          builder: (context) => _CustomDialog(
                type: typed,
                hideType: action ?? HideType.btnOk,
                size: size,
                title: title,
                description: description,
                body: null,
                yesAction: yesAction,
                noAction: noAction,
                okAction: okAction,
                yesText: yesText,
                noText: noText,
                okText: okText,
                customIcon: customIcon,
                iconSize: iconSize,
              ));
    }
  }
}
