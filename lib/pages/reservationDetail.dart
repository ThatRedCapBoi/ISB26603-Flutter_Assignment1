import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date and time formatting

import 'package:mobile_assignment_1/pages/packageCatalog.dart';

class ReservationPage extends StatefulWidget {
  const ReservationPage({super.key});

  @override
  State<ReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _reservationDateController = TextEditingController();
  TextEditingController _reservationTimeController = TextEditingController();
  TimeOfDay? _dineInStartTime;
  int? _dineInDuration;
  TextEditingController _additionalRequestsController = TextEditingController();
  TextEditingController _numberOfGuestsController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (picked != null) {
      setState(() {
        _reservationDateController.text = DateFormat(
          'yyyy-MM-dd',
        ).format(picked);
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _reservationTimeController.text = picked.format(context);
      });
    }
  }

  Future<void> _selectDineInTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _dineInStartTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reservation')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: 'Address'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                    // Validation Phone Number Format
                    return 'Please enter a valid phone number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  ).hasMatch(value)) {
                    // Validation Email Format
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      controller: _reservationDateController,
                      decoration: const InputDecoration(
                        labelText: 'Reservation Date',
                      ),
                      readOnly: true,
                      onTap: () => _selectDate(context),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a reservation date'; // Validation Date Chosen or not
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: _reservationTimeController,
                      decoration: const InputDecoration(
                        labelText: 'Reservation Time',
                      ),
                      readOnly: true,
                      onTap: () => _selectTime(context),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a reservation time'; // Validation Time Chosen or not
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Expanded(
                    child: InkWell(
                      onTap: () => _selectDineInTime(context),
                      child: InputDecorator(
                        decoration: const InputDecoration(
                          labelText: 'Dine-in Start Time',
                          border: OutlineInputBorder(),
                        ),
                        child: Text(
                          _dineInStartTime == null
                              ? 'Select Time'
                              : _dineInStartTime!.format(context),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: DropdownButtonFormField<int>(
                      decoration: const InputDecoration(
                        labelText: 'Dine-in Duration (hours)',
                      ),
                      value: _dineInDuration,
                      items:
                          [3, 4, 5]
                              .map(
                                (duration) => DropdownMenuItem(
                                  value: duration,
                                  child: Text('$duration hours'),
                                ),
                              )
                              .toList(),
                      onChanged: (value) {
                        setState(() {
                          _dineInDuration = value;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a dine-in duration'; // Validation Duration Chosen or not
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: _additionalRequestsController,
                decoration: const InputDecoration(
                  labelText: 'Additional Requests (Optional)',
                ),
                maxLines: 2,
              ),
              TextFormField(
                controller: _numberOfGuestsController,
                decoration: const InputDecoration(
                  labelText: 'Number of Guests',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the number of guests';
                  }
                  if (int.tryParse(value) == null || int.parse(value) <= 0) {
                    return 'Please enter a valid number of guests';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process the reservation data
                    String name = _nameController.text;
                    String address = _addressController.text;
                    String phone = _phoneController.text;
                    String email = _emailController.text;
                    String reservationDate = _reservationDateController.text;
                    String reservationTime = _reservationTimeController.text;
                    String? dineInStartTimeFormatted = _dineInStartTime?.format(
                      context,
                    );
                    int? dineInEndTime =
                        _dineInStartTime != null && _dineInDuration != null
                            ? _dineInStartTime!.hour + _dineInDuration!
                            : null;
                    String additionalRequests =
                        _additionalRequestsController.text;
                    int numberOfGuests = int.parse(
                      _numberOfGuestsController.text,
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PackageCatalogPage(),
                      ),
                    );
                    // You can now use this data to save to a database or display it.
                    // For this example, we'll just display it.
                    // showDialog(
                    //   context: context,
                    //   builder: (context) {
                    //     return AlertDialog(
                    //       title: const Text('Reservation Details'),
                    //       content: SingleChildScrollView(
                    //         child: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,s
                    //           children: <Widget>[
                    //             Text('Name: $name'),
                    //             Text('Address: $address'),
                    //             Text('Phone: $phone'),
                    //             Text('Email: $email'),
                    //             Text('Reservation Date: $reservationDate'),
                    //             Text('Reservation Time: $reservationTime'),
                    //             if (dineInStartTimeFormatted != null)
                    //               Text('Dine-in Start Time: $dineInStartTimeFormatted'),
                    //             if (_dineInDuration != null)
                    //               Text('Dine-in Duration: ${_dineInDuration} hours'),
                    //             if (dineInEndTime != null)
                    //               Text('Approximate Dine-in End Time: $dineInEndTime:00'),
                    //             if (additionalRequests.isNotEmpty)
                    //               Text('Additional Requests: $additionalRequests'),
                    //             Text('Number of Guests: $numberOfGuests'),
                    //           ],
                    //         ),
                    //       ),
                    //       actions: <Widget>[
                    //         TextButton(
                    //           onPressed: () {
                    //             Navigator.of(context).pop();
                    //           },
                    //           child: const Text('OK'),
                    //         ),
                    //       ],
                    //     );
                    //   },
                    // );
                  }
                },
                child: const Text('Make Reservation'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
