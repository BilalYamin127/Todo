// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:firebase_project/model/task/task_model.dart';
import 'package:firebase_project/ui/auth/Screen/create_task_screen.dart';

class EditTaskScreen extends StatefulWidget {
  const EditTaskScreen({
    Key? key,
    required this.dataDoc,
    required this.id,
  }) : super(key: key);
  final Map<String, dynamic> dataDoc;
  final String id;
  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController taskNameController;
  late TextEditingController descriptionController;

  Categoryenum? selectedCategory;
  Priorityenum? selectedPriority;
  DateTime? _selectedDate;
  TimeOfDay? _selectedStartTime;
  TimeOfDay? _selectedEndTime;

  @override
  @override
  void initState() {
    super.initState();
    taskNameController =
        TextEditingController(text: widget.dataDoc['taskname']);
    descriptionController =
        TextEditingController(text: widget.dataDoc['taskDescription']);
    _selectedDate = DateTime.parse(widget.dataDoc['taskDate']);
    String firebaseCategory = widget.dataDoc['taskCategory'];
    selectedcat(firebaseCategory);
    String firebaseperiority = widget.dataDoc['taskPriority'];
    selectPeriority(firebaseperiority);

    // Assuming widget.dataDoc['taskStartTime'] is a string representing time in HH:mm format
    String? startTimeString = widget.dataDoc['taskStartTime'];
    selectedStartTime(startTimeString);
    String? endtimeString = widget.dataDoc['taskEndTime'];
    selectedEndtime(endtimeString);
  }

  void selectedStartTime(String? starttime) {
    if (starttime != null) {
      List<String> timeParts = starttime.split(':');
      int hours = int.parse(timeParts[0]);
      int minutes = int.parse(timeParts[1]);
      _selectedStartTime = TimeOfDay(hour: hours, minute: minutes);
    }
  }

  void selectedEndtime(String? endtime) {
    if (endtime != null) {
      List<String> timeParts = endtime.split(':');
      int hours = int.parse(timeParts[0]);
      int minutes = int.parse(timeParts[1]);
      _selectedEndTime = TimeOfDay(hour: hours, minute: minutes);
    }
  }

  void selectPeriority(String periority) {
    switch (periority) {
      case 'low':
        selectedPriority = Priorityenum.low;
        break;
      case 'medium':
        selectedPriority = Priorityenum.medium;
        break;
      case 'high':
        selectedPriority = Priorityenum.high;
        break;
      case 'dailytasks':
        selectedCategory = Categoryenum.dailytasks;
        break;
      default:
        // Handle unknown category string
        break;
    }
  }

  void selectedcat(String category) {
    switch (category) {
      case 'projects':
        selectedCategory = Categoryenum.projects;
        break;
      case 'work':
        selectedCategory = Categoryenum.work;
        break;
      case 'groceries':
        selectedCategory = Categoryenum.groceries;
        break;
      case 'dailytasks':
        selectedCategory = Categoryenum.dailytasks;
        break;
      default:
        // Handle unknown category string
        break;
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      DateFormat formatter = DateFormat('yyyy-MM-dd');
      String formattedDate = formatter.format(pickedDate);
      DateTime formattedDateTime = DateTime.parse(formattedDate);
      setState(() {
        _selectedDate = formattedDateTime;
      });
    }
  }

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: isStartTime
          ? _selectedStartTime ?? TimeOfDay.now()
          : _selectedEndTime ?? TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        if (isStartTime) {
          _selectedStartTime = pickedTime;
        } else {
          _selectedEndTime = pickedTime;
        }
      });
    }
  }

  // Map user-entered data to TaskModel
  TaskModel mapToTaskModel() {
    DateTime now = DateTime.now();
    var idd = now.microsecond.toString();

    return TaskModel(
      taskCategory: selectedCategory,
      taskPriority: selectedPriority,
      taskDate: _selectedDate,
      taskStartTime: _selectedStartTime,
      taskEndTime: _selectedEndTime,
      taskDescription: descriptionController.text,
      taskname: taskNameController.text,
      id: idd,
    );
  }

  Future<void> storeTaskInFirestore(TaskModel task, String id) async {
    try {
      final firestore = FirebaseFirestore.instance;
      final taskCollection = firestore.collection('Tasks');
      Map<String, dynamic> taskdata = task.toJson();

      await taskCollection.doc(id).update(taskdata);
      _formKey.currentState?.reset();
      print('User data Update in Firestore successfully');

      Navigator.pop(context);

      // Show success message or navigate to another screen
    } catch (e) {
      // Handle errors
      print('Error adding task: $e');
      // Show error message
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit your  task'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Task Name',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    // const SizedBox(height: 8),
                    SizedBox(
                      height: 70,
                      child: TextFormField(
                        controller: taskNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter task name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter task name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                      ),
                    ),
                    // const SizedBox(height: 16),
                    const Text(
                      'Category',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    // const SizedBox(height: 15),
                    SizedBox(
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: Categoryenum.values.map((category) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCategory = category;
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 90,
                              margin: const EdgeInsets.only(bottom: 8),
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: selectedCategory == category
                                    ? const Color.fromARGB(255, 151, 71, 255)
                                    : const Color.fromARGB(255, 224, 200, 255),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  category.toString().split('.').last,
                                  style: TextStyle(
                                    color: selectedCategory == category
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    const Text(
                      'Date and Time ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 70,
                      child: TextFormField(
                        readOnly: true,
                        onTap: () => _selectDate(context),
                        validator: (value) {
                          if (_selectedDate == null) {
                            return 'Please select a date';
                          }
                          return null;
                        },
                        controller: TextEditingController(
                            text: _selectedDate != null
                                ? DateFormat.yMd().format(_selectedDate!)
                                : ''),
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.calendar_today),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                          ),
                        ),
                      ),
                    ),
                    // const SizedBox(height: 12),
                    SizedBox(
                      height: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text(
                                  'Starting Time',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  height: 80,
                                  child: TextFormField(
                                    readOnly: true,
                                    onTap: () => _selectTime(context, true),
                                    validator: (value) {
                                      if (_selectedStartTime == null) {
                                        return 'Please select starting time';
                                      }
                                      return null;
                                    },
                                    controller: TextEditingController(
                                      text: _selectedStartTime != null
                                          ? _selectedStartTime!.format(context)
                                          : 'starting time',
                                    ),
                                    decoration: const InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.access_time,
                                        size: 20,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(24)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text(
                                  'Ending Time',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                TextFormField(
                                  readOnly: true,
                                  onTap: () => _selectTime(context, false),
                                  validator: (value) {
                                    if (_selectedEndTime == null) {
                                      return 'Please select ending time';
                                    }
                                    return null;
                                  },
                                  controller: TextEditingController(
                                    text: _selectedEndTime != null
                                        ? _selectedEndTime!.format(context)
                                        : 'Ending Time',
                                  ),
                                  decoration: const InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.access_time,
                                      size: 20,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(24)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      'Priority',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    // const SizedBox(height: 15),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: Priorityenum.values.map((priority) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedPriority = priority;
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 90,
                              margin: const EdgeInsets.only(bottom: 8),
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: selectedPriority == priority
                                    ? const Color.fromARGB(255, 151, 71, 255)
                                    : const Color.fromARGB(255, 224, 200, 255),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  priority.toString().split('.').last,
                                  style: TextStyle(
                                    color: selectedPriority == priority
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const Text(
                      'Description',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      child: TextFormField(
                        controller: descriptionController,
                        maxLines: 2,
                        decoration: const InputDecoration(
                          hintText: 'Enter description',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter description';
                          }
                          return null;
                        },
                      ),
                    ),
                    // const SizedBox(height: 12),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: GestureDetector(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  TaskModel task = mapToTaskModel();
                                  storeTaskInFirestore(task, widget.id);
                                }
                              },
                              child: Container(
                                height: 40,
                                width: 200,
                                color: const Color.fromARGB(255, 151, 71, 255),
                                child: const Center(
                                  child: Text(
                                    'Save Changes',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                'assets/images/create_task_bottom_right.png',
                height: 70,
                width: 100,
              ))
        ]),
      ),
    );
  }
}
