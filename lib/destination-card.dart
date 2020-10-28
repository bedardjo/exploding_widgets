import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Destination {
  final String name;
  final String imagePath;
  final String description;

  Destination(this.name, this.imagePath, this.description);
}

class DestinationCard extends StatelessWidget {
  final Destination destination;
  final void Function() onTrashTapped;

  const DestinationCard({Key key, this.destination, this.onTrashTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
      padding: EdgeInsets.all(16),
      child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          elevation: 8.0,
          child: Container(
            height: 180,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withAlpha(150), BlendMode.multiply),
                  image: AssetImage(destination.imagePath),
                  fit: BoxFit.cover),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(destination.name,
                          style: TextStyle(color: Colors.white, fontSize: 24)),
                      GestureDetector(
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                        onTap: onTrashTapped,
                      )
                    ],
                  ),
                  Text(
                    destination.description,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox()
                ]),
          )));
}
