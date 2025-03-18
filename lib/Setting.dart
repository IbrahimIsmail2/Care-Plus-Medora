import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isNotificationsEnabled = true;
  bool isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () {},
        ),
        title: Text(
          "Setting",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black, size: 22),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          _buildCenteredSettingItem(
              Icons.notifications_outlined, "Notifications",
              trailing: Switch(
                value: isNotificationsEnabled,
                activeColor: Color(0xFF56CD54),
                onChanged: (value) {
                  setState(() {
                    isNotificationsEnabled = value;
                  });
                },
              )),
          _buildCenteredSettingItem(Icons.dark_mode_outlined, "Dark mode",
              trailing: Switch(
                value: isDarkModeEnabled,
                activeColor: Color(0xFF8ACBDA),
                onChanged: (value) {
                  setState(() {
                    isDarkModeEnabled = value;
                  });
                },
              )),
          _buildCenteredSettingItem(Icons.lock_outline, "Password",
              trailing: Icon(Icons.arrow_forward_ios,
                  size: 18, color: Colors.black54)),
          _buildCenteredSettingItem(Icons.language_outlined, "Language",
              trailing: Icon(Icons.arrow_forward_ios,
                  size: 18, color: Colors.black54)),
          _buildCenteredSettingItem(Icons.logout_outlined, "Logout",
              trailing: Icon(Icons.arrow_forward_ios,
                  size: 18, color: Colors.black54)),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF8ACBDA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                minimumSize: Size(213, 50),
              ),
              child: Text(
                "Save",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCenteredSettingItem(IconData icon, String title,
      {Widget? trailing}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Center(
        child: Container(
          width: 314,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Color(0x0F0F0FF2), width: 1.5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                blurRadius: 6,
                offset: Offset(0, 3),
              )
            ],
          ),
          child: ListTile(
            leading: Icon(icon, color: Colors.black, size: 24),
            title: Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            trailing: trailing,
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
