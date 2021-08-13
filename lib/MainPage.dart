import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'ProfilePage.dart';


// void main() => runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MainMenu(),
//     )
// );

class MainPage extends StatelessWidget {
  int currentIndex = 0;
  final screens = [
    //ProfilePage();
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue.shade700,
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 5.0),
                child: IconButton(
                  onPressed: () {
                  },
                  icon: Icon(Icons.notifications_none),
                  iconSize: 25,
                ),
              ),
            ]
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                // decoration: BoxDecoration(
                //   color: Colors.blue.shade700,
                // ),
                accountName: Text(
                  "Feed",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                // accountEmail: Text(
                //   " agroguru@gmail.com",
                //   style: TextStyle(
                //     fontSize: 16.0,
                //   ),
                // ),
                currentAccountPicture:
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text("F",
                    style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.blue.shade700),
                  ),
                ),
              ),
              SizedBox(
                  height: 20.0
              ),
              ListTile(
                title: Text('Explore',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                leading: Icon(Icons.explore),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Message',
                    style: TextStyle(
                      fontSize: 16.0,
                    )
                ),
                leading: Icon(Icons.message),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Notifications',
                  style: TextStyle(
                      fontSize: 16.0),
                ),
                leading: Icon(Icons.notifications),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Photos',
                  style: TextStyle(
                      fontSize: 16.0
                  ),
                ),
                leading: Icon(Icons.image),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Videos',
                    style: TextStyle(
                        fontSize: 16.0)),
                leading: Icon(Icons.video_settings),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Places',
                  style: TextStyle(
                      fontSize: 16.0
                  ),
                ),
                leading: Icon(Icons.place_sharp),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Settings',
                  style: TextStyle(
                      fontSize: 16.0
                  ),
                ),
                leading: Icon(Icons.settings),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Search',
                  style: TextStyle(
                      fontSize: 16.0
                  ),
                ),
                leading: Icon(Icons.search),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              // const Divider(
              //   color: Colors.blueGrey,
              //   height: 90,
              //   thickness: 2,
              //   indent: 22,
              //   endIndent: 35,
              // ),
              // ListTile(
              //   title: Text('Log Out',
              //     style: TextStyle(
              //         fontSize: 16.0
              //     ),
              //   ),
              //   leading: Icon(Icons.logout),
              //   onTap: () {
              //     Navigator.pop(context);
              //   },
              // ),
            ],
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(child: ListView.builder(
                    itemCount: 25,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ListTile(
                  title: Text("List"),
                )))
              ],
            ),
          ),
        ),
        //extendBody: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) => currentIndex = index,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
                backgroundColor: Colors.blue.shade700
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                title: Text('notification'),
                backgroundColor: Colors.blue.shade700
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.maps_ugc),
                title: Text('map'),
                backgroundColor: Colors.blue.shade700
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text('person'),
                backgroundColor: Colors.blue.shade700
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                title: Text('settings'),
                backgroundColor: Colors.blue.shade700
            ),
          ],
        ),
    );
  }
}
