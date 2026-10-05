import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' hide Column;
import '../../data/database/app_database.dart';
import '../../providers/database_provider.dart';

class AddEditCustomerScreen extends ConsumerStatefulWidget {
  final Customer? customer; // null = new, otherwise edit

  const AddEditCustomerScreen({super.key, this.customer});

  @override
  ConsumerState<AddEditCustomerScreen> createState() =>
      _AddEditCustomerScreenState();
}

class _AddEditCustomerScreenState extends ConsumerState<AddEditCustomerScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _serialController;

  // Measurement controllers
  late TextEditingController _lengthCtrl;
  late TextEditingController _shoulderCtrl;
  late TextEditingController _chestCtrl;
  late TextEditingController _waistCtrl;
  late TextEditingController _sleeveCtrl;
  late TextEditingController _neckCtrl;
  late TextEditingController _damanCtrl;
  late TextEditingController _shalwarLengthCtrl;
  late TextEditingController _shalwarWaistCtrl;
  late TextEditingController _shalwarBottomCtrl;
  late TextEditingController _collarCtrl;
  late TextEditingController _shapeCtrl;
  late TextEditingController _notesCtrl;

  bool _isLoading = false;
  bool _isEdit = false;

  @override
  void initState() {
    super.initState();
    _isEdit = widget.customer != null;

    _nameController = TextEditingController(text: widget.customer?.name ?? '');
    _phoneController = TextEditingController(text: widget.customer?.phone ?? '');
    _serialController = TextEditingController(text: widget.customer?.serialNumber ?? '');

    _lengthCtrl = TextEditingController();
    _shoulderCtrl = TextEditingController();
    _chestCtrl = TextEditingController();
    _waistCtrl = TextEditingController();
    _sleeveCtrl = TextEditingController();
    _neckCtrl = TextEditingController();
    _damanCtrl = TextEditingController();
    _shalwarLengthCtrl = TextEditingController();
    _shalwarWaistCtrl = TextEditingController();
    _shalwarBottomCtrl = TextEditingController();
    _collarCtrl = TextEditingController();
    _shapeCtrl = TextEditingController();
    _notesCtrl = TextEditingController();

    if (!_isEdit) {
      _loadNextSerial();
    } else {
      _loadCurrentMeasurement();
    }
  }

  Future<void> _loadNextSerial() async {
    final db = ref.read(databaseProvider);
    final serial = await db.generateNextSerial();
    if (mounted) {
      setState(() => _serialController.text = serial);
    }
  }

  Future<void> _loadCurrentMeasurement() async {
    if (widget.customer == null) return;
    final db = ref.read(databaseProvider);
    final m = await db.getCurrentMeasurement(widget.customer!.id);
    if (m != null && mounted) {
      setState(() {
        _lengthCtrl.text = m.length?.toString() ?? '';
        _shoulderCtrl.text = m.shoulder?.toString() ?? '';
        _chestCtrl.text = m.chest?.toString() ?? '';
        _waistCtrl.text = m.waist?.toString() ?? '';
        _sleeveCtrl.text = m.sleeve?.toString() ?? '';
        _neckCtrl.text = m.neck?.toString() ?? '';
        _damanCtrl.text = m.daman?.toString() ?? '';
        _shalwarLengthCtrl.text = m.shalwarLength?.toString() ?? '';
        _shalwarWaistCtrl.text = m.shalwarWaist?.toString() ?? '';
        _shalwarBottomCtrl.text = m.shalwarBottom?.toString() ?? '';
        _collarCtrl.text = m.collarStyle ?? '';
        _shapeCtrl.text = m.shape ?? '';
        _notesCtrl.text = m.notes ?? '';
      });
    }
  }

  double? _parse(String text) {
    if (text.trim().isEmpty) return null;
    return double.tryParse(text.trim());
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    final db = ref.read(databaseProvider);
    final now = DateTime.now();

    try {
      if (_isEdit) {
        // Update customer
        final updated = widget.customer!.copyWith(
          name: _nameController.text.trim(),
          phone: Value(_phoneController.text.trim().isEmpty
              ? null
              : _phoneController.text.trim()),
          updatedAt: now,
        );
        await db.updateCustomer(updated);

        // Add new measurement (history preserved)
        await db.addMeasurement(MeasurementsCompanion.insert(
          customerId: widget.customer!.id,
          measuredAt: now,
          isCurrent: const Value(true),
          length: Value(_parse(_lengthCtrl.text)),
          shoulder: Value(_parse(_shoulderCtrl.text)),
          chest: Value(_parse(_chestCtrl.text)),
          waist: Value(_parse(_waistCtrl.text)),
          sleeve: Value(_parse(_sleeveCtrl.text)),
          neck: Value(_parse(_neckCtrl.text)),
          daman: Value(_parse(_damanCtrl.text)),
          shalwarLength: Value(_parse(_shalwarLengthCtrl.text)),
          shalwarWaist: Value(_parse(_shalwarWaistCtrl.text)),
          shalwarBottom: Value(_parse(_shalwarBottomCtrl.text)),
          collarStyle: Value(_collarCtrl.text.trim().isEmpty ? null : _collarCtrl.text.trim()),
          shape: Value(_shapeCtrl.text.trim().isEmpty ? null : _shapeCtrl.text.trim()),
          notes: Value(_notesCtrl.text.trim().isEmpty ? null : _notesCtrl.text.trim()),
        ));
      } else {
        // New customer
        final customerId = await db.insertCustomer(CustomersCompanion.insert(
          serialNumber: _serialController.text,
          name: _nameController.text.trim(),
          phone: Value(_phoneController.text.trim().isEmpty
              ? null
              : _phoneController.text.trim()),
          createdAt: now,
          updatedAt: now,
        ));

        await db.addMeasurement(MeasurementsCompanion.insert(
          customerId: customerId,
          measuredAt: now,
          isCurrent: const Value(true),
          length: Value(_parse(_lengthCtrl.text)),
          shoulder: Value(_parse(_shoulderCtrl.text)),
          chest: Value(_parse(_chestCtrl.text)),
          waist: Value(_parse(_waistCtrl.text)),
          sleeve: Value(_parse(_sleeveCtrl.text)),
          neck: Value(_parse(_neckCtrl.text)),
          daman: Value(_parse(_damanCtrl.text)),
          shalwarLength: Value(_parse(_shalwarLengthCtrl.text)),
          shalwarWaist: Value(_parse(_shalwarWaistCtrl.text)),
          shalwarBottom: Value(_parse(_shalwarBottomCtrl.text)),
          collarStyle: Value(_collarCtrl.text.trim().isEmpty ? null : _collarCtrl.text.trim()),
          shape: Value(_shapeCtrl.text.trim().isEmpty ? null : _shapeCtrl.text.trim()),
          notes: Value(_notesCtrl.text.trim().isEmpty ? null : _notesCtrl.text.trim()),
        ));
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_isEdit ? 'Customer updated successfully' : 'Customer saved successfully'),
            backgroundColor: Colors.green.shade700,
          ),
        );
        Navigator.pop(context, true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _serialController.dispose();
    _lengthCtrl.dispose();
    _shoulderCtrl.dispose();
    _chestCtrl.dispose();
    _waistCtrl.dispose();
    _sleeveCtrl.dispose();
    _neckCtrl.dispose();
    _damanCtrl.dispose();
    _shalwarLengthCtrl.dispose();
    _shalwarWaistCtrl.dispose();
    _shalwarBottomCtrl.dispose();
    _collarCtrl.dispose();
    _shapeCtrl.dispose();
    _notesCtrl.dispose();
    super.dispose();
  }

  Widget _numField(String label, TextEditingController ctrl) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: ctrl,
        decoration: InputDecoration(
          labelText: label,
          suffixText: 'in',
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEdit ? 'Edit Customer' : 'New Customer'),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              // Serial (read-only)
              TextFormField(
                controller: _serialController,
                decoration: const InputDecoration(
                  labelText: 'Serial Number',
                  prefixIcon: Icon(Icons.tag),
                ),
                readOnly: true,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 16),

              // Name
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Customer Name *',
                  prefixIcon: Icon(Icons.person),
                ),
                textCapitalization: TextCapitalization.words,
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Name is required' : null,
              ),
              const SizedBox(height: 16),

              // Phone
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  prefixIcon: Icon(Icons.phone),
                  hintText: '03xx-xxxxxxx',
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 28),

              // Kameez section
              Text('Kameez Measurements',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      )),
              const SizedBox(height: 12),
              _numField('Length', _lengthCtrl),
              _numField('Shoulder', _shoulderCtrl),
              _numField('Chest', _chestCtrl),
              _numField('Waist', _waistCtrl),
              _numField('Sleeve', _sleeveCtrl),
              _numField('Neck', _neckCtrl),
              _numField('Daman', _damanCtrl),

              const SizedBox(height: 20),
              Text('Shalwar Measurements',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      )),
              const SizedBox(height: 12),
              _numField('Shalwar Length', _shalwarLengthCtrl),
              _numField('Shalwar Waist', _shalwarWaistCtrl),
              _numField('Bottom (Pancha)', _shalwarBottomCtrl),

              const SizedBox(height: 20),
              Text('Style Preferences',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      )),
              const SizedBox(height: 12),
              TextFormField(
                controller: _collarCtrl,
                decoration: const InputDecoration(
                  labelText: 'Collar Style',
                  hintText: 'e.g. Ban, Chinese, Round...',
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _shapeCtrl,
                decoration: const InputDecoration(
                  labelText: 'Shape / Fit',
                  hintText: 'e.g. Regular, Slim, Loose...',
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _notesCtrl,
                decoration: const InputDecoration(
                  labelText: 'Notes / Special Instructions',
                  alignLabelWithHint: true,
                ),
                maxLines: 3,
              ),

              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _isLoading ? null : _save,
                child: _isLoading
                    ? const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                      )
                    : Text(_isEdit ? 'UPDATE CUSTOMER' : 'SAVE CUSTOMER'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
