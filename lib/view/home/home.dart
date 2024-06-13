import 'package:dynamic_form_web_app/main.dart';
import 'package:dynamic_form_web_app/view/components/custom_button.dart';
import 'package:dynamic_form_web_app/view/components/from_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //
  // form setting string map
  List<Map<String, dynamic>> formComponents = [
    {
      // 'label': 'Initial Label',
      // 'infoText': 'Initial Info-Text',
      'settings': {'required': true, 'readonly': false, 'hiddenField': false},
    },
  ];

//
// add component function
  void addComponent() {
    setState(() {
      formComponents.add({
        'label': '',
        'infoText': '',
        'settings': {
          'required': false,
          'readonly': false,
          'hiddenField': false
        },
      });
    });
  }

//
// remove component function
  void removeComponent(int index) {
    if (formComponents.length > 1) {
      setState(() {
        formComponents.removeAt(index);
      });
    }
  }

//
// form data show dialog function
  void submitForm() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Form Data'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: formComponents.map((component) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Component: ${formComponents.indexOf(component) + 1}'),
                  Text('Label: ${component['label']}'),
                  Text('Info-Text: ${component['infoText']}'),
                  const Text('Settings:'),
                  Text(
                      'Required: ${component['settings']['required']}, Readonly: ${component['settings']['readonly']}, Hidden Field: ${component['settings']['hiddenField']}'),
                  const SizedBox(height: 10),
                ],
              );
            }).toList(),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.title),
        scrolledUnderElevation: 0,
        elevation: 0,
        //
        // form submit after click show all data dialog
        actions: [
          customButton(
            ontap: submitForm,
            text: 'Submit',
            color: Colors.blue,
            textColor: Colors.white,
            borderColor: Colors.blue,
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.3),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: Column(
                children: [
                  //
                  // form list
                  Expanded(
                    child: ListView.builder(
                      itemCount: formComponents.length,
                      itemBuilder: (context, index) {
                        return FormComponent(
                          component: formComponents[index],
                          onRemove: () => removeComponent(index),
                          onAdd: addComponent,
                        );
                      },
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
