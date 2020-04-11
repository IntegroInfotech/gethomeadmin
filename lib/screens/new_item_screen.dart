import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gethomeadmin/screens/admin_screen.dart';

class NewItemScreen extends StatefulWidget {
  static const String routeName = '/new-item-screen';

  @override
  _NewItemScreenState createState() => _NewItemScreenState();
}

class _NewItemScreenState extends State<NewItemScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Firestore _store = Firestore.instance;

  TextEditingController _prodNameController;
  TextEditingController _prodPriceController;
  TextEditingController _prodStockController;

  @override
  void initState() {
    _prodNameController = TextEditingController();
    _prodPriceController = TextEditingController();
    _prodStockController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Provide Item Details',
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
                icon: Icon(Icons.done),
                onPressed: () async {
                  try {
                    if (_prodNameController.text.length == 0 ||
                        _prodPriceController.text.length == 0 ||
                        _prodStockController.text.length == 0) {
                      throw ('');
                    }
                    await _store
                        .collection('products')
                        .document(_prodNameController.text)
                        .setData(
                      {
                        'prodName': _prodNameController.text,
                        'prodPrice': _prodPriceController.text,
                        'prodStock': _prodStockController.text,
                      },
                      merge: true,
                    );
                  } catch (exception) {
                    _scaffoldKey.currentState.showSnackBar(
                      SnackBar(
                        content: Text(
                          'Your credentails are incorrect.',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ),
                    );
                  }
                  Navigator.of(context).pushReplacementNamed(AdminScreen.routeName);
                },
                iconSize: 40,
                color: Colors.white,
                splashColor: Colors.deepOrange,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            TextFormField(
              controller: _prodNameController,
              style: Theme.of(context).textTheme.title,
              decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                    width: 2,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                    width: 2,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                    width: 2,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                    width: 2,
                  ),
                ),
                hintStyle: Theme.of(context).textTheme.caption,
                labelStyle: Theme.of(context).textTheme.caption,
                hintText: 'Name of the product.',
              ),
              keyboardType: TextInputType.text,
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _prodPriceController,
              style: Theme.of(context).textTheme.title,
              decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                    width: 2,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                    width: 2,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                    width: 2,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                    width: 2,
                  ),
                ),
                hintStyle: Theme.of(context).textTheme.caption,
                labelStyle: Theme.of(context).textTheme.caption,
                hintText: 'Price of the product.',
              ),
              keyboardType: TextInputType.numberWithOptions(),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _prodStockController,
              style: Theme.of(context).textTheme.title,
              decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                    width: 2,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                    width: 2,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                    width: 2,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                    width: 2,
                  ),
                ),
                hintStyle: Theme.of(context).textTheme.caption,
                labelStyle: Theme.of(context).textTheme.caption,
                hintText: 'Quantity of the product in stock.',
              ),
              keyboardType: TextInputType.numberWithOptions(),
            ),
          ],
        ),
      ),
    );
  }
}
