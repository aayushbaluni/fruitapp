import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruitapp/Pages/LotDetail.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _items = [];
  var _sortType=0;
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/Fruits.json');
    final data = await json.decode(response);
    setState((){
      _items=data;
      if(_sortType==0){
        _items.sort((a, b) => a.toString().compareTo(b.toString()));
      }
      if(_sortType==1){
        _items.sort((a, b) => a["Price"].compareTo(b["Price"]));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    setState((){
          readJson();
    });
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.grey[100],
        title: Text("Buy",style: TextStyle(color: Colors.black,fontSize: height*0.04,fontWeight: FontWeight.bold),),
      ),
      backgroundColor: Colors.grey[100],
      body:Container(
        height: height,
        width: width,
        child: Column(
          children: [
            SizedBox(
              height: height*0.03,
            ),


            //search bar
            Container(
              width: width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Container(
                    width: width*0.6,

                    decoration:BoxDecoration(
                        color: Colors.white,
                      border: Border.all(
                        color: Colors.black12,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))
                    ),
                    child: TextField(
                      decoration:InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        labelText: "Search",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                          border: InputBorder.none,
                      ),
                    ),
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  SizedBox(height: 10,),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(width:width,child: Text("Sort Type",style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.bold),)),
                                  ),
                                  ListTile(

                                    title: new Text('Name'),
                                    onTap: () {
                                      setState((){
                                        _sortType=0;
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    title: new Text('Price'),
                                    onTap: () {
                                      setState((){
                                        _sortType=1;
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),

                                ],
                              );
                            });
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.sort,
                            size: height*0.04,
                          ),
                          Center(
                           child: Text(
                             "Sort",
                             style: TextStyle(
                               color: Colors.black,
                               fontSize: height*0.018,
                             ),
                           ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height*0.02,),



            // row pannel
            Container(
              height: height*0.17 ,
              width: width,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:Row(
                  children:<Widget> [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0,bottom: 8.0,left: 20,right: 10),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Image.asset("assets/images/Apple.png"),
                            SizedBox(width: 0.01,),
                            Text("Apple",style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0,bottom: 8.0,left: 20,right: 10),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Image.asset("assets/images/grapes.png"),
                            SizedBox(width: 0.01,),
                            Text("Grapes",style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0,bottom: 8.0,left: 20,right: 10),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Image.asset("assets/images/grapes2.png"),
                            SizedBox(width: 0.01,),
                            Text("Grapes",style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0,bottom: 8.0,left: 20,right: 10),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Image.asset('assets/images/Lemon.png'),
                            SizedBox(width: 0.01,),
                            Text("Lemons",style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0,bottom: 8.0,left: 20,right: 10),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Image.asset('assets/images/Watermelon.png'),
                            SizedBox(width: 0.01,),
                            Text("Watermelon",style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height*0.01,
            ),
            _items.isNotEmpty
                ? Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (()=>{
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>LotDetals(item: [_items[index]]))
                      ),
                    }),

                    child: Card(
                      margin: const EdgeInsets.all(10),
                      child: Container(
                        height: height*0.3,
                        width: width*0.9,
                        decoration: BoxDecoration(
                            boxShadow: [BoxShadow(
                                color: Colors.black12,
                                blurRadius: 0.002,
                                spreadRadius: 0.003
                            )]
                        ),
                        child: Column(
                          children: [
                            Container(
                              height:height*0.08,
                              width: width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(_items[index]["Seller"],style: TextStyle(color: Colors.grey,fontSize: height*0.03,fontWeight: FontWeight.bold),),

                              ),
                            ),
                            Container(
                              width: width,
                              height: height*0.22,
                              color: Colors.yellow[200],
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          child: Column(
                                            children: [
                                              Text(_items[index]["Product"],style: TextStyle(color: Colors.black54,fontSize: height*0.025,fontWeight: FontWeight.bold),),
                                              Text("Product",style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10,
                                              ),),

                                            ],
                                          ),

                                        ),
                                        Container(
                                          child: Column(
                                            children: [
                                              Text(_items[index]["Variety"],style: TextStyle(color: Colors.black54,fontSize: height*0.025,fontWeight: FontWeight.bold),),
                                              Text("Variety",style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10,
                                              ),),
                                            ],
                                          ),

                                        ),
                                        Container(
                                          height: height*0.04,
                                          width: width*0.15,
                                          decoration: BoxDecoration(color: Colors.grey[50],
                                            borderRadius: BorderRadius.circular(20)

                                          ),
                                          child: Center(child: Text("₹ "+_items[index]["Price"].toString(),style: TextStyle(color: Colors.green,fontSize: height*0.03,fontWeight: FontWeight.bold),))

                                        ),

                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
                : Container()
          ],
        ),
      ) ,
    );
  }
}
