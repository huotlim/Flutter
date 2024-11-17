import 'package:flutter/material.dart';

class ProfileData {
  final String name;
  final String position;
  final String avatarUrl;
  final List<TileData> tiles;

  ProfileData({
    required this.name,
    required this.position,
    required this.avatarUrl,
    required this.tiles,
  });
}

class TileData {
  final IconData icon;
  final String title;
  final String value;

  TileData({
    required this.icon,
    required this.title,
    required this.value,
  });
}
final ProfileData stuProfile = ProfileData(
  name: 'lim huot',
  position: 'UX/UI',
  avatarUrl: 'assets/avatar.png',
  tiles: [
    TileData(
      icon: Icons.email,
      title: 'Email',
      value: 'huot@example.com',
    ),
    TileData(
      icon: Icons.phone,
      title: 'Phone',
      value: '+855 12 345 678',
    ),
    TileData(
      icon: Icons.school,
      title: 'University',
      value: 'CADT',
    ),
  ],
);
