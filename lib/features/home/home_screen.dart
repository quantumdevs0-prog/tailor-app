import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/database_provider.dart';
import '../customer/add_edit_customer_screen.dart';
import '../search/search_screen.dart';
import '../customer/customer_detail_screen.dart';

final customerCountProvider = FutureProvider<int>((ref) async {
  final db = ref.watch(databaseProvider);
  return db.getCustomerCount();
});

final allCustomersProvider = StreamProvider((ref) {
  final db = ref.watch(databaseProvider);
  return db.watchAllCustomers();
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countAsync = ref.watch(customerCountProvider);
    final customersAsync = ref.watch(allCustomersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shalwar Kameez Tailor'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, size: 28),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SearchScreen()),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Total customers card
              Card(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Text(
                        'Total Customers',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      countAsync.when(
                        data: (count) => Text(
                          '$count',
                          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        loading: () => const CircularProgressIndicator(),
                        error: (_, __) => const Text('—'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // New Customer button
              ElevatedButton.icon(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AddEditCustomerScreen(),
                    ),
                  );
                  ref.invalidate(customerCountProvider);
                },
                icon: const Icon(Icons.person_add, size: 28),
                label: const Text('+ New Customer'),
              ),
              const SizedBox(height: 16),

              // Search button
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SearchScreen()),
                  );
                },
                icon: const Icon(Icons.search, size: 28),
                label: const Text('Search Customers'),
              ),
              const SizedBox(height: 32),

              // Recent customers
              Text(
                'Recent Customers',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              Expanded(
                child: customersAsync.when(
                  data: (customers) {
                    if (customers.isEmpty) {
                      return Center(
                        child: Text(
                          'No customers yet.\nTap "+ New Customer" to start.',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: Colors.grey,
                              ),
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: customers.length > 20 ? 20 : customers.length,
                      itemBuilder: (context, index) {
                        final c = customers[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Theme.of(context).colorScheme.primary,
                              child: Text(
                                c.serialNumber.substring(c.serialNumber.length - 2),
                                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                            title: Text(c.name, style: const TextStyle(fontWeight: FontWeight.w600)),
                            subtitle: Text('#${c.serialNumber}  •  ${c.phone ?? "No phone"}'),
                            trailing: const Icon(Icons.chevron_right),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => CustomerDetailScreen(customerId: c.id),
                                ),
                              ).then((_) => ref.invalidate(customerCountProvider));
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
        ),
      ),
    );
  }
}
