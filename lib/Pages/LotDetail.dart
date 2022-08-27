import 'package:flutter/material.dart';

class LotDetals extends StatelessWidget {
  const LotDetals({Key? key,required this.item}) : super(key: key);
  final List item;
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.grey[100],
          height:height ,
          width: width,
          child: Column(
            children: [
              Container(
              height: height*0.15,
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon:Icon(Icons.arrow_back_outlined,size: 30,) ),
                    Text(item[0]['Seller'].toString(),style: TextStyle(color: Colors.black,fontSize: height*0.04,fontWeight: FontWeight.bold),),
                    SizedBox()
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: width,
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
                            child: Text(item[0]["Seller"],style: TextStyle(color: Colors.grey,fontSize: height*0.03,fontWeight: FontWeight.bold),),

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
                                          Text(item[0]["Product"],style: TextStyle(color: Colors.black54,fontSize: height*0.025,fontWeight: FontWeight.bold),),
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
                                          Text(item[0]["Variety"],style: TextStyle(color: Colors.black54,fontSize: height*0.025,fontWeight: FontWeight.bold),),
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
                                        child: Center(child: Text("₹ "+item[0]["Price"].toString(),style: TextStyle(color: Colors.green,fontSize: height*0.03,fontWeight: FontWeight.bold),))

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
              ),

            ],

          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
        EdgeInsets.all(10.0),
        child: Container(
          height: 45,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Type a message to send",
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              // Send Button
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.send,

                  color: Colors.white,
                  size: 18,

                ),
                // backgroundColor: ColorConstant.lightBlueA100,
                elevation: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
