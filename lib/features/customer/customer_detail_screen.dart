import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../data/database/app_database.dart';
import '../../providers/database_provider.dart';
import 'add_edit_customer_screen.dart';

final customerDetailProvider =
    FutureProvider.family<Customer?, int>((ref, id) async {
  final db = ref.watch(databaseProvider);
  return db.getCustomerById(id);
});

final measurementHistoryProvider =
    StreamProvider.family<List<Measurement>, int>((ref, customerId) {
  final db = ref.watch(databaseProvider);
  return db.watchMeasurementHistory(customerId);
});

class CustomerDetailScreen extends ConsumerWidget {
  final int customerId;

  const CustomerDetailScreen({super.key, required this.customerId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customerAsync = ref.watch(customerDetailProvider(customerId));
    final historyAsync = ref.watch(measurementHistoryProvider(customerId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () async {
              final customer = await ref.read(customerDetailProvider(customerId).future);
              if (customer != null && context.mounted) {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AddEditCustomerScreen(customer: customer),
                  ),
                );
                ref.invalidate(customerDetailProvider(customerId));
                ref.invalidate(measurementHistoryProvider(customerId));
              }
            },
          ),
        ],
      ),
      body: customerAsync.when(
        data: (customer) {
          if (customer == null) {
            return const Center(child: Text('Customer not found'));
          }
          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              // Header card
              Card(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        '#${customer.serialNumber}',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        customer.name,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      if (customer.phone != null && customer.phone!.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(customer.phone!,
                            style: Theme.of(context).textTheme.bodyLarge),
                      ],
                      const SizedBox(height: 8),
                      Text(
                        'Joined: ${DateFormat('dd MMM yyyy').format(customer.createdAt)}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Current measurements
              Text('Current Measurements',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 12),
              historyAsync.when(
                data: (list) {
                  final currentList = list.where((m) => m.isCurrent).toList();
                  final current = currentList.isNotEmpty ? currentList.first : null;
                  if (current == null) {
                    return const Card(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Text('No measurements recorded yet.'),
                      ),
                    );
                  }
                  return _MeasurementCard(measurement: current, isCurrent: true);
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Text('Error: $e'),
              ),

              const SizedBox(height: 28),
              Text('Measurement History',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 12),
              historyAsync.when(
                data: (list) {
                  if (list.isEmpty) {
                    return const Text('No history yet.');
                  }
                  return Column(
                    children: list.map((m) {
                      return _MeasurementCard(
                        measurement: m,
                        isCurrent: m.isCurrent,
                      );
                    }).toList(),
                  );
                },
                loading: () => const SizedBox.shrink(),
                error: (_, __) => const SizedBox.shrink(),
              ),
              const SizedBox(height: 40),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final customer = await ref.read(customerDetailProvider(customerId).future);
          if (customer != null && context.mounted) {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => AddEditCustomerScreen(customer: customer),
              ),
            );
            ref.invalidate(customerDetailProvider(customerId));
            ref.invalidate(measurementHistoryProvider(customerId));
          }
        },
        icon: const Icon(Icons.edit),
        label: const Text('Edit / Update'),
      ),
    );
  }
}

class _MeasurementCard extends StatelessWidget {
  final Measurement measurement;
  final bool isCurrent;

  const _MeasurementCard({required this.measurement, required this.isCurrent});

  Widget _row(String label, double? value) {
    if (value == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.black54)),
          Text('${value.toStringAsFixed(value.truncateToDouble() == value ? 0 : 1)} in',
              style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (isCurrent)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text('CURRENT',
                        style: TextStyle(
                            color: Colors.green.shade800,
                            fontWeight: FontWeight.bold,
                            fontSize: 12)),
                  ),
                const Spacer(),
                Text(
                  DateFormat('dd MMM yyyy • hh:mm a').format(measurement.measuredAt),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            const Divider(height: 20),
            Text('Kameez', style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
            _row('Length', measurement.length),
            _row('Shoulder', measurement.shoulder),
            _row('Chest', measurement.chest),
            _row('Waist', measurement.waist),
            _row('Sleeve', measurement.sleeve),
            _row('Neck', measurement.neck),
            _row('Daman', measurement.daman),
            const SizedBox(height: 8),
            Text('Shalwar', style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
            _row('Length', measurement.shalwarLength),
            _row('Waist', measurement.shalwarWaist),
            _row('Bottom', measurement.shalwarBottom),
            if (measurement.collarStyle != null ||
                measurement.shape != null ||
                measurement.notes != null) ...[
              const SizedBox(height: 8),
              Text('Style', style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
              if (measurement.collarStyle != null)
                Text('Collar: ${measurement.collarStyle}'),
              if (measurement.shape != null) Text('Shape: ${measurement.shape}'),
              if (measurement.notes != null) Text('Notes: ${measurement.notes}'),
            ],
          ],
        ),
      ),
    );
  }
}
