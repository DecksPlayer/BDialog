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
      title: 'Flutter Demo',
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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

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
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ActionChip(label:Text('Show Informacion'),onPressed: (){
              bDialog().showBigDialog(context, dialogType.info,'Information','That is an Information Dialog',true,Duration(seconds: 3));
            },),
            ActionChip(label:Text('Show Error'),onPressed: (){
              bDialog().showMediumDialog(context, dialogType.error,'Alert','Something Is Wrong',false,Duration(seconds: 3)
              );
            },),
            ActionChip(label:Text('Show Message'),onPressed: (){
              bDialog().showSmallDialog(context, dialogType.message,'Message', 'Can you read this message?',false,Duration(seconds: 3)
              );
            },),
            ActionChip(label:Text('Show Warning'),onPressed: (){
              bDialog().showTinyDialog(context, dialogType.warning,'Warning', 'Something is wrong',false,Duration(seconds: 3)
              );
            },),


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
``` Flutter
//AvatarBDialog without padding
AvatarBDialog(size: 200, child: Image.network(
                'https://picsum.photos/250?image=9'),)

```

``` Flutter
            //Big Dialog
              bDialog().showBigDialog(context, dialogType.info,'Information','That is an Information Dialog',true,Duration(seconds: 3));
            //Medium Dialog
              bDialog().showMediumDialog(context, dialogType.error,'Alert','Something Is Wrong',false,Duration(seconds: 3));
           // Small Dialog
              bDialog().showSmallDialog(context, dialogType.message,'Message', 'Can you read this message?',false,Duration(seconds: 3));
           // Tiny Dialog
              bDialog().showTinyDialog(context, dialogType.warning,'Warning', 'Something is wrong',false,Duration(seconds: 3)  );
            
```
* **dialogType** Type of Dialog
* **autoDismiss** Hide Dialog automatically