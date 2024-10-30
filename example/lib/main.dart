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
            ActionChip(label: Text('Max Size Two Options Dialog'),onPressed: (){
              BDialog().showBDialog(context, DialogType.info,DialogSize.max,'Welcome To BDialog', description, action: HideType.twoActionsButton);
            },),
            ActionChip(label: Text('Medium Size Two Options Dialog'),onPressed: (){
              BDialog().showBDialog(context, DialogType.info,DialogSize.medium,'Welcome To BDialog', description,action: HideType.twoActionsButton);
            },),
            ActionChip(label: Text('Min Size Two Options Dialog '),onPressed: (){
              BDialog().showBDialog(context, DialogType.info,DialogSize.min,'Welcome To BDialog', description,action: HideType.twoActionsButton);
            },),
            ActionChip(label: Text('Tiny Size Two Options Dialog'),onPressed: (){
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
