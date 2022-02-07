

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class CustomDialogs{


  static Widget showMessageDialogSheet(context, String message,{String title = "Great!", String buttonText = "Okay", required Function() callback,
    bool showSecondButton=false, String secondButtonText = "Okay",required Function() secondButtonCallback}) {
    // flutter defined function
    return Container(
      height: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        //color: const Color(0xFF66BB6A),
        boxShadow: [BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          blurRadius: 30.0,
        ),],
        borderRadius: BorderRadius.only(topRight:  Radius.circular(16), topLeft:Radius.circular(16)),
      ),
      margin: EdgeInsets.only(top: 100),
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child:  Column(
          children: [
            Container(
              height: 100,
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              alignment: Alignment.center,
              child:  Lottie.asset("/success.json",repeat: false),
            ),
            SizedBox(height: 16,),
            Container(
              alignment: Alignment.center,
              child: Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24.0,color: Color(0xFF093E9E),)),
            ),
            SizedBox(height: 16,),
            Container(
              height: 40,
              padding: EdgeInsets.only(left: 20,right: 20),
              alignment: Alignment.center,
              child: Text(message,maxLines: 3,textAlign: TextAlign.center,overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0,color: Colors.black,),),
            ),
            SizedBox(height: 40,),
            Container(
              alignment: Alignment.bottomCenter,
              height: 46,
              padding: EdgeInsets.only(left: 20,right: 20),
              width: MediaQuery.of(context).size.width,
              child: Material(//Wrap with Material
                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(6.0) ),
                elevation: 2.0,
                clipBehavior: Clip.antiAlias, // Add This
                child: MaterialButton(
                  height: 46,
                  minWidth: MediaQuery.of(context).size.width,
                  color: Color(0xFF093E9E),
                  child: Text(buttonText,
                      style: new TextStyle(fontSize: 16.0, color: Colors.white)),
                  onPressed: (){
                    if(callback!=null){
                      callback();
                    }
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
           Visibility(
             visible: showSecondButton,
             child:  InkWell(
             child: Container(
               padding: EdgeInsets.only(left: 20,right: 20, top: 24, bottom: 8),
               alignment: Alignment.center,
               child: Text(secondButtonText,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0,color: Color(0xFF093E9E),)),
             ),
             onTap: (){
               if(secondButtonCallback!=null){
                 secondButtonCallback();
               }
               Navigator.pop(context);
             },
           ),),
            Visibility(
              visible: showSecondButton,
              child: Container(
              child: SizedBox(height: 16,),
            ),)
          ],
        ),
      ),
    );
  }

  static Widget showErrorDialogSheet(context, String message,{String title = "Oops!",  required Function() callback}) {
    // flutter defined function
    return Container(
      height: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        //color: const Color(0xFF66BB6A),
        boxShadow: [BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          blurRadius: 30.0,
        ),],
        borderRadius: BorderRadius.only(topRight:  Radius.circular(16), topLeft:Radius.circular(16)),
      ),
      margin: EdgeInsets.only(top: 100),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            height: 100,
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            alignment: Alignment.center,
            child:  Lottie.asset(""),
          ),
          // SizedBox(height: 16,),
          // Container(
          //   alignment: Alignment.center,
          //   child: Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24.0,color: Color(0xFF093E9E),)),
          // ),
          SizedBox(height: 16,),
          Expanded(child: Container(
            padding: EdgeInsets.only(left: 20,right: 20),
            alignment: Alignment.center,
            child: Text(message,maxLines: 3, textAlign: TextAlign.center,overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.0,color: Colors.red),),
          ),),
          SizedBox(height: 24,),
          Container(
            alignment: Alignment.bottomCenter,
            height: 46,
            padding: EdgeInsets.only(left: 20,right: 20),
            width: MediaQuery.of(context).size.width,
            child: Material(//Wrap with Material
              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(6.0) ),
              elevation: 2.0,
              clipBehavior: Clip.antiAlias, // Add This
              child: MaterialButton(
                height: 46,
                minWidth: MediaQuery.of(context).size.width,
                color: Color(0xFF093E9E),
                child: Text('Retry',
                    style: new TextStyle(fontSize: 16.0, color: Colors.white)),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          InkWell(
            child: Container(
              padding: EdgeInsets.only(left: 20,right: 20, top: 24, bottom: 8),
              alignment: Alignment.center,
              child: Text("Cancel",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0,color: Color(0xFF093E9E),)),
            ),
            onTap: (){
              Navigator.pop(context);
            },
          ),
          Container(
            child: SizedBox(height: 16,),
          ),
        ],
      ),
    );
  }


  static void showExitDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.only(left: 24, right: 24,top: 16),
            title: Text("Exit"),
            content: Text("Are you sure you want to exit?"),
            actions: <Widget>[
              FlatButton(
                child: Text("Logout"),
                onPressed: () {
                  Navigator.of(context).pop();
                  //sharedBloc.changeSessionTimeOut(true);
                },
              ),
              FlatButton(
                child: Text("Exit"),
                onPressed: () {
                  exit(0);
                },
              )
            ],
          );
        }
    );
  }


}