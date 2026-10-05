import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/database_provider.dart';
import '../customer/customer_detail_screen.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchResultsProvider = FutureProvider((ref) async {
  final query = ref.watch(searchQueryProvider);
  if (query.trim().isEmpty) return [];
  final db = ref.watch(databaseProvider);
  return db.searchCustomers(query);
});

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final resultsAsync = ref.watch(searchResultsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Customers'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _controller,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Serial, Name or Phone...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _controller.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _controller.clear();
                          ref.read(searchQueryProvider.notifier).state = '';
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                ref.read(searchQueryProvider.notifier).state = value;
              },
            ),
          ),
          Expanded(
            child: resultsAsync.when(
              data: (results) {
                if (_controller.text.trim().isEmpty) {
                  return const Center(
                    child: Text(
                      'Type serial number, name or phone\nto search customers',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  );
                }
                if (results.isEmpty) {
                  return const Center(
                    child: Text(
                      'No customers found',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: results.length,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemBuilder: (context, index) {
                    final c = results[index];
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          child: Text(
                            c.serialNumber.length >= 2
                                ? c.serialNumber.substring(c.serialNumber.length - 2)
                                : c.serialNumber,
                            style: const TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                        title: Text(c.name,
                            style: const TextStyle(fontWeight: FontWeight.w600)),
                        subtitle: Text('#${c.serialNumber}  •  ${c.phone ?? "—"}'),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  CustomerDetailScreen(customerId: c.id),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
            ),
          ),
        ],
      ),
    );
  }
}
