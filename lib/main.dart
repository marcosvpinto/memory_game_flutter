import 'package:flutter/material.dart';
import 'package:memory_game/data/data.dart';
import 'package:memory_game/model/tile_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memory Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  void initState() {
    super.initState();
    restart();
  }

  void restart(){
    pairs = getPairs();
    pairs.shuffle();
    visiblePairs = pairs;
    selected = true;

    Future.delayed(const Duration(seconds: 5), (){
      setState(() {
        visiblePairs = getQuestionPairs();
        selected = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jogo da Memória", style: TextStyle(
          
        ),), 
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 1500),
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Column(
            children: <Widget>[
              SizedBox(height: 40,),
              points != 800 
              ? 
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("$points/800", 
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  Text("Points", 
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20, 
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ) 
              : 
              Container(),
              SizedBox(height: 20,),
              points != 800 
              ? 
              GridView(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisSpacing: 0.0,
                  maxCrossAxisExtent: 100.0,
                ),
                children: List.generate(visiblePairs.length, (index){
                  return Tile(
                    imagetAssetPath: visiblePairs[index].getImageAssetPath(), 
                    titleIndex: index,
                    parent: this,
                    );
                }),
              ) 
              :
              AnimatedContainer(
                duration: Duration(milliseconds: 1500),
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          points = 0;
                          restart();
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 1500),
                        height: 50,
                        width: 200,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Text("Replay", style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500
                        ),),
                      ),
                    ),
                    SizedBox(height: 20,),
                    GestureDetector(
                      onTap: (){
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 1500),
                        height: 50,
                        width: 200,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Text("Rate Us", style: TextStyle(
                          color: Colors.blue,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        )
      )
    );
  }
}

class Tile extends StatefulWidget {
  
  String imagetAssetPath;
  int titleIndex;
  _HomePageState parent;
  
  Tile({this.imagetAssetPath, this.parent, this.titleIndex});

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(!selected){
          setState(() {
            pairs[widget.titleIndex].setIsSelected(true);
          });
          if(selectedImageAssetPath != ""){
            if(selectedImageAssetPath == pairs[widget.titleIndex].getImageAssetPath()){
              print("add point");
              points = points + 100;
              TileModel tileModel = new TileModel();
              selected = true;
              Future.delayed(const Duration(seconds: 2), (){
                tileModel.setImageAssetPath("");
                pairs[widget.titleIndex] = tileModel;
                pairs[selectedTileIndex] = tileModel;
                this.widget.parent.setState(() { });
                setState(() {
                  selected = false;
                });
                // widget.parent.setState(() {
                //   pairs[widget.titleIndex].setImageAssetPath("");
                //   pairs[selectedTileIndex].setImageAssetPath("");
                // });
                selectedImageAssetPath = "";
              });
            } else {
              print("wrong choice");
              selected = true;
              Future.delayed(const Duration(seconds: 2), (){
                widget.parent.setState(() {
                  pairs[widget.titleIndex].setIsSelected(false);
                  pairs[selectedTileIndex].setIsSelected(false);
                });
                setState(() {
                  selected = false;
                });
              });
              selectedImageAssetPath = "";
            }
          } else {
            selectedTileIndex = widget.titleIndex;
            selectedImageAssetPath = pairs[widget.titleIndex].getImageAssetPath();
          }
          // setState(() {
          //   pairs[widget.titleIndex].setIsSelected(true);
          // });
        }
      },
      child: Container(
        margin: 
          EdgeInsets.all(5),
        child: 
          pairs[widget.titleIndex].getImageAssetPath() == "" 
            ? 
            Container(
              color: Colors.white,
              child: Image.asset("assets/correct.png"), 
            )
            : 
            Image.asset(
              pairs[widget.titleIndex].getIsSelected() 
                ? 
                pairs[widget.titleIndex].getImageAssetPath() 
                : 
                widget.imagetAssetPath
            ),
      ),
    );
  }
}