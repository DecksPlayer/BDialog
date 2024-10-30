import 'package:bdialog/BDialog.dart';
import 'package:flutter/material.dart';

enum DialogType { message, info, error, warning }

enum HideType { none, btnOk, twoActionsButton}

enum DialogSize { tiny, min, medium, max }

class _CustomDialog extends StatelessWidget {
  final DialogType type;
  final DialogSize size;
  final HideType? hideType;
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
  final IconData? option1Icon;
  final IconData? option2Icon;
  final Color? option1Color;
  final Color? option2Color;

  const _CustomDialog(
      {required this.type,
      required this.size,
      required this.title,
      required this.description,
        this.hideType= HideType.btnOk,
      this.body,
      this.okAction,
      this.yesAction,
      this.noAction,
        this.okText ='Ok',
      this.yesText = 'yes',
      this.noText = 'no',
      this.customIcon,
      this.iconSize,
        this.option1Icon= Icons.check_circle
        , this.option2Icon= Icons.cancel,
        this.option1Color= Colors.green,
        this.option2Color = Colors.red

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
                visible: (hideType == HideType.twoActionsButton||hideType == HideType.btnOk),
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
                          avatar: Icon(option1Icon),
                          color: WidgetStateProperty.resolveWith(
                              (v0) => option1Color),
                          labelStyle: TextStyle(color: Colors.white),
                          iconTheme: IconThemeData(color: Colors.white),
                        ),
                        ActionChip(
                          side: BorderSide.none,
                          label: Text(noText??'No'),
                          onPressed: noAction ?? ()=>Navigator.of(context,rootNavigator: false).pop(),
                          avatar: Icon(option2Icon),
                          color: WidgetStateProperty.resolveWith(
                              (v0) => option2Color),
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
      String title, String description,
      {
        Duration? timeOut,
        HideType? action,
      Function()? option1Action,
      Function()? option2Action,
      Function()? okAction,
       String? option1Text,
       String? option2Text,
       String? okText,
      Widget? customIcon,
      double? iconSize,
      IconData? icon1Option,
      IconData? icon2Option,
        Color? option1Color,
        Color? option2Color,
      }) {
    if (timeOut!=null) {
      showDialog(
          context: context,
          builder: (context) => _CustomDialog(
                type: typed,
                hideType: HideType.none,
                size: size,
                title: title,
                description: description,
                body: null,
                okAction: okAction,
                okText: okText,
                iconSize: iconSize,
                customIcon: customIcon,
              )).timeout(timeOut.inMicroseconds>0?timeOut : Duration(seconds: 3),
          onTimeout: () => Navigator.of(context, rootNavigator: false).pop());
    } else {
      showDialog(
          context: context,
          builder: (context) => _CustomDialog(
                type: typed,
                hideType: action,
                size: size,
                title: title,
                description: description,
                body: null,
                yesAction: option1Action,
                noAction: option2Action,
                okAction: okAction,
                yesText: option1Text,
                noText: option2Text,
                okText: okText,
                customIcon: customIcon,
                iconSize: iconSize,
                option1Icon: icon1Option ??Icons.check_circle,
                option2Icon: icon2Option?? Icons.cancel,
                option1Color: option1Color??Colors.green,
                option2Color: option2Color??Colors.red,
              ));
    }
  }
}
