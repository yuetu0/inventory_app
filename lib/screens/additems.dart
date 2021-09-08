import 'package:flutter/material.dart';
import '../model/form.dart';
import '../controller/form_controller.dart';

class AddItems extends StatefulWidget {

    AddItems({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AddItemsState createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {

    // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  // TextField Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  // Method to Submit Feedback and save it in Google Sheets
  void _submitForm() {
    // Validate returns true if the form is valid, or false
    // otherwise.
    if (_formKey.currentState.validate()) {
      // If the form is valid, proceed.
      FeedbackForm feedbackForm = FeedbackForm(
          nameController.text,
          amountController.text,
          descriptionController.text,);

      FormController formController = FormController();

      _showSnackbar("Submitting Feedback");

      // Submit 'feedbackForm' and save it in Google Sheets.
      formController.submitForm(feedbackForm, (String response) {
        print("Response: $response");
        if (response == FormController.STATUS_SUCCESS) {
          // Feedback is saved succesfully in Google Sheets.
          _showSnackbar("Feedback Submitted");
        } else {
          // Error Occurred while saving data in Google Sheets.
          _showSnackbar("Error Occurred!");
        }
      });
    }
  }
  
  // Method to show snackbar with 'message'.
  _showSnackbar(String message) {
      final snackBar = SnackBar(content: Text(message));
      _scaffoldKey.currentState.showSnackBar(snackBar); 
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,  
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Add Items"),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Form(
                key: _formKey,
                child:
                  Padding(padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        controller: nameController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter Valid Name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Name'
                        ),
                      ),
                      TextFormField(
                        controller: amountController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter Valid Amount';
                          }
                          return null;
                        },
                         keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Amount'
                        ),
                      ),
                      TextFormField(
                        controller: descriptionController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter Valid Description or NA';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Description (or NA)',
                        ),
                      ),
                    ],
                  ),
                ) 
              ),
              RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                onPressed:_submitForm,
                child: Text('Submit Item'),
              ),
            ],
          ),
        ),
    );
  }
}

