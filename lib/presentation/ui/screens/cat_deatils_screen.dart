import 'package:catbreeds_app/data/models/cat.dart';
import 'package:catbreeds_app/presentation/ui/widgets/cat_attribute.dart';
import 'package:catbreeds_app/presentation/ui/widgets/cat_image.dart';
import 'package:flutter/material.dart';

class CatDetailsScreen extends StatelessWidget {
  const CatDetailsScreen({super.key, required this.cat});

  final Cat cat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          cat.name,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
        ),
        elevation: 0,
        backgroundColor: const Color.fromRGBO(245, 107, 21, 1),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: CatImage(cat: cat),
          ),
          Expanded(
            child: Scrollbar(
              thumbVisibility: true,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        cat.description,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 12),
                      CatAttribute(
                        attribute: 'Breed',
                        description: cat.name,
                      ),
                      const SizedBox(height: 12),
                      CatAttribute(
                        attribute: 'Country',
                        description: '${cat.origin} - ${cat.countryCode}',
                      ),
                      const SizedBox(height: 12),
                      CatAttribute(
                        attribute: 'Intelligence',
                        description: cat.intelligence.toString(),
                      ),
                      const SizedBox(height: 12),
                      CatAttribute(
                        attribute: 'Adaptability',
                        description: cat.adaptability.toString(),
                      ),
                      const SizedBox(height: 12),
                      CatAttribute(
                        attribute: 'Life Span',
                        description: cat.lifeSpan.toString(),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
