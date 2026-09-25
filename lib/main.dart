import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LiveDemoForm(),
    );
  }
}

class LiveDemoForm extends StatefulWidget {
  const LiveDemoForm({Key? key}) : super(key: key);

  @override
  State<LiveDemoForm> createState() => _LiveDemoFormState();
}

class _LiveDemoFormState extends State<LiveDemoForm> {
  // Controllers for text inputs
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Form state variables
  String? _sex = 'Male';
  bool _dataScience = false;
  bool _fullStack = true;
  bool _mobileApp = false;
  double _tuitionValue = 20.0;
  String _submissionStatus = '';

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Clear form handler
  void _clearForm() {
    setState(() {
      _usernameController.clear();
      _passwordController.clear();
      _sex = 'Male';
      _dataScience = false;
      _fullStack = false;
      _mobileApp = false;
      _tuitionValue = 20.0;
      _submissionStatus = '';
    });
  }

  // Submit form handler
  void _submitForm() {
    setState(() {
      _submissionStatus = 'Submitted successfully!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Title
              const Center(
                child: Text(
                  'Welcome Back!!!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Username Field
              const Text('Username', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  isDense: true,
                ),
              ),
              const SizedBox(height: 15),

              // Password Field
              const Text('Password', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  isDense: true,
                ),
              ),
              const SizedBox(height: 15),

              // Sex Selection (Radio Buttons)
              const Text('Sex', style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Radio<String>(
                    value: 'Male',
                    groupValue: _sex,
                    onChanged: (val) => setState(() => _sex = val),
                  ),
                  const Text('Male'),
                  const SizedBox(width: 20),
                  Radio<String>(
                    value: 'Female',
                    groupValue: _sex,
                    onChanged: (val) => setState(() => _sex = val),
                  ),
                  const Text('Female'),
                ],
              ),
              const SizedBox(height: 10),

              // Courses Selection (Checkboxes)
              const Text('Courses', style: TextStyle(fontWeight: FontWeight.bold)),
              CheckboxListTile(
                title: const Text('Data science'),
                value: _dataScience,
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                dense: true,
                onChanged: (val) => setState(() => _dataScience = val ?? false),
              ),
              CheckboxListTile(
                title: const Text('Full stack'),
                value: _fullStack,
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                dense: true,
                onChanged: (val) => setState(() => _fullStack = val ?? false),
              ),
              CheckboxListTile(
                title: const Text('Mobile application'),
                value: _mobileApp,
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                dense: true,
                onChanged: (val) => setState(() => _mobileApp = val ?? false),
              ),
              const SizedBox(height: 10),

              // Tuition Slider
              const Text('Tuition', style: TextStyle(fontWeight: FontWeight.bold)),
              Slider(
                value: _tuitionValue,
                min: 0,
                max: 100,
                divisions: 10,
                label: _tuitionValue.round().toString(),
                onChanged: (val) => setState(() => _tuitionValue = val),
              ),
              const SizedBox(height: 20),

              // Action Buttons (Submit & Clear)
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber[700],
                        foregroundColor: Colors.white,
                      ),
                      onPressed: _submitForm,
                      child: const Text('Submit'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[700],
                        foregroundColor: Colors.white,
                      ),
                      onPressed: _clearForm,
                      child: const Text('Clear'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Submission Feedback Banner
              if (_submissionStatus.isNotEmpty)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.amber[100],
                    border: Border.all(color: Colors.amber.shade300),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    _submissionStatus,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}