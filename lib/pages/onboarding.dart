import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget{
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboaedingState();
}

class _OnboaedingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset("assets/images/background.jpg",fit: BoxFit.cover,
            ),
          ),
          Center(child: Image.asset("assets/images/logo.png"),),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(bottom:120 ),
                  height: 60,
                  width: MediaQuery.of(context).size.width/1.5,
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30)),
                  child: Center(child: Text("Start Playing", style: TextStyle(color: Colors.black,fontSize: 20,fontWeight:FontWeight.bold ))
                  ),
                  ),
              ),
            ],
          )
        ],
      ),),
    );
  }
}