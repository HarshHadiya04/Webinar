import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CreateEventPage extends StatefulWidget {
  @override
  _CreateEventPageState createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  final _formKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  bool isSubmitting = false;

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final locationController = TextEditingController();
  final organizerNameController = TextEditingController();
  final organizerContactController = TextEditingController();
  final organizerEmailController = TextEditingController();
  final ticketPriceController = TextEditingController();
  final imageUrlController = TextEditingController();
  final capacityController = TextEditingController();
  String? selectedCategory;
  final List<String> categories = ['workshop', 'conference', 'seminar', 'other'];

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate() || selectedDate == null || selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all required fields')),
      );
      return;
    }

    setState(() => isSubmitting = true);

    try {
      String formattedTime = '${selectedTime!.hour.toString().padLeft(2, '0')}:${selectedTime!.minute.toString().padLeft(2, '0')}';

      final requestBody = {
        'title': titleController.text.trim(),
        'description': descriptionController.text.trim(),
        'date': selectedDate!.toIso8601String(),
        'time': formattedTime,
        'venue': locationController.text.trim(),
        'category': selectedCategory,
        'organizer': {
          'name': organizerNameController.text.trim(),
          'contact': organizerContactController.text.trim(),
          'email': organizerEmailController.text.trim(),
        },
        'ticketPrice': double.tryParse(ticketPriceController.text) ?? 0,
        'capacity': int.parse(capacityController.text),
        'isActive': true,
        'image': imageUrlController.text.trim(),
      };

      print('Sending request to: http://localhost:5000/api/events');
      print('Request body: ${json.encode(requestBody)}');

      final response = await http.post(
        Uri.parse('http://localhost:5000/api/events'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode(requestBody),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 201) {
        Navigator.pop(context, true); // Pass true to indicate success
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Event created successfully!')),
        );
      } else {
        final errorData = json.decode(response.body);
        throw Exception(errorData['message'] ?? 'Failed to create event');
      }
    } catch (e) {
      print('Error creating event: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error creating event: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() => isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Create Event'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: titleController,
                            decoration: InputDecoration(
                              labelText: 'Title *',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor: Colors.grey[50],
                            ),
                            validator: (v) => v?.isEmpty ?? true ? 'Required' : null,
                          ),
                          SizedBox(height: 16),
                          TextFormField(
                            controller: descriptionController,
                            decoration: InputDecoration(
                              labelText: 'Description *',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor: Colors.grey[50],
                            ),
                            maxLines: 3,
                            validator: (v) => v?.isEmpty ?? true ? 'Required' : null,
                          ),
                          ListTile(
                            title: Text(selectedDate == null 
                              ? 'Select Date *' 
                              : 'Date: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'),
                            trailing: Icon(Icons.calendar_today),
                            onTap: () async {
                              final date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now().add(Duration(days: 365)),
                              );
                              if (date != null) setState(() => selectedDate = date);
                            },
                          ),
                          ListTile(
                            title: Text(selectedTime == null 
                              ? 'Select Time *' 
                              : 'Time: ${selectedTime!.format(context)}'),
                            trailing: Icon(Icons.access_time),
                            onTap: () async {
                              final time = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                              if (time != null) setState(() => selectedTime = time);
                            },
                          ),
                          Text('Organizer Details', 
                            style: Theme.of(context).textTheme.titleMedium
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: organizerNameController,
                            decoration: InputDecoration(
                              labelText: 'Organizer Name *',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor: Colors.grey[50],
                            ),
                            validator: (v) => v?.isEmpty ?? true ? 'Required' : null,
                          ),
                          TextFormField(
                            controller: organizerContactController,
                            decoration: InputDecoration(
                              labelText: 'Contact Number',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor: Colors.grey[50],
                            ),
                            keyboardType: TextInputType.phone,
                          ),
                          TextFormField(
                            controller: organizerEmailController,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor: Colors.grey[50],
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: 20),
                          Text('Event Details', 
                            style: Theme.of(context).textTheme.titleMedium
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: locationController,
                            decoration: InputDecoration(
                              labelText: 'Venue *',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor: Colors.grey[50],
                            ),
                            validator: (v) => v?.isEmpty ?? true ? 'Required' : null,
                          ),
                          TextFormField(
                            controller: capacityController,
                            decoration: InputDecoration(
                              labelText: 'Capacity *',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor: Colors.grey[50],
                            ),
                            keyboardType: TextInputType.number,
                            validator: (v) => v?.isEmpty ?? true ? 'Required' : null,
                          ),
                          TextFormField(
                            controller: ticketPriceController,
                            decoration: InputDecoration(
                              labelText: 'Ticket Price',
                              hintText: '0 for free event',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor: Colors.grey[50],
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          TextFormField(
                            controller: imageUrlController,
                            decoration: InputDecoration(
                              labelText: 'Image URL',
                              hintText: 'Optional event image URL',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor: Colors.grey[50],
                            ),
                          ),
                          DropdownButtonFormField<String>(
                            value: selectedCategory,
                            decoration: InputDecoration(labelText: 'Category *'),
                            items: categories.map((String category) {
                              return DropdownMenuItem(
                                value: category,
                                child: Text(category.toUpperCase()),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedCategory = newValue;
                              });
                            },
                            validator: (value) => value == null ? 'Required' : null,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Create Event'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isSubmitting)
            Container(
              color: Colors.black26,
              child: Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    locationController.dispose();
    capacityController.dispose();
    organizerNameController.dispose();
    organizerContactController.dispose();
    organizerEmailController.dispose();
    ticketPriceController.dispose();
    imageUrlController.dispose();
    super.dispose();
  }
}
