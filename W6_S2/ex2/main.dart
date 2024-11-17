import 'package:flutter/material.dart';
import 'card/pf_tile.dart';
import 'info/pf_info.dart';

void main() {
  runApp(const ProfileApp());
}

const Color mainColor = Color(0xff5E9FCD);

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(profileData: stuProfile),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final ProfileData profileData;

  const ProfileScreen({super.key, required this.profileData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor.withAlpha(100),
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text(
          'CADT Student Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(profileData.avatarUrl),
            ),
            const SizedBox(height: 20),
            Text(
              profileData.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: mainColor,
              ),
            ),
            Text(
              profileData.position,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: profileData.tiles.length,
                itemBuilder: (context, index) {
                  final tile = profileData.tiles[index];
                  return ProfileTile(
                    icon: tile.icon,
                    title: tile.title,
                    data: tile.value,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
