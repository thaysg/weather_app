import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ContainersScreen extends StatelessWidget {
  Color colour;
  AssetImage picture;
  String itsText;
  AssetImage pictureRow;
  int temperatureData;
  final VoidCallback onTap;
  String textCity;
  final Widget localCity;
  final VoidCallback onTapCity;

  ContainersScreen({
    Key key,
    @required this.colour,
    @required this.itsText,
    @required this.picture,
    @required this.pictureRow,
    @required this.temperatureData,
    @required this.onTap,
    @required this.textCity,
    this.localCity,
    @required this.onTapCity,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView(
          shrinkWrap: true,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: colour,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 30, 30, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              itsText,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                          Image(
                            image: pictureRow,
                            width: 50,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Text(
                          '$temperatureData °C',
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.location_on,
                              size: 32,
                            ),
                            onPressed: onTap,
                          ),
                          localCity,
                          IconButton(
                            icon: Icon(
                              Icons.location_city,
                              size: 32,
                            ),
                            onPressed: onTapCity,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          flex: 3,
          child: Image(
            image: picture,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
