import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/pages/service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool  music = true, 
        Medium = false,
        Hard = false;

      String? question,answer;
      List<String> option = [];
  bool isLoading = true; // Add loading state
      @override
      void initState(){
        super.initState();
        fetchQuiz("music");
        RestOptions();
      }

        Future<void> fetchQuiz(String category) async{
          final  response = await http.get(Uri.parse('https://api.api-ninjas.com/v1/trivia?category'),
          headers: {
            'Content-Type' : 'application/json',
            'X-Api-Key':APIKEY,
          });

          if(response.statusCode==200){
            List<dynamic> jsonData = jsonDecode(response.body);
            if(jsonData.isNotEmpty){
              Map<String,dynamic> quiz = jsonData[0];
              question = quiz["question"];
              answer = quiz["answer"];
                        isLoading = false; // Update loading state

            }
            print(question);
            setState(() {});
          }
        }

        Future<void> RestOptions() async {
            final  response = await http.get(Uri.parse('https://api.api-ninjas.com/v1/randomword'),
          headers: {
            'Content-Type' : 'application/json',
            'X-Api-Key':APIKEY,
          });

          if(response.statusCode == 200){
            Map<String,dynamic> jsonData = jsonDecode(response.body);
            if(jsonData.isNotEmpty){
              String word = jsonData["word"].toString();
                option.add(word);
            }
            // recursive call
          if(option.length<3){
            RestOptions();
          }
          print(option);
            setState(() {});
          }
        }
            Future<void> RestOption() async {
            final  response = await http.get(Uri.parse('https://api.jsonserve.com/Uw5CrX'));
            if(response.statusCode == 200){
            print(response);
            setState(() {});
          }
        }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:option.length!=3? Center(child: CircularProgressIndicator()): Container(
          child: Stack(
            children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset("assets/images/background.jpg",fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 90,left: 10,),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                            music? Container(
                              margin: EdgeInsets.only(right: 20),
                              child: Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(30),
                                child: Container(
                                width: 120,
                                decoration: BoxDecoration(color: const Color.fromARGB(255, 240, 158, 35),borderRadius: BorderRadius.circular(30)),
                                child: Center(child: Text(
                                  "easy", 
                                  style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight:FontWeight.bold ),
                                  )
                                ),
                                                        ),
                              ),
                            ) : GestureDetector(
        
                          onTap: (){
                            music = true;
                            Medium = false;
                            Hard = false;
                            setState(() {
                              
                            });
                          },
                          child: Container(
                            width: 120,
                            margin: EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30)),
                            child: Center(child: Text(
                              "music ", 
                              style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight:FontWeight.bold ),
                              )
                                              ),
                                            ),
                        ),
                              Medium?   Container(
                              margin: EdgeInsets.only(right: 20),
                              child: Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(30),
                                child: Container(
                                width: 120,
                                decoration: BoxDecoration(color: const Color.fromARGB(255, 240, 158, 35),borderRadius: BorderRadius.circular(30)),
                                child: Center(child: Text(
                                  "Medium ", 
                                  style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight:FontWeight.bold ),
                                  )
                                ),
                                                        ),
                              ),
                            ) :GestureDetector(
                          onTap: (){
                            music = false;
                            Medium = true;
                            Hard = false;
                            setState(() {
                            });
                          },
                              child: Container(
                                    width: 120,
                                    margin: EdgeInsets.only(right: 20),
                                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30)),
                                    child: Center(child: Text("Medium", 
                                                              style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 20,
                                                              fontWeight:FontWeight.bold ),
                                                                          )
                                                      ),
                                                ),
                                      ),
        
                          Hard ?  Container(
                              margin: EdgeInsets.only(right: 20),
                              child: Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(30),
                                child: Container(
                                width: 120,
                                decoration: BoxDecoration(color: const Color.fromARGB(255, 240, 158, 35),borderRadius: BorderRadius.circular(30)),
                                child: Center(child: Text(
                                  "Hard", 
                                  style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight:FontWeight.bold ),
                                  )
                                ),
                                                        ),
                              ),
                            ) :
                          GestureDetector(
                          onTap: (){
                            music = false;
                            Medium = false;
                            Hard = true;
                            setState(() {
                              
                            });
                          },
                            child: Container(
                            width: 120,
                            margin: EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30)),
                            child: Center(child: Text(
                              "Hard", 
                              style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight:FontWeight.bold ),
                              )
                                  ),
                                    ),
                          )
        
                      ],
                    ),
                  ),
                  SizedBox(height: 80),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(right: 20,),
                    // height: MediaQuery.of(context).size.height/2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          SizedBox(height: 40),
                          Container(
                            width: MediaQuery.of(context).size.width/1.3,
                            child: Text(
                              // "who was the Midnight Rider ?",
                            question ?? "Loading question...", // Add null check
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                          ),
                      SizedBox(height: 40),
                          Container(
                            height: 50,
                            margin: EdgeInsets.only(left: 20,right: 20),
                            width: MediaQuery.of(context).size.width/1.3,
                            decoration: BoxDecoration(border: Border.all(color: Colors.black45,width: 2.0),borderRadius: BorderRadius.circular(30)),
                            child: Center(
                              child: Text(
                                // "Bill Gates",
                                option[0].replaceAll(RegExp(r'[\[\]]'), ""),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500
                              ),
                              ),
                            ),
                          ),
        
                        SizedBox(height: 30),
        
                          Container(
                            height: 50,
                            margin: EdgeInsets.only(left: 20,right: 20),
                            width: MediaQuery.of(context).size.width/1.3,
                            decoration: BoxDecoration(border: Border.all(color: Colors.black45,width: 2.0),borderRadius: BorderRadius.circular(30)),
                            child: Center(
                              child: Text(
                                // "Albert Einstien",
                        option[1].replaceAll(RegExp(r'[\[\]]'), ""),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500
                              ),
                              ),
                            ),
                          ),
                             SizedBox(height: 30),
        
                          Container(
                            height: 50,
                            margin: EdgeInsets.only(left: 20,right: 20),
                            width: MediaQuery.of(context).size.width/1.3,
                            decoration: BoxDecoration(border: Border.all(color: Colors.black45,width: 2.0),borderRadius: BorderRadius.circular(30)),
                            child: Center(
                              child: Text(
                                // "Neil ArmStrong",
                        option[2].replaceAll(RegExp(r'[\[\]]'), ""),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500
                              ),
                              ),
                            ),
                          ),
                             SizedBox(height: 30),
        
                          Container(
                            height: 50,
                            margin: EdgeInsets.only(left: 20,right: 20),
                            width: MediaQuery.of(context).size.width/1.3,
                            decoration: BoxDecoration(border: Border.all(color: Colors.black45,width: 2.0),borderRadius: BorderRadius.circular(30)),
                            child: Center(
                              child: Text(
                                // "Paul Davidson",
                              answer ?? "Loading answer...", // Add null check
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500
                              ),
                              ),
                            ),
                          ),
                    SizedBox(height: 30),
        
                        ],
                      ),
        
                  )
                ],
              ),
            )
            ],
          ),
        ),
    );
  }
}