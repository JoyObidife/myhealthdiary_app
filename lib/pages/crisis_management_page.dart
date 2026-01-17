import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CrisisManagementPage extends StatelessWidget {
  const CrisisManagementPage({super.key});

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (!await launchUrl(launchUri)) {
      throw Exception('Could not launch $launchUri');
    }
  }

  Future<void> _openMap(String location) async {
    final Uri launchUri = Uri.parse('https://www.google.com/maps/search/?api=1&query=$location');
    if (!await launchUrl(launchUri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $launchUri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400, 
      body: SingleChildScrollView(
        child: Column(
          children: [
           
            Container(
              padding: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFE86B6B), Color(0xFFFF8A80)], // Red/coral gradient
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                   SizedBox(height: 16),
                 Text(
                    "Crisis Management",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                 SizedBox(height: 4),
                  Text(
                    "Immediate help and resources",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 2. Emergency Call Button
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 10, bottom: 24),
                    child: ElevatedButton(
                      onPressed: () => _makePhoneCall('911'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:  Color(0xFFE86B6B), 
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                        elevation: 4,
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white.withAlpha(50),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.warning_amber_rounded, color: Colors.white, size: 36),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Call Emergency Services",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Tap to dial 911",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // 3. During a Crisis Section
                  const Text(
                    "During a Crisis",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF212121),
                    ),
                  ),
                   SizedBox(height: 12),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1.1,
                    children: [
                      _buildActionCard(
                        title: "Hydrate",
                        description: "Drink plenty of water immediately",
                        icon: Icons.water_drop,
                      ),
                      _buildActionCard(
                        title: "Breathe",
                        description: "Take slow, deep breaths to stay calm",
                        icon: Icons.air,
                      ),
                      _buildActionCard(
                        title: "Temperature",
                        description: "Apply warm compress to painful areas",
                        icon: Icons.thermostat,
                      ),
                      _buildActionCard(
                        title: "Rest",
                        description: "Find a comfortable position and rest",
                        icon: Icons.favorite,
                      ),
                    ],
                  ),

                  // 4. Emergency Contacts Section
                  const SizedBox(height: 24),
                  const Text(
                    "Emergency Contacts",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF212121),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildContactCard("Dr. Sarah Johnson", "Primary Care", "555-0123"),
                  _buildContactCard("Emergency Services", "24/7 Helpline", "555-0199"),
                  _buildContactCard("Mom", "Emergency Contact", "555-0144"),

                  // 5. Nearby Hospitals Section
                  const SizedBox(height: 24),
                  const Text(
                    "Nearby Hospitals",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF212121),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildHospitalCard("City General Hospital", "1.2 miles"),
                  _buildHospitalCard("St. Mary Medical Center", "2.5 miles"),
                  _buildHospitalCard("University Hospital", "3.8 miles"),

                  // 6. When to Seek Help Section
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE3F2FD), // Light blue BG
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.report_problem_outlined, color: Color(0xFF2196F3)), // Primary Blue
                            SizedBox(width: 8),
                            Text(
                              "When to Seek Help",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2196F3),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        _buildHelpBullet("Severe chest pain"),
                        _buildHelpBullet("Sudden weakness or numbness"),
                        _buildHelpBullet("Severe pain not relieved by meds"),
                        _buildHelpBullet("High fever with stiff neck"),
                        _buildHelpBullet("Severe headache or vision changes"),
                      ],
                    ),
                  ),
                   SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionCard({
    required String title,
    required String description,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFE3F2FD), // Light blue circle
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: const Color(0xFF2196F3), size: 28),
          ),
           SizedBox(height: 12),
          Text(
            title,
            style:  TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
         SizedBox(height: 4),
          Text(
            description,
            textAlign: TextAlign.center,
            style:  TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard(String name, String role, String phone) {
    return Container(
      margin:  EdgeInsets.only(bottom: 12),
      padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 3,
            offset:  Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color(0xFFE3F2FD), 
              shape: BoxShape.circle,
            ),
            child:  Icon(Icons.person, color: Color(0xFF2196F3)),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  role,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => _makePhoneCall(phone),
            style: IconButton.styleFrom(
              backgroundColor: const Color(0xFF2196F3),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(10),
            ),
             icon: const Icon(Icons.phone, size: 20),
          ),
        ],
      ),
    );
  }

  Widget _buildHospitalCard(String name, String distance) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color(0xFFE8F5E9), // Light green BG
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.local_hospital, color: Color(0xFF4CAF50)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  distance,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => _openMap(name),
            icon: const Icon(Icons.directions, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildHelpBullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 6),
            child: Icon(Icons.circle, size: 6, color: Color(0xFF2196F3)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(height: 1.4, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
