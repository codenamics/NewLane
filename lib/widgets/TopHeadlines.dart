import 'package:flutter/material.dart';
import 'package:headlines/provider/TopHeadlinesProvider.dart';
import 'package:provider/provider.dart';

class TopHeadlines extends StatefulWidget {
  @override
  _TopHeadlinesState createState() => _TopHeadlinesState();
}

class _TopHeadlinesState extends State<TopHeadlines> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) {
      Provider.of<TopHeadlinesProvider>(context, listen: false).getHeadLines();
    });

    super.initState();
  }

  Widget build(BuildContext context) {
    var topHeadlines = Provider.of<TopHeadlinesProvider>(context).topHeadlines;

    return topHeadlines.length != 0
        ? ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: topHeadlines.length,
            itemBuilder: (ctx, index) => Container(
                padding: EdgeInsets.all(10),
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          
                          topHeadlines[index].title,
                          maxLines: 4,
                          style: TextStyle(
                              backgroundColor: Color.fromRGBO(243, 243, 243, 1),
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w800),
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 100,
                            color: Colors.black87,
                            padding: EdgeInsets.all(4),
                            child: Text(
                              topHeadlines[index].author,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            )),
                        Container(
                            color: Colors.red,
                            padding: EdgeInsets.all(4),
                            child: Text(
                              topHeadlines[index]
                                  .publishedAt
                                  .toIso8601String()
                                  .split("T")[0],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ))
                      ],
                    )
                  ],
                ),
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  shape: BoxShape.rectangle,
                  image: new DecorationImage(
                      fit: BoxFit.cover,
                      image: topHeadlines[index].urlToImage == null
                          ? AssetImage("assets/img/placeholder.jpg")
                          : NetworkImage(topHeadlines[index].urlToImage)),
                )))
        : Center(child: CircularProgressIndicator());
  }
}
