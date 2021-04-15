import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xd_universe/constants.dart';
import 'package:xd_universe/data.dart';

class DetailPage extends StatelessWidget {
  final PlanetInfo planetInfo;

  const DetailPage({Key key, this.planetInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 220,
                      ),
                      Text(
                        planetInfo.name,
                        style: GoogleFonts.lato(
                            fontSize: 56,
                            fontWeight: FontWeight.bold,
                            color: primaryTextColor),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Solar System",
                        style: GoogleFonts.lato(
                            fontSize: 31,
                            fontWeight: FontWeight.normal,
                            color: secondaryTextColor),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Colors.black38,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(planetInfo.description ?? "",
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.lato(
                              fontSize: 20, color: contentTextColor)),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Gallery",
                        style: GoogleFonts.lato(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 250,
                        child: ListView.builder(
                            itemCount: planetInfo.images.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Card(
                                clipBehavior: Clip.antiAlias,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24)),
                                child: Image.network(
                                  planetInfo.images[index],
                                  fit: BoxFit.cover,
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  right: -87,
                  child: Hero(
                      tag: planetInfo.position,
                      child: Image.asset(planetInfo.iconImage))),
              Positioned(
                top: -5,
                left: 30,
                // bottom: 50,
                child: Text(
                  planetInfo.position.toString(),
                  style: GoogleFonts.lato(
                      fontSize: 226, color: primaryTextColor.withOpacity(0.08)),
                ),
              ),
              IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          )),
    );
  }
}
