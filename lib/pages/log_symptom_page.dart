import 'package:flutter/material.dart';

class LogSymptomPage extends StatefulWidget {
  const LogSymptomPage({super.key});

  @override
  State<LogSymptomPage> createState() => _LogSymptomPageState();
}

class _LogSymptomPageState extends State<LogSymptomPage> {
  double _painLevel = 5;
  double _hydrationLevel = 1; // 0: Low, 1: Medium, 2: High
  final TextEditingController _notesController = TextEditingController();

  String get _hydrationLabel {
    if (_hydrationLevel == 0) return 'Low';
    if (_hydrationLevel == 1) return 'Medium';
    return 'High';
  }

  Color get _hydrationColor {
    if (_hydrationLevel == 0) return Colors.orange;
    if (_hydrationLevel == 1) return Colors.green;
    return Colors.blue;
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        backgroundColor: const Color(0xFF5B9BD5),
        elevation: 2,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          "Log Today's Symptoms",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Pain Level Card
              _buildCard(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Pain Level",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "${_painLevel.round()}/10",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF5B9BD5),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: const Color(0xFF5B9BD5),
                        inactiveTrackColor: const Color(0xFFE0E0E0),
                        trackHeight: 6.0,
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 12.0),
                        thumbColor: Colors.white,
                        overlayColor: const Color(0x295B9BD5),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 24.0),
                      ),
                      child: Slider(
                        value: _painLevel,
                        min: 0,
                        max: 10,
                        divisions: 10,
                        onChanged: (value) {
                          setState(() {
                            _painLevel = value;
                          });
                        },
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "No Pain",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        Text(
                          "Severe",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Hydration Level Card
              _buildCard(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Hydration Level",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          _hydrationLabel,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: _hydrationColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: const Color(0xFF5B9BD5),
                        inactiveTrackColor: const Color(0xFFE0E0E0),
                        trackHeight: 6.0,
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 12.0),
                        thumbColor: Colors.white,
                        overlayColor: const Color(0x295B9BD5),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 24.0),
                      ),
                      child: Slider(
                        value: _hydrationLevel,
                        min: 0,
                        max: 2,
                        divisions: 2,
                        label: _hydrationLabel,
                        onChanged: (value) {
                          setState(() {
                            _hydrationLevel = value;
                          });
                        },
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Low",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        Text(
                          "High",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Notes / Symptoms Section
              _buildCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Notes or Symptoms",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _notesController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFF5F5F5),
                        hintText:
                            "Describe how you’re feeling today, any symptoms you’re experiencing, or triggers you noticed…",
                        hintStyle:
                            const TextStyle(fontSize: 14, color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.all(16),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Action Buttons
              SizedBox(
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Implement save functionality
                    // For now, just pop back
                     ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Entry Saved!')),
                      );
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5B9BD5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: const Text(
                    "Save Entry",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 45,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.grey, width: 0.5),
                     backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}
