import 'package:flutter/material.dart';

class GameButs {
  String val;

  bool isShowing;
  //determines if the button is showing

  GameButs() {
    val = "";
    isShowing = false;
  }
}

void main() {
  runApp(TacToe());
}

class TacToe extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TacToeState();
  }
}

class TacToeState extends State<TacToe> {
  List<GameButs> gameButs;

  bool isHost = true;

  bool isGameOver=false;
  //determines if the game has ended

  void initGame(){
    isGameOver=false;
    isHost=true;
      gameButs = List<GameButs>();

        //fill it
        for (var i = 0; i < 9; i++) {
          gameButs.add(GameButs());
        }

        //instructs flutter to rebuild the widgets
        setState(() {
          
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //init the gameboard
    initGame();

    //calls method to initialize game
     
  }

  String checkWinner() {
    //returns winning letter

    if (gameButs[0].val == "X" &&
        gameButs[1].val == "X" &&
        gameButs[2].val == "X") {
      return "X";
    } else if (gameButs[3].val == "X" &&
        gameButs[4].val == "X" &&
        gameButs[5].val == "X") {
      return "X";
    } else if (gameButs[6].val == "X" &&
        gameButs[7].val == "X" &&
        gameButs[8].val == "X") {
      return "X";
    } else if (gameButs[0].val == "X" &&
        gameButs[3].val == "X" &&
        gameButs[6].val == "X") {
      return "X";
    } else if (gameButs[1].val == "X" &&
        gameButs[4].val == "X" &&
        gameButs[7].val == "X") {
      return "X";
    } else if (gameButs[2].val == "X" &&
        gameButs[5].val == "X" &&
        gameButs[8].val == "X") {
      return "X";
    } else if (gameButs[0].val == "X" &&
        gameButs[4].val == "X" &&
        gameButs[8].val == "X") {
      return "X";
    } else if (gameButs[2].val == "X" &&
        gameButs[4].val == "X" &&
        gameButs[6].val == "X") {
      return "X";
    } else if (gameButs[0].val == "0" &&
        gameButs[1].val == "0" &&
        gameButs[2].val == "0") {
      return "0";
    } else if (gameButs[3].val == "0" &&
        gameButs[4].val == "0" &&
        gameButs[5].val == "0") {
      return "0";
    } else if (gameButs[6].val == "0" &&
        gameButs[7].val == "0" &&
        gameButs[8].val == "0") {
      return "0";
    } else if (gameButs[0].val == "0" &&
        gameButs[3].val == "0" &&
        gameButs[6].val == "0") {
      return "0";
    } else if (gameButs[1].val == "0" &&
        gameButs[4].val == "0" &&
        gameButs[7].val == "0") {
      return "0";
    } else if (gameButs[2].val == "0" &&
        gameButs[5].val == "0" &&
        gameButs[8].val == "0") {
      return "0";
    } else if (gameButs[0].val == "0" &&
        gameButs[4].val == "0" &&
        gameButs[8].val == "0") {
      return "0";
    } else if (gameButs[2].val == "0" &&
        gameButs[4].val == "0" &&
        gameButs[6].val == "0") {
      return "0";
    }

    return "n/a";
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("Tic-Tac-Toe"),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: (){
                  initGame();
                },
              )
            ],
          ),
          body: Builder(
            builder: (context) {
              var textStyle = TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold);
              return Column(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                          itemCount: gameButs.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 2.0,
                            mainAxisSpacing: 2.0,
                          ),
                          itemBuilder: (context, i) {
                            return Center(
                              child: InkWell(
                                onTap: () {
                                  if(isGameOver==true){
                                    //game has ended
                                    return;
                                  }
                                  //since its empty we may claim
                                  if (gameButs[i].val.isEmpty) {
                                    print("Clicked on" + i.toString());
                                    setState(() {
                                      if (isHost) {
                                        gameButs[i].val = "X";
                                        isHost = false;
                                      } else {
                                        gameButs[i].val = "0";
                                        isHost = true;
                                      }
                                      gameButs[i].isShowing = true;
                                    });
                                  } else {
                                    print("already placed");
                                  }
                                  print("winnier=>" + checkWinner());

                                  if(checkWinner()=="X"){
                                    isGameOver=true;
                                    Scaffold.of(context).showSnackBar(
                                      SnackBar(
                                        content:Text("X Wins!")
                                      )
                                    );
                                  }else if(checkWinner()=="0"){
                                    isGameOver=true;
                                     Scaffold.of(context).showSnackBar(
                                      SnackBar(
                                        content:Text("0 Wins!")
                                      )
                                    );
                                  }
                                },
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  color: Colors.lightBlue,
                                  child: gameButs[i].isShowing == true
                                      ? Center(
                                          child: Text(
                                            gameButs[i].val,
                                            style: TextStyle(
                                                fontSize: 40,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      : Container(),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  Container(
                    color: Colors.yellowAccent,
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: isHost == true
                          ? Text(
                              "X",
                              style: textStyle,
                            )
                          : Text(
                              "0",
                              style: textStyle,
                            ),
                    ),
                  )
                ],
              );
            },
          )),
    );
  }
}
