import 'package:flutter/material.dart';
import 'package:xd_universe/data.dart';
import 'package:xd_universe/detail_page.dart';
import 'constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [gradientStartColor, gradientEndColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3, 0.7])),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text(
                    "EXPLORE",
                    style: GoogleFonts.balooDa(
                      fontSize: 44,
                      color: titleTextColor,
                      //fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                    height: 500,
                    padding: EdgeInsets.only(left: 32),
                    child: Swiper(
                      itemCount: planets.length,
                      itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                      layout: SwiperLayout.STACK,
                      pagination: SwiperPagination(
                          builder: DotSwiperPaginationBuilder(
                        activeSize: 20,
                        space: 8,
                      )),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                    pageBuilder: (context, a, b) => DetailPage(
                                          planetInfo: planets[index],
                                        )));
                          },
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 100,
                                  ),
                                  Card(
                                    elevation: 8,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(32.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 100,
                                          ),
                                          Text(
                                            planets[index].name,
                                            style: GoogleFonts.lato(
                                                color: const Color(0xff47455f),
                                                fontSize: 44,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "solar System",
                                            style: GoogleFonts.lato(
                                              fontSize: 23,
                                              fontWeight: FontWeight.bold,
                                              color: primaryTextColor,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Text(
                                                "Know More",
                                                style: GoogleFonts.lato(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                  color: secondaryTextColor,
                                                ),
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                color: secondaryTextColor,
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Hero(
                                  tag: planets[index].position,
                                  child: Image.asset(planets[index].iconImage))
                            ],
                          ),
                        );
                      },
                    ))
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(36.0),
          ),
          color: navigationColor,
        ),
        padding: const EdgeInsets.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Image.asset('assets/menu_icon.png'),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset('assets/search_icon.png'),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset('assets/profile_icon.png'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
