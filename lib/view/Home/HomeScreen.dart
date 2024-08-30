import 'package:chatapp/controller/LoginController/LoginController.dart';
import 'package:chatapp/helper/LoginService/FireStorageService.dart';
import 'package:chatapp/helper/LoginService/Google_Sign_In_service.dart';
import 'package:chatapp/model/userModel.dart';
import 'package:chatapp/view/ChatScreen/ChatScreen.dart';
import 'package:chatapp/view/Login/LoginScreen/LoginPage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());

    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color(0xff2a2f35),
        color: const Color(0xff202328),

        items: const [
          Icon(CupertinoIcons.star, color: Colors.white),
          Icon(CupertinoIcons.clock, color: Colors.white),
          Icon(CupertinoIcons.macwindow, color: Colors.white),
          Icon(CupertinoIcons.circle_grid_3x3_fill, color: Colors.white),
          Icon(CupertinoIcons.settings, color: Colors.white),
        ],
      ),
      backgroundColor: const Color(0xff2a2f35),
      body: SingleChildScrollView(

        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(image: NetworkImage(GoogleSignInService.googleSignInSarvice.currentUser()?.photoURL??'https://pin.it/19HCjl8fu')
                          ,fit: BoxFit.cover)
                    ),
                  ),
                  const Text(
                    'Chats',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      color: const Color(0xff219fe6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      onPressed: () {
                        GoogleSignInService.googleSignInSarvice.emailLogout();
                        Get.toNamed("/login");
                      },
                      icon: const Icon(Icons.login, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Stack(
              children: [
                Container(
                  height: 250.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xff202328),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Text('Recents',
                            style: TextStyle(color: Colors.white)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Text('Favorites',
                            style: TextStyle(color: Colors.grey)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Text('Missed',
                            style: TextStyle(color: Colors.grey)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Container(
                    height: 750.sp,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: const Color(0xff2a2f35),
                    ),
                    child: StreamBuilder(
                      stream: UserService.userService.getUser(),
                      builder: (BuildContext context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              '${snapshot.error}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        var queryData = snapshot.data!.docs;
                        List users =
                        queryData.map((e) => e.data()).toList();
                        List<UserModel> userList =
                        users.map((e) => UserModel.fromJson(e)).toList();
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: userList.length,
                          itemBuilder: (BuildContext context, int index) => Padding(
                            padding: const EdgeInsets.only(left: 30, top: 10),
                            child: ListTile(
                              onTap: () {
                                loginController.getRecevier(
                                  userList[index].email!,
                                  userList[index].name!,
                                  userList[index].photourl!,
                                );
                                Get.toNamed("/chat");
                              },
                              leading: Container(
                                height: 50.h,
                                width: 50.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      userList[index].photourl ??
                                          'https://wallpapercave.com/wp/wp3323499.png',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              title: Text(
                                userList[index].name!,
                                style: const TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(
                                userList[index].email!,
                                style: const TextStyle(color: Color(0xff555a5e)),
                              ),
                            ),
                          ),
                        );

                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
