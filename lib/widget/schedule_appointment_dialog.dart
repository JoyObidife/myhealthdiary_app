import 'package:flutter/material.dart';

class ScheduleAppointmentDialog extends StatefulWidget {
  const ScheduleAppointmentDialog({super.key});

  @override
  State<ScheduleAppointmentDialog> createState() =>
      _ScheduleAppointmentDialogState();
}

class _ScheduleAppointmentDialogState extends State<ScheduleAppointmentDialog> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedType;
  final TextEditingController _providerController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  final List<String> _appointmentTypes = [
    'General Checkup',
    'Dental',
    'Cardiology',
    'Dermatology',
    'Therapy',
    'Eye Exam',
    'Other'
  ];

  @override
  void dispose() {
    _providerController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text =
            "${picked.month}/${picked.day}/${picked.year}";
      });
    }
  }

  Future<void> _pickTime(BuildContext context) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
        _timeController.text = picked.format(context);
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Print form data to console
      print('--- Appointment Scheduled ---');
      print('Type: $_selectedType');
      print('Provider: ${_providerController.text}');
      print('Date: ${_dateController.text}');
      print('Time: ${_timeController.text}');
      print('Notes: ${_notesController.text}');

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Appointment successfully scheduled!'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );

      // Close dialog
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: Colors.white,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Schedule Appointment",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.of(context).pop(),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Appointment Type Dropdown
                  DropdownButtonFormField<String>(
                    value: _selectedType,
                    decoration: _inputDecoration("Appointment Type"),
                    hint: const Text("Select type"),
                    items: _appointmentTypes.map((String type) {
                      return DropdownMenuItem<String>(
                        value: type,
                        child: Text(type),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedType = newValue;
                      });
                    },
                    validator: (value) =>
                        value == null ? 'Please select an appointment type' : null,
                  ),
                  const SizedBox(height: 16),

                  // Provider Field
                  TextFormField(
                    controller: _providerController,
                    decoration: _inputDecoration("Doctor/Provider",
                        hintText: "e.g., Dr. Sarah Johnson"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a provider name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),

                  // Date and Time Row
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _dateController,
                          decoration: _inputDecoration("Date",
                              suffixIcon: Icons.calendar_today),
                          readOnly: true,
                          onTap: () => _pickDate(context),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Select Date';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: _timeController,
                          decoration: _inputDecoration("Time",
                              suffixIcon: Icons.access_time),
                          readOnly: true,
                          onTap: () => _pickTime(context),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Select Time';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                   SizedBox(height: 16),

                  // Notes Field
                  TextFormField(
                    controller: _notesController,
                    decoration: _inputDecoration("Notes (Optional)",
                        hintText: "Add any notes about this appointment..."),
                    maxLines: 3,
                  ),
               SizedBox(height: 32),

                  // Action Buttons
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: Colors.grey.shade200,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _submitForm,
                          style: ElevatedButton.styleFrom(
                            padding:  EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            "Schedule Appointment",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label,
      {String? hintText, IconData? suffixIcon}) {
    return InputDecoration(
      labelText: label,
      hintText: hintText,
      filled: true,
      fillColor: Colors.grey.shade50,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.blue, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      suffixIcon: suffixIcon != null ? Icon(suffixIcon, color: Colors.blue) : null,
    );
  }
}
