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

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  List<String> tutName = ["EE1000", "EE2000", "EE3000", "EE4000", "EE5000", "EE6001"];//implement database
  // List<String> email = ["No Email","Park@e.ntu.edu.sg","Pete@e.ntu.edu.sg","Spid@e.ntu.edu.sg","Tony@e.ntu.edu.sg","Bruce@e.ntu.edu.sg","Banner@e.ntu.edu.sg"];
  //  List<String> contact =["No contact","90000001","90000002","90000003","90000004","90000005","90000006"];
  List<String> description = ["No tutor found for this mod",
    "Name: Peter \nEmail:Pete@gmail.com\n Contact: 20000001\n\n",
    "Name: Parker \nEmail:Park@gmail.com\n Contact: 90000002\n\n",
    "Name: Spid \nEmail:Spid@gmail.com\n Contact: 90000003\n\n",
    "Name: Chan \nEmail:Chan@gmail.com\n Contact: 90000004\n\n",
    "Name: Bruce \nEmail:Bruc@gmail.com\n Contact: 90000005\n\n",
    "Name: Banner \nEmail:Bann@gmail.com\n Contact: 90000006\n\n"];
  List<String> description2 = ["error no description found 2","Peter's description2",
    " Parker's description2","Spid's description2 ","EE4","EE5","EE6"];

  final myController = TextEditingController();

  @override

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Modules Listings"),
          backgroundColor: Colors.greenAccent,
        ),

        body: Container(
            color: Colors.teal,
            padding: EdgeInsets.all(20),
            child: Column(
                children: [
                  //Column(
                  //  height: 50,
                  // ),

                  Container(

                    height:40,
                    padding: EdgeInsets.all(12),
                    child: TextField(

                      controller: myController,
                      // String input = myController.text,

                    ),
                  ),

                  Container (
                      height: 500,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.orangeAccent,
                            width: 10,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: ListView (
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
        width: 310,
        color: Colors.blueGrey,


        child:
        Column(


            children: [

              ElevatedButton(
                  child:
                  Text(name),

                  onPressed: () {
                    // Navigator.push(
                    //  context,
                    // MaterialPageRoute(builder: (context) => const SecondRoute()),
                    //  );
                  }
              ),
              const Text(''), // space
              const Text('Tutors Available :',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),



              Text(
                    printText(name) //print tut listing with mod code input
                  ),




            ]
        ),

      );

              }


  Widget box2(String name, Color backgroundcolor) {
    return Container(
        margin: EdgeInsets.all(10),
        width: 280,
        color: backgroundcolor,

        child:
        ListView (
      scrollDirection: Axis.horizontal,
      children: tutName.map((names) {
        return box(names, Colors.green);
      }).toList(),

    )

    );
  }

  String printText (String name) {
    name=name;

    switch(name) {
      case 'EE1000':
        return description[1]+description[2]+description[3]+description[4]+description[5];

      case 'EE2000':
        return description[2]+description[3]+description[1]+description[2];

      case 'EE3000':
        return description[5]+description[1]+description[2];

      case 'EE4000':
        return description[2]+description[5];

      case 'EE5000':
        return description[3];

      default:
        return description[0]; // If name not found in list display error message
    }
  }

  int desCheck (String name) {
    name=name;

    switch(name) {
      case 'Peter':
        return 1;

      case 'Parker':
        return 2;

      case 'Spid':
        return 3;

      default:
        return 0; // If name not found in list display error message
    }
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
                    'Peter',
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
