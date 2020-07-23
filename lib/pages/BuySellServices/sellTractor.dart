import 'package:flutter/material.dart';

class SellTractor extends StatefulWidget {
  @override
  _SellTractorState createState() => _SellTractorState();
}

class _SellTractorState extends State<SellTractor> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        centerTitle: true,
        title:Text("Sell Your Tractor"),
        backgroundColor: Colors.red,
        automaticallyImplyLeading: true,
      ),
      body: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Brand Name",
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter Brand Name';
                }
                return null;
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Year",
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter year made';
                }
                return null;
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Fuel",
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter fuel type';
                }
                return null;
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "KM driven",
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter KM driven';
                }
                return null;
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "No. of owners",
                
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter no. of owners';
                }
                return null;
              },
            ),
          ),
          
          Container(
            padding: EdgeInsets.symmetric(horizontal:100),
            child: RaisedButton(
              
              color: Colors.red,
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Next',style: TextStyle(
                color:Colors.white,
                fontSize:20
              ),),
            ),
          ),
        ],
      ),
    );
  }
}