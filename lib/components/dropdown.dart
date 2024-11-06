import 'package:flutter/material.dart';

class DropDownField extends StatefulWidget {
  const DropDownField({super.key});

  @override
  State<DropDownField> createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<DropDownField> {
  String? selectedValue;

  List<String> options = ['Option 1', 'Option 2', 'Option 3'];

  // ignore: unused_element
  void _addOption() {
    setState(
      () {
        options.add('Option ${options.length + 1}');
      },
    );
  }

// ignore: unused_element
  void _subtractOption() {
    setState(() {
      options.remove('Option ${options.length - 1}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 8.0,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 10,
        ),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: DropdownButton<String>(
          hint: const Text('Select Payment Month'),
          borderRadius: BorderRadius.circular(12),
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          value: selectedValue,
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue;
            });
          },
          underline: Container(),
          items: options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          isExpanded: true,
        ),
      ),
    );
  }
}
