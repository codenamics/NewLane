import 'package:flutter/material.dart';
import 'package:headlines/provider/SourceProvider.dart';
import 'package:provider/provider.dart';

class NewsSources extends StatefulWidget {
  @override
  _NewsSourcesState createState() => _NewsSourcesState();
}

class _NewsSourcesState extends State<NewsSources> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) {
      Provider.of<SourceProvider>(context, listen: false).getSources();
    });

    super.initState();
  }

  Widget build(BuildContext context) {
    var sources = Provider.of<SourceProvider>(context).sources;
    return sources.length != 0
        ? Container(
            height: 115.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sources.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.only(top: 10.0, right: 0.0),
                  width: 80.0,
                  child: GestureDetector(
                    onTap: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Hero(
                          tag: sources[index].id,
                          child: Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: new BoxDecoration(
                                image: new DecorationImage(
                                    fit: BoxFit.cover,
                                    image:  AssetImage(
                                      
                                      "assets/logos/${sources[index].id}.png",
                                    )),
                              )),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          sources[index].name,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              height: 1.4,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 10.0),
                        ),
                        SizedBox(
                          height: 3.0,
                        ),
                        Text(
                          sources[index].category,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              height: 1.4,
                              fontWeight: FontWeight.bold,
                              fontSize: 9.0),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        : Center(child: CircularProgressIndicator());
  }
}

// ignore: non_constant_identifier_names
ImageProvider Img(input){
    
}