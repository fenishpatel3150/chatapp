import 'package:chatapp/controller/LoginController/LoginController.dart';
import 'package:chatapp/helper/LoginService/FireStorageService.dart';
import 'package:chatapp/helper/LoginService/Google_Sign_In_service.dart';
import 'package:chatapp/view/ChatScreen/ChatScreen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    LoginController loginController =Get.put(LoginController());
    loginController.getUserDetail();
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color(0xff2a2f35),
        color: Color(0xff202328),
        onTap: (index)
        {

        },
        items: [
        Icon(CupertinoIcons.star,color: Colors.white,),
        Icon(CupertinoIcons.clock,color: Colors.white,),
        Icon(CupertinoIcons.macwindow,color: Colors.white,),
        Icon(CupertinoIcons.circle_grid_3x3_fill,color: Colors.white,),
        Icon(CupertinoIcons.settings,color: Colors.white,),
      ],

      ),
      backgroundColor: Color(0xff2a2f35),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(image: AssetImage("")),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                  Text('Chats',style: TextStyle(color: Colors.white,fontSize: 20),),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Color(0xff219fe6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      onPressed: ()
                      {

                      }, icon: Icon(Icons.add,color: Colors.white,),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Stack(
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xff202328),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Text('Recents',style: TextStyle(color: Colors.white),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Text('Favorites',style: TextStyle(color: Colors.grey),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Text('Missed',style: TextStyle(color: Colors.grey),),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Container(
                    height: 750,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Color(0xff2a2f35),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30),
                          child: InkWell(
                            onTap: ()
                            {
                              Get.to(ChatScreen());
                            },
                            child: ListTile(
                              leading: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)
                                ),
                              ),
                              title: Text("${loginController.name}",style: TextStyle(color: Colors.white),),
                              subtitle: Text("${loginController.email}",style: TextStyle(color: Color(0xff555a5e)),),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
