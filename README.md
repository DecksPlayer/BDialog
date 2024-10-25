# bdialog

Create Stetics dialogs

## Getting Started

With this project you can create beautifully dialogs that show information

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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView(
          children: <Widget>[
            Center(child:
            AvatarBDialog(size: 200, child: Image.network(
                'https://picsum.photos/250?image=9'),)),
            Center(child:
            AvatarBDialog(size: 100, child: Text('Hello'))),

            ActionChip(label: Text('Max Size'),onPressed: (){
              BDialog().showBDialog(context, DialogType.info,DialogSize.max,'Welcome To BDialog', description, false,Duration(seconds: 3));
            },),
            ActionChip(label: Text('Medium Size'),onPressed: (){
              BDialog().showBDialog(context, DialogType.info,DialogSize.medium,'Welcome To BDialog', description, false,Duration(seconds: 3));
            },),
            ActionChip(label: Text('Min Size'),onPressed: (){
              BDialog().showBDialog(context, DialogType.info,DialogSize.min,'Welcome To BDialog', description, false,Duration(seconds: 3));
            },),
            ActionChip(label: Text('Tiny Size'),onPressed: (){
              BDialog().showBDialog(context, DialogType.info,DialogSize.tiny,'Welcome To BDialog', description, false,Duration(seconds: 3));
            },),
            ActionChip(label: Text('Max Size Yes No'),onPressed: (){
              BDialog().showBDialog(context, DialogType.info,DialogSize.max,'Welcome To BDialog', description, false,Duration(seconds: 3),action: HideType.yesNo);
            },),
            ActionChip(label: Text('Medium Size Yes No'),onPressed: (){
              BDialog().showBDialog(context, DialogType.info,DialogSize.medium,'Welcome To BDialog', description, false,Duration(seconds: 3),action: HideType.yesNo);
            },),
            ActionChip(label: Text('Min Size Yes No'),onPressed: (){
              BDialog().showBDialog(context, DialogType.info,DialogSize.min,'Welcome To BDialog', description, false,Duration(seconds: 3),action: HideType.yesNo);
            },),
            ActionChip(label: Text('Tiny Size Yes No'),onPressed: (){
              BDialog().showBDialog(context, DialogType.info,DialogSize.tiny,'Welcome To BDialog', description, false,Duration(seconds: 3),action: HideType.yesNo);
            },),
            ActionChip(label: Text('Max Size AutoHide'),onPressed: (){
              BDialog().showBDialog(context, DialogType.info,DialogSize.max,'Welcome To BDialog', description, true,Duration(seconds: 3),action: HideType.yesNo);
            },),
            ActionChip(label: Text('Medium Size AutoHide'),onPressed: (){
              BDialog().showBDialog(context, DialogType.info,DialogSize.medium,'Welcome To BDialog', description, true,Duration(seconds: 3));
            },),
            ActionChip(label: Text('Min Size AutoHide'),onPressed: (){
              BDialog().showBDialog(context, DialogType.info,DialogSize.min,'Welcome To BDialog', description, true,Duration(seconds: 3));
            },),
            ActionChip(label: Text('Tiny Size AutoHide'),onPressed: (){
              BDialog().showBDialog(context, DialogType.info,DialogSize.tiny,'Welcome To BDialog', description, true,Duration(seconds: 3));
            },)
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


```
## Custom Component
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


|    Name     |                                    Action                                    | Required |    Type    |
|:-----------:|:----------------------------------------------------------------------------:|:--------:|:----------:|
|    size     |                set the dialog  Size (**tiny,min,medium,max**)                |   Yes    | DialogSize |
|    type     |         set the type of Dialog      (**message,info,error,warning**)         |   Yes    | DialogType |
|  HideType   |            Set the type of Option Buttons (**none,btnOk,yesNo**)             |   Yes    |  HideType  |
|    title    |                             Set The dialog title                             |   Yes    |   String   |
| description |                          Set the dialog Description                          |   Yes    |   String   |
|  okAction   |                           Customize the Ok Action                            |    No    | Function() |
|  yesAction  |                           Customize the Yes Action                           |    No    | Function() |
|  noAction   |                           Customize the No Action                            |    No    | Function() |
|   okText    |                            Customize the Ok title                            |    No    |   String   |
|   yesText   |                           Customize the Yes title                            |    No    |   String   |
|   noText    |                            Customize the No title                            |    No    |   String   |
| customIcon  |                              Customize the Icon                              |    No    |   Widget   |
|  iconSize   |                             set The size of Icon                             |    No    |   String   |

#### How To Use

* Normal Dialog With Max Size
``` Flutter
     ActionChip(label: Text('Max Size'),onPressed: (){
              BDialog().showBDialog(context, DialogType.info,DialogSize.max,'Welcome To BDialog', description, false,Duration(seconds: 3));
            },),   
```
* Normal Dialog With Medium Size
``` Flutter
     ActionChip(label: Text('Medium Size'),onPressed: (){
              BDialog().showBDialog(context, DialogType.info,DialogSize.medium,'Welcome To BDialog', description, false,Duration(seconds: 3));
            },),
```
* Normal Dialog With Minimum Size
``` Flutter
         ActionChip(label: Text('Min Size'),onPressed: (){
              BDialog().showBDialog(context, DialogType.info,DialogSize.min,'Welcome To BDialog', description, false,Duration(seconds: 3));
            },),
```
* Normal Dialog With tiny Size
``` Flutter
       ActionChip(label: Text('Tiny Size'),onPressed: (){
              BDialog().showBDialog(context, DialogType.info,DialogSize.tiny,'Welcome To BDialog', description, false,Duration(seconds: 3));
            },),
```          
 * Auto Hide Example           
 ``` Flutter
     ActionChip(label: Text('Max Size AutoHide'),onPressed: (){
              BDialog().showBDialog(context, DialogType.info,DialogSize.max,'Welcome To BDialog', description, true,Duration(seconds: 3),action: HideType.yesNo);
            },),
```     
* Yes No Example
  ``` Flutter
   ActionChip(label: Text('Max Size Yes No'),onPressed: (){
              BDialog().showBDialog(context, DialogType.info,DialogSize.max,'Welcome To BDialog', description, false,Duration(seconds: 3),action: HideType.yesNo);
            },),
```    
            