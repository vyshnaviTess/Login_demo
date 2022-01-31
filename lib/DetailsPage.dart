import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailsPage extends StatefulWidget {
  @override
  DetailsPageState createState() => DetailsPageState();
}

class DetailsPageState extends State<DetailsPage> {
  var dropdownValue;
  var _surname;
  var _name;
  TextEditingController _dateController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  var DOB;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2101),
        fieldLabelText: "Select your DOB",
        fieldHintText: "Date/Month/Year",
        errorFormatText: "Enter a Valid Date",
        errorInvalidText: "Date Out of Range");

    if (picked != null && picked != selectedDate) {
      setState(() => {
            selectedDate = picked,
            DOB = new DateFormat('dd-MM-yyyy').format(selectedDate),
            _dateController.text = DOB
          });
      // _dateController.text = DateFormat('dd-MM-yyyy') as String;
      // DOB = new DateFormat('dd-MM-yyyy').format(selectedDate);
      print(DOB);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Details'),
      ),
      body: Center(
        child: Form(
          key: formkey,
          child: Column(
            children: <Widget>[
              Container(
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 50, bottom: 10),
                child: TextFormField(
                  controller: _name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    hintText: 'Enter your name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 10),
                child: TextFormField(
                  controller: _surname,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Surname',
                    hintText: 'Enter your Surname',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your surname';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 10),
                child: DropdownButtonFormField<String>(
                  value: dropdownValue,
                  style: TextStyle(color: Colors.black87),
                  items: <String>[
                    'Female',
                    'Male',
                    'Other',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  hint: Text('Select Gender'),
                  onChanged: (value) {
                    setState(() {
                      dropdownValue = value;
                    });
                  },
                  validator: (value) =>
                      value == null ? 'Please select gender' : null,
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.datetime,
                      autocorrect: false,
                      controller: _dateController,
                      onSaved: (value) {},
                      onTap: () {
                        _selectDate(context);
                        FocusScope.of(context).requestFocus(new FocusNode());
                      },
                      maxLines: 1,
                      validator: (value) {
                        if (value!.isEmpty || value.length < 1) {
                          return 'Choose Date';
                        }
                      },
                      decoration: InputDecoration(labelText: 'Date of Birth'),
                    ),
                    // SizedBox(
                    //   height: 20.0,
                    // ),
                    // TextButton(
                    //   onPressed: () => _selectDate(context),
                    //   child: Text('Select date'),
                    // ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 220.0),
                child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Container(
                            color: Colors.red,
                            child: new TextButton(
                              child: new Text("Cancel",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15)),
                              onPressed: () {
                                setState(() {
                                  // _status = true;
                                  FocusScope.of(context)
                                      .requestFocus(new FocusNode());
                                });
                              },
                            )),
                      ),
                      flex: 2,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Container(
                            // shape: new RoundedRectangleBorder(
                            //     borderRadius: new BorderRadius.circular(20.0)),
                            color: Colors.green,
                            child: new TextButton(
                              child: new Text("Save",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15)),
                              onPressed: () {
                                setState(() {
                                  // _status = true;
                                  if (formkey.currentState!.validate()) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Data saved')),
                                    );
                                  }
                                });
                              },
                            )),
                      ),
                      flex: 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
