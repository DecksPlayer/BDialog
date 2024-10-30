# bdialog

Create awesome dialogues with BDialog,
BDialog is a tiny tool in which you can make dialogs like yes No, or Ok dialog.
## Getting Started

With this project you can create beautifully dialogs that show information
![Yes No](https://github.com/DecksPlayer/BDialog/blob/master/assets/7.png)

## Example
```flutter
import 'package:flutter/material.dart';
import 'package:bdialog/BDialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BDialog',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BDialog'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String description = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(

          children: <Widget>[
            Center(child:
            AvatarBDialog(size: 200, child: Image.network(
                'https://picsum.photos/250?image=9'),)),
            Center(child:
            AvatarBDialog(size: 200, child: Image.network(
                'https://picsum.photos/250?image=9'),padding: 10,)),
            Center(child:
            AvatarBDialog(size: 200, child: Image.network(
                'https://picsum.photos/250?image=9'),padding: 10,color: Colors.black45,)),
            Center(child:
            AvatarBDialog(size: 100, child: Text('Hello'))),

            ActionChip(label: Text('Max Size'),onPressed: (){
              BDialog().showBDialog(context, DialogType.info,DialogSize.max,'Welcome To BDialog', description,);
            },),
            ActionChip(label: Text('Medium Size'),onPressed: (){
              BDialog().showBDialog(context, DialogType.info,DialogSize.medium,'Welcome To BDialog', description, );
            },),
            ActionChip(label: Text('Min Size'),onPressed: (){
              BDialog().showBDialog(context, DialogType.info,DialogSize.min,'Welcome To BDialog', description,);
            },),
            ActionChip(label: Text('Tiny Size'),onPressed: (){
              BDialog().showBDialog(context, DialogType.info,DialogSize.tiny,'Welcome To BDialog', description,);
            },),
            ActionChip(label: Text('Max Size Yes No'),onPressed: (){
              BDialog().showBDialog(context, DialogType.info,DialogSize.max,'Welcome To BDialog', description, action: HideType.twoActionsButton);
            },),
            ActionChip(label: Text('Medium Size Yes No'),onPressed: (){
              BDialog().showBDialog(context, DialogType.info,DialogSize.medium,'Welcome To BDialog', description,action: HideType.twoActionsButton);
            },),
            ActionChip(label: Text('Min Size Yes No'),onPressed: (){
              BDialog().showBDialog(context, DialogType.info,DialogSize.min,'Welcome To BDialog', description,action: HideType.twoActionsButton);
            },),
            ActionChip(label: Text('Tiny Size Yes No'),onPressed: (){
              BDialog().showBDialog(context, DialogType.info,DialogSize.tiny,'Welcome To BDialog', description,action: HideType.twoActionsButton);
            },),
            ActionChip(label: Text('Max Size AutoHide'),onPressed: (){
              BDialog().showBDialog(context, DialogType.info,DialogSize.max,'Welcome To BDialog', description, timeOut: Duration(seconds: 30));
            },),
            ActionChip(label: Text('Medium Size AutoHide'),onPressed: (){
              BDialog().showBDialog(context, DialogType.info,DialogSize.medium,'Welcome To BDialog', description,timeOut: Duration(seconds: 3));
            },),
            ActionChip(label: Text('Min Size AutoHide'),onPressed: (){
              BDialog().showBDialog(context, DialogType.info,DialogSize.min,'Welcome To BDialog', description, timeOut: Duration(seconds: 3));
            },),
            ActionChip(label: Text('Tiny Size AutoHide'),onPressed: (){
              BDialog().showBDialog(context, DialogType.info,DialogSize.tiny,'Welcome To BDialog', description, timeOut: Duration(seconds: 3));
            },)
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

```

## Components
### AvatarBDialog
|   Property    |                                    Action                                    |  Required  |   Type   |
|:-------------:|:----------------------------------------------------------------------------:|:----------:|:--------:|
|     Size      |                             set the avatar Size                              |    Yes     |  double  |
|     Child     |                               Widget content's                               |    Yes     |  Widget  |
|  MarginColor  |                           Set the Background Color                           |     No     |  Color   |
|    Padding    |  Used to created space between the widget content's and the widget's border  |     No     |  double  |

#### How To Use
* AvatarBDialog without Padding and Color
``` Flutter
//AvatarBDialog without padding
AvatarBDialog(size: 200, child: Image.network(
                'https://picsum.photos/250?image=9'),)

```
* AvatarBDialog with Padding and Color
``` Flutter
      AvatarBDialog(size: 200,color: Colors.green,padding:15 , child: Image.network(
                        'https://picsum.photos/250?image=9')      
```
* AvatarBDialog with Padding
``` Flutter
      AvatarBDialog(size: 200,padding:15 , child: Image.network(
                        'https://picsum.photos/250?image=9')      
```
* AvatarBDialog with  Color
``` Flutter
      AvatarBDialog(size: 200,color: Colors.green, child: Image.network(
                        'https://picsum.photos/250?image=9')      
```
### BDialog


|     Name      |                               Action                                | Required |    Type    |
|:-------------:|:-------------------------------------------------------------------:|:--------:|:----------:|
|     size      |           set the dialog  Size (**tiny,min,medium,max**)            |   Yes    | DialogSize |
|     type      |    set the type of Dialog      (**message,info,error,warning**)     |   Yes    | DialogType |
|   HideType    |        Set the type of Option Buttons (**none,btnOk,yesNo**)        |    No     |  HideType  |
|    timeOut    | Create Dialog that's dismiss automatically when the timeout happens |    No     |  Duration  |
|     title     |                        Set The dialog title                         |   Yes    |   String   |
|  description  |                     Set the dialog Description                      |   Yes    |   String   |
|   okAction    |                       Customize the Ok Action                       |    No    | Function() |
| option1Action |         Change Default option 1 action with a custom Action         |    No    | Function() |
| option2Action |         Change Default option 2 action with a custom Action         |    No    | Function() |
|    okText     |                       Customize the Ok title                        |    No    |   String   |
|  option1Text  |                Customize the text of action button 1                |    No    |   String   |
|  option2Text  |                Customize the text of action button 2                |    No    |   String   |
|  customIcon   |                         Customize the Icon                          |    No    |   Widget   |
|   iconSize    |                        set The size of Icon                         |    No    |   String   |
|  option1Icon  |           Change Default option 1 icon with a custom Icon           |    No    |  IconData  |
|  option2Icon  |           Change Default option 2 icon with a custom Icon           |    No    |  IconData  |
| option1Color  |          Change Default option 1 Color with a custom Color          |    No    |   Color    |
| option2Color  |          Change Default option 1 Color with a custom Color          |    No    |   Color    |

#### How To Use

* Normal Dialog With Max Size

``` Flutter
  BDialog().showBDialog(context, DialogType.info,DialogSize.max,'Welcome To BDialog', description,); 
```

![Maximun Size](https://github.com/DecksPlayer/BDialog/blob/master/assets/3.png)


* Normal Dialog With Medium Size

``` Flutter
  BDialog().showBDialog(context, DialogType.info,DialogSize.medium,'Welcome To BDialog', description, );

```
* Normal Dialog With Minimum Size

``` Flutter
 BDialog().showBDialog(context, DialogType.info,DialogSize.min,'Welcome To BDialog', description,);

```
* Normal Dialog With tiny Size

``` Flutter
 BDialog().showBDialog(context, DialogType.info,DialogSize.tiny,'Welcome To BDialog', description,);

```     
![Tiny Size](https://github.com/DecksPlayer/BDialog/blob/master/assets/4.png)

 * Auto Hide Example  

 ``` Flutter
   BDialog().showBDialog(context, DialogType.info,DialogSize.max,'Welcome To BDialog', description, timeOut: Duration(seconds: 30));

```     


* Two Options Example

  ``` Flutter
   BDialog().showBDialog(context, DialogType.info,DialogSize.max,'Welcome To BDialog', description, action: HideType.twoActionsButton);

  ```
  ![Two Options](https://github.com/DecksPlayer/BDialog/blob/master/assets/1.png)
