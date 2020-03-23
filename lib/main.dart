import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
    theme: ThemeData(accentColor: Colors.blueGrey),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController eCtr = TextEditingController();
  TextEditingController eCtr1 = TextEditingController();
  bool showDialog = false;
  List<String> textList = [];
  List<String> textList1 = [];
  List<bool> textCheckBox = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white38,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "To-Do List",
                style: TextStyle(
                  fontFamily: 'Raleway',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.list,
                color: Colors.black,
              )
            ],
          ),
        ),

      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        onPressed: () {
          setState(() {
            showDialog = true;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueGrey,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.black,
              ),
              onPressed: () {
                int counter = 0;
                while (counter < textList.length) {
                  if (textCheckBox[counter] == true) {
                    textCheckBox.removeAt(counter);
                    textList.removeAt(counter);
                    textList1.removeAt(counter);
                    counter = 0;
                  } else {
                    counter++;
                  }
                  setState(() {});
                }
              },
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            )
          ],
        ),
      ),
      body: Column(
        children: <Widget>[

          showDialog == true
              ? AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
            ),
            backgroundColor: Colors.white60,
                  title: Text("New",
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  content: Column(
                    children: <Widget>[
                      TextField(
                        controller: eCtr,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintText: 'Title',
                          hintStyle: TextStyle(
                              fontFamily: 'Raleway',
                          ),
                        ),
                        maxLines: 1,
                        onSubmitted: (String text) {},
                      ),
                      SizedBox(height: 0.6,),
                      TextField(
                        controller: eCtr1,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)
                          ),
                          hintText: 'Details',
                          hintStyle: TextStyle(
                            fontFamily: 'Raleway',
                          ),
                        ),
                        maxLines: 3,
                        onSubmitted: (String text) {},
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)
                      ),
                      color: Colors.blueGrey,
                        onPressed: () {
                          setState(() {
                            showDialog = false;
                            textList.add(eCtr.text);
                            textList1.add(eCtr1.text);
                            textCheckBox.add(false);
                            eCtr.clear();
                            eCtr1.clear();
                          });
                        },
                        child: Text(
                          "Add",
                          style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.bold,
                            fontFamily: 'Raleway'
                          ),
                        )),
                    FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        color: Colors.blueGrey,
                        onPressed: () {
                          setState(() {
                            showDialog = false;
//                        textList.add(eCtr.text);
//                        textList1.add(eCtr1.text);
//                        textCheckBox.add(false);
                            eCtr.clear();
                            eCtr1.clear();
                          });
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.bold,
                            fontFamily: 'Raleway'
                          ),
                        )
                    ),
                  ],
                )
              : Text(""),
//          Text(
//            "My list",
//            style: TextStyle(
//                fontFamily: 'Raleway',
//                fontWeight: FontWeight.bold,
//                fontSize: 30.0),
//          ),
//          SizedBox(height: 10.0,),
          Flexible(
            child: ListView.builder(
                itemCount: textList.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 70.0,
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      border: Border.all(width: 0.2),
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                    child: Row(
                      children: <Widget>[
                        Checkbox(
                          activeColor: Colors.blueGrey,
                          checkColor: Colors.black,
                          value: textCheckBox[index],
                          onChanged: (bool newValue) {
                            textCheckBox[index] = newValue;
                            setState(() {});
                          },
                        ),
                        Expanded(
                          child: Container(
                            height: 70.0,
                            // decoration: ,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  textList[index],
                                  style: TextStyle(
                                      fontFamily: 'Raleway',
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                  color: Colors.red
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    textList1[index],
                                    style: TextStyle(
                                      fontFamily: 'Raleway',
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              child: Wrap(
//                               spacing: 5.0,
//                               runSpacing: 3.0,
                                children: <Widget>[
                                  filterChipWidget(
                                    chipName: 'pending',
                                  ),
                                  filterChipWidget(
                                    chipName: 'completed',
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class filterChipWidget extends StatefulWidget {
  final String chipName;

  filterChipWidget({Key key, this.chipName}) : super(key: key);

  @override
  _filterChipWidgetState createState() => _filterChipWidgetState();
}

class _filterChipWidgetState extends State<filterChipWidget> {
  var _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(widget.chipName),
      selected: _isSelected,
      onSelected: (isSelected) {
        setState(() {
          _isSelected = isSelected;
        });
      },
      selectedColor: Colors.blueGrey,
    );
  }
}
