import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft
    ]);

    return MaterialApp(
      title: 'Scrolable Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Scrolable Demo'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Activite> listActivites = [
    new Activite(nom : 'Velo', icone: Icons.directions_bike),
    new Activite(nom : 'Peinture', icone: Icons.palette),
    new Activite(nom : 'Golf', icone: Icons.golf_course),
    new Activite(nom : 'Arcade', icone: Icons.gamepad_outlined),
    new Activite(nom : 'Bricolage', icone: Icons.build),
    new Activite(nom : 'Velo', icone: Icons.directions_bike),
    new Activite(nom : 'Peinture', icone: Icons.palette),
    new Activite(nom : 'Golf', icone: Icons.golf_course),
    new Activite(nom : 'Arcade', icone: Icons.gamepad_outlined),
    new Activite(nom : 'Bricolage', icone: Icons.build),
    new Activite(nom : 'Velo', icone: Icons.directions_bike),
    new Activite(nom : 'Peinture', icone: Icons.palette),
    new Activite(nom : 'Golf', icone: Icons.golf_course),
    new Activite(nom : 'Arcade', icone: Icons.gamepad_outlined),
    new Activite(nom : 'Bricolage', icone: Icons.build),
  ];
  

  @override
  Widget build(BuildContext context) {

    var  isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    print(isPortrait);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: (isPortrait) ? Liste() : Grid()
      ),
    );
  }

  Widget Grid() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: listActivites.length,
        itemBuilder: (context, i){
          return new Container(
            margin: EdgeInsets.all(7.5),
            child: Card(
              elevation: 10,
              shadowColor: Colors.blue[900],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Activite : ', style: new TextStyle(color: Colors.blue, fontSize: 20)),
                  Icon(listActivites[i].icone, color: Colors.orangeAccent, size: 90,),
                  Text(listActivites[i].nom, style: TextStyle(color: Colors.deepOrange, fontSize: 30))
                ],
              ),
            ),
          );
        });
  }

  Widget Liste() {
    return ListView.builder(
      itemCount: listActivites.length,
      itemBuilder: (context, i){
        return new Dismissible(
          key: Key(listActivites[i].nom),
          child: InkWell(
            onTap: (() => print('Tapped')),
            onLongPress: (() => print('To loooooooooooong !!!')),
            child : new Container(
              height: 150,
              padding: EdgeInsets.only(right: 7.5, left: 7.5),
              child: Card(
                elevation: 5,
                shadowColor: Colors.blue[900],
                // borderOnForeground: false,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(listActivites[i].icone, size: 90, color: Colors.orangeAccent,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Activité : ', style: TextStyle(color: Colors.blue, fontSize: 20), textAlign: TextAlign.center,),
                          Text(listActivites[i].nom, style: TextStyle(color: Colors.deepOrange, fontSize: 30,), textAlign: TextAlign.center,)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          background: new Container(
            padding: EdgeInsets.only(right: 20),
            color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Supprimer', style: TextStyle(color: Colors.white),),
                Icon(Icons.delete, color: Colors.white,)
              ],
            ),
          ),
          onDismissed: (direction) {
            setState(() {
              print(listActivites[i].nom);
              listActivites.removeAt(i);
              print(listActivites.length);
            });
          },
        );
      },
    );
  }
}

class Activite {
  String nom;
  IconData icone;

  Activite({this.nom, this.icone});
}


