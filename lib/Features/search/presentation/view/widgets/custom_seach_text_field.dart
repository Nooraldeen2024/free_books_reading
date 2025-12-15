import 'package:flutter/material.dart';

class CustomSearchTextfield extends StatelessWidget {
  const CustomSearchTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: 'Search',
        suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
      ),
    );
  }
}
