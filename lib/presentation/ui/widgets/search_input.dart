import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({required this.onChanged, super.key});

  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: 'Buscar',
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 245, 107, 21),
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        suffixIcon: const Icon(
          Icons.search,
          color: Color.fromARGB(255, 245, 107, 21),
        ),
      ),
    );
  }
}
