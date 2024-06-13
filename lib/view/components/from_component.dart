// import 'package:dynamic_form_web_app/model/color.dart';
// import 'package:dynamic_form_web_app/view/components/custom_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class FormComponent extends StatefulWidget {
//   final Map<String, dynamic> component;
//   final Function onRemove;
//   final Function onAdd;

//   const FormComponent(
//       {super.key,
//       required this.component,
//       required this.onRemove,
//       required this.onAdd});

//   @override
//   // ignore: library_private_types_in_public_api
//   _FormComponentState createState() => _FormComponentState();
// }

// class _FormComponentState extends State<FormComponent> {
//   bool isChecked = false;
//   Color borderColor = Colors.transparent;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(
//           color: borderColor,
//           width: 2.0,
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               // mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Row(
//                   children: [
//                     Checkbox(
//                       side: const BorderSide(color: Colors.green),
//                       activeColor: Colors.green,
//                       value: isChecked,
//                       onChanged: (value) {
//                         setState(() {
//                           isChecked = value!;
//                           borderColor = isChecked ? blue : Colors.transparent;
//                         });
//                       },
//                     ),
//                     const Text(
//                       'Checkbox',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Spacer(),
//                 customButton(
//                   ontap: () => widget.onRemove(),
//                   text: 'Remove',
//                   color: Colors.white,
//                   textColor: Colors.black,
//                   borderColor: lightfontgrey,
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 customButton(
//                   ontap: () => widget.onAdd(),
//                   text: 'Add',
//                   color: blue,
//                   textColor: Colors.white,
//                   borderColor: blue,
//                 ),
//               ],
//             ),
//             const SizedBox(height: 5),
//             Divider(),
//             const SizedBox(height: 5),
//             const Text('label*'),
//             const SizedBox(height: 5),
//             TextFormField(
//               initialValue: widget.component['label'],
//               decoration: InputDecoration(
//                 // labelText: 'Label
//                 hintText: 'Label*',
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5),
//                   borderSide: const BorderSide(
//                     color: Colors.grey,
//                   ),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5),
//                   borderSide: const BorderSide(
//                     color: Colors.grey,
//                   ),
//                 ),
//               ),
//               onChanged: (value) {
//                 setState(() {
//                   widget.component['label'] = value;
//                 });
//               },
//             ),
//             const SizedBox(height: 10),
//             const Text('Info-Text*'),
//             const SizedBox(height: 5),
//             TextFormField(
//               initialValue: widget.component['infoText'],
//               decoration: InputDecoration(
//                 // labelText: 'Info-Text',
//                 hintText: 'Info-Text',
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5),
//                   borderSide: const BorderSide(
//                     color: Colors.grey,
//                   ),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5),
//                   borderSide: const BorderSide(
//                     color: Colors.grey,
//                   ),
//                 ),
//               ),
//               onChanged: (value) {
//                 setState(() {
//                   widget.component['infoText'] = value;
//                 });
//               },
//             ),
//             const SizedBox(height: 10),
//             const Text('Settings'),
//             Row(
//               children: [
//                 Checkbox(
//                   value: widget.component['settings']['required'],
//                   onChanged: (value) {
//                     setState(() {
//                       widget.component['settings']['required'] = value!;
//                     });
//                   },
//                 ),
//                 const Text('Required'),
//                 const SizedBox(width: 20),
//                 Checkbox(
//                   value: widget.component['settings']['readonly'],
//                   onChanged: (value) {
//                     setState(() {
//                       widget.component['settings']['readonly'] = value!;
//                     });
//                   },
//                 ),
//                 const Text('Readonly'),
//                 const SizedBox(width: 20),
//                 Checkbox(
//                   value: widget.component['settings']['hiddenField'],
//                   onChanged: (value) {
//                     setState(() {
//                       widget.component['settings']['hiddenField'] = value!;
//                     });
//                   },
//                 ),
//                 const Text('Hidden Field'),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:dynamic_form_web_app/model/color.dart';
import 'package:dynamic_form_web_app/view/components/custom_button.dart';
import 'package:dynamic_form_web_app/view/components/custom_textfield.dart';
import 'package:flutter/material.dart';

class FormComponent extends StatefulWidget {
  final Map<String, dynamic> component;
  final Function onRemove;
  final Function onAdd;

  const FormComponent({
    super.key,
    required this.component,
    required this.onRemove,
    required this.onAdd,
  });

  @override
  // ignore: library_private_types_in_public_api
  _FormComponentState createState() => _FormComponentState();
}

class _FormComponentState extends State<FormComponent> {
  bool isChecked = false;
  Color borderColor = Colors.transparent;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: borderColor,
          width: 2.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  //
                  // checkbox section
                  Row(
                    children: [
                      Checkbox(
                        side: const BorderSide(color: Colors.green),
                        activeColor: Colors.green,
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                            borderColor = isChecked ? blue : Colors.transparent;
                          });
                        },
                      ),
                      const Text(
                        'Checkbox',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  //this is custom elevated button , remove form
                  customButton(
                    ontap: () => widget.onRemove(),
                    text: 'Remove',
                    color: Colors.white,
                    textColor: Colors.black,
                    borderColor: lightfontgrey,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  //*
                  //this is custom elevated button , add form
                  customButton(
                    ontap: () {
                      if (_formKey.currentState!.validate()) {
                        widget.onAdd();
                      } else {
                        _showSnackBar('Please fill all required fields');
                      }
                    },
                    text: 'Add',
                    color: blue,
                    textColor: Colors.white,
                    borderColor: blue,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const Divider(),
              const SizedBox(height: 5),
              const Text('label*'),
              const SizedBox(height: 5),
              //*
              //this is custom custom textfield
              customTextField(
                initialValue: widget.component['label'],
                hintText: 'Info-Text',
                onChanged: (value) {
                  setState(() {
                    widget.component['label'] = value;
                  });
                  if (value.isEmpty) {
                    _showSnackBar('Please enter a value for Label');
                  }
                },
              ),
              const SizedBox(height: 10),
              const Text('Info-Text*'),
              const SizedBox(height: 5),
              //*
              //this is custom custom textfield
              customTextField(
                initialValue: widget.component['infoText'],
                hintText: 'Info-Text',
                onChanged: (value) {
                  setState(() {
                    widget.component['infoText'] = value;
                  });
                  if (value.isEmpty) {
                    _showSnackBar('Please enter a value for Info-Text');
                  }
                },
              ),
              const SizedBox(height: 10),
              const Text('Settings'),

              //
              // this setting checkbox secltion
              Row(
                children: [
                  Checkbox(
                    value: widget.component['settings']['required'],
                    onChanged: (value) {
                      setState(() {
                        widget.component['settings']['required'] = value!;
                      });
                    },
                  ),
                  const Text('Required'),
                  const SizedBox(width: 20),
                  Checkbox(
                    value: widget.component['settings']['readonly'],
                    onChanged: (value) {
                      setState(() {
                        widget.component['settings']['readonly'] = value!;
                      });
                    },
                  ),
                  const Text('Readonly'),
                  const SizedBox(width: 20),
                  Checkbox(
                    value: widget.component['settings']['hiddenField'],
                    onChanged: (value) {
                      setState(() {
                        widget.component['settings']['hiddenField'] = value!;
                      });
                    },
                  ),
                  const Text('Hidden Field'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
