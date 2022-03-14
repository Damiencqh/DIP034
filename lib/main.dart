import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Home()
    );
  }
}

class Home extends  StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> tutName = ["Peter", "Tony", "Banner", "Steve", "Bruce", "Clark"]; //implement database
  List<String> description = ["EE1","EE2","EE3","EE4","EE5","EE6"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("NTutors Listings"),
          backgroundColor: Colors.greenAccent,
        ),

        body: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [

                Container(
                    height: 500,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: tutName.map((names) {
                        return box(names, Colors.green);
                      }).toList(),

                    )
                ),

                Container(
                    height: 100,
                    child: ElevatedButton(
                      child: const Text(
                        'Add Listing',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {},  // ADD listing Nav
                      style: ElevatedButton.styleFrom(

                          fixedSize: const Size(100, 150),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),

                    ),
                ),
                )

              ]
            )


        )
        );

  }

  Widget box(String name, Color backgroundcolor) {
    return Container(
        margin: EdgeInsets.all(10),
        width: 330,
        color: Colors.blueGrey,

        child:
            Column(
              children: [

               ElevatedButton(
                child:
                  Text(name),

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondRoute()),
              );
            }
        ),
                 const Text(''), // space
                const Text('Available to Teach :',
                  style: TextStyle(
                    fontSize: 20,
                    color:Colors.white,
                  ),
                ),
                    Text(''), // for subjects to teach (variable)


]
            )
        );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'DUNO',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Year 4, Computer Science',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.yellow[500],
          ),
          const Text('4.8'),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'Report'),

        _buildButtonColumn(color, Icons.share, 'Share'),

        _buildButtonColumn(color, Icons.star, 'Rate'),
      ],
    );


    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'Year 4 in com sci NTU. I have a passion in teaching Coding please let me show you. '
            'Help me to help me help you. '  // Tutor Listing Description
        ,
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Tutor Listing Page',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: const Text('Tutor Listing'),
          automaticallyImplyLeading:true,
          leading: IconButton(icon: Icon(Icons.arrow_back_ios_new_outlined),
          onPressed:() => Navigator.pop(context, false),
          ),
        ),
        body: ListView(
          children: [
            Image.asset(
              'images/tutor.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
            Container(
              margin: EdgeInsets.all(25),
              child: OutlineButton(
                child: Text("Chat me up", style: TextStyle(fontSize: 20.0),),
                highlightedBorderColor: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: () {},  // input CHAT PAGE nav here
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
