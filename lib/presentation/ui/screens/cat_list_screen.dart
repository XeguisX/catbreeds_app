import 'package:catbreeds_app/presentation/providers/cats_view_model.dart';
import 'package:catbreeds_app/presentation/ui/widgets/cat_item.dart';
import 'package:catbreeds_app/presentation/ui/widgets/icon_text_info.dart';
import 'package:catbreeds_app/presentation/ui/widgets/search_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CatListScreen extends ConsumerStatefulWidget {
  const CatListScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CatListScreenState();
}

class _CatListScreenState extends ConsumerState<CatListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(catsViewModelProvider.notifier).getCats();
    });
  }

  @override
  Widget build(BuildContext context) {
    final asyncCats = ref.watch(catsViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'CatBreads',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
        ),
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 245, 107, 21),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: SearchInput(
              onChanged: ref.read(catsViewModelProvider.notifier).filter,
            ),
          ),
          asyncCats.when(
            data: (cats) {
              if (cats.isEmpty) {
                return const IconTextInfo(
                  label: 'No results found',
                  icon: Icons.search_off_outlined,
                );
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: cats.length,
                  itemBuilder: (context, index) {
                    return CatItem(cat: cats[index]);
                  },
                ),
              );
            },
            error: (error, s) => const IconTextInfo(
              label: 'Ups... Error occurred',
              icon: Icons.cloud_off_rounded,
            ),
            loading: () => Image.asset(
              'assets/gif/loading2.gif',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
