import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gethomeadmin/screens/new_item_screen.dart';

class AdminScreen extends StatefulWidget {
  static const String routeName = '/admin-screen';

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  Firestore _store = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Get Home Admin',
          style: Theme.of(context).textTheme.headline,
        ),
        actions: <Widget>[
          SizedBox(
            width: AppBar().preferredSize.height,
            height: AppBar().preferredSize.height,
            child: Material(
              borderRadius: BorderRadius.circular(50),
              color: Colors.transparent,
              elevation: 0,
              clipBehavior: Clip.hardEdge,
              child: IconButton(
                icon: Icon(Icons.add_circle),
                onPressed: () {
                  Navigator.of(context).pushNamed(NewItemScreen.routeName);
                },
                iconSize: 40,
                color: Colors.white,
                splashColor: Colors.deepOrange,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(
                  Duration(seconds: 2),
                );
                return;
              },
              backgroundColor: Colors.orange,
              color: Colors.white,
              displacement: 60,
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Theme.of(context).accentColor,
                        width: 2,
                      ),
                    ),
                    child: ListTileTheme(
                      style: ListTileStyle.list,
                      child: ListTile(
                        title: Text(
                          'itemName',
                          style: Theme.of(context).textTheme.title,
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'productPrice',
                              style: Theme.of(context).textTheme.subtitle,
                            ),
                            Text(
                              'stock',
                              style: Theme.of(context).textTheme.display2,
                            ),
                          ],
                        ),
                        trailing: Material(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.orange,
                          elevation: 5,
                          clipBehavior: Clip.hardEdge,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {},
                                color: Colors.blue[600],
                                splashColor: Colors.deepOrange,
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {},
                                color: Colors.deepOrange[900],
                                splashColor: Colors.blue,
                              ),
                            ],
                          ),
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
    );
  }
}
