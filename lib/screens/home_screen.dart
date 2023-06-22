import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:jeepney_web/screens/pages/jeepney_tab.dart';
import 'package:jeepney_web/screens/pages/map_page.dart';
import 'package:jeepney_web/screens/pages/passengers_page.dart';

import '../widgets/text_widget.dart';

class HomeScreen extends StatelessWidget {
  PageController page = PageController();
  SideMenuController page1 = SideMenuController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<SideMenuItem> items = [
      SideMenuItem(
          // Priority of item to show on SideMenu, lower value is displayed at the top
          priority: 0,
          title: 'Map',
          onTap: ((p0, p1) {
            page.jumpToPage(0);
            page1.changePage(0);
          })),
      SideMenuItem(
          // Priority of item to show on SideMenu, lower value is displayed at the top
          priority: 1,
          title: 'Jeepney',
          onTap: ((p0, p1) {
            page.jumpToPage(1);
            page1.changePage(1);
          })),
      SideMenuItem(
          // Priority of item to show on SideMenu, lower value is displayed at the top
          priority: 2,
          title: 'Passengers',
          onTap: ((p0, p1) {
            page.jumpToPage(2);
            page1.changePage(2);
          })),
    ];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomeScreen()));
          }),
      body: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.blue),
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Image.asset(
                  //   'assets/images/logo.png',
                  //   height: 100,
                  // ),
                  const SizedBox(
                    width: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextBold(
                              text: 'Jeepney',
                              fontSize: 32,
                              color: Colors.white),
                          TextRegular(
                              text: 'Stop System',
                              fontSize: 15,
                              color: Colors.white),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 450,
                      ),
                      TextBold(
                          text: 'Web Server',
                          fontSize: 52,
                          color: Colors.white),
                    ],
                  ),
                  const Expanded(
                    child: SizedBox(
                      width: 300,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 500,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 300,
                    color: const Color.fromARGB(255, 238, 235, 235)
                        .withOpacity(0.2),
                    child: SideMenu(
                      style: SideMenuStyle(
                          openSideMenuWidth: 200,
                          compactSideMenuWidth: 40,
                          hoverColor: Colors.brown[100],
                          selectedIconColor: Colors.white,
                          unselectedIconColor: Colors.white,
                          selectedTitleTextStyle: const TextStyle(
                              color: Colors.white, fontFamily: 'QBold'),
                          unselectedTitleTextStyle: const TextStyle(
                              color: Colors.black, fontFamily: 'QRegular'),
                          selectedColor: Colors.black26,
                          iconSize: 20,
                          showTooltip: true,
                          itemHeight: 50.0,
                          itemInnerSpacing: 8.0,
                          itemOuterPadding:
                              const EdgeInsets.symmetric(horizontal: 10.0),
                          toggleColor: Colors.black54),
                      // Page controller to manage a PageView
                      controller: page1,
                      // Will shows on top of all items, it can be a logo or a Title text

                      // Will show on bottom of SideMenu when displayMode was SideMenuDisplayMode.open

                      // Notify when display mode changed

                      // List of SideMenuItem to show them on SideMenu
                      items: items,
                    ),
                  ),
                  Expanded(
                    child: PageView(
                      controller: page,
                      children: const [
                        MapPage(),
                        JeepneyTab(),
                        PassengersTab(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
