import 'package:flutter/material.dart';

class MenuItem{
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  MenuItem({
    required this.title, 
    required this.subtitle, 
    required this.link, 
    required this.icon
  });
}


final appMenuItem = <MenuItem>[
  MenuItem(
    title: "Contador", 
    subtitle: "Contador con riverpod", 
    link: "/counter-river", 
    icon: Icons.add
  ),
  MenuItem(
    title: "Botones", 
    subtitle: "Botones de flutter", 
    link: "/buttons", 
    icon: Icons.smart_button_outlined
  ),
  MenuItem(
    title: "Snackbar", 
    subtitle: "Diálogos", 
    link: "/snackbar", 
    icon: Icons.alarm
  ),
  MenuItem(
    title: "Progress", 
    subtitle: "Progress indicator", 
    link: "/progress", 
    icon: Icons.refresh_rounded
  ),
  MenuItem(
    title: "Animated", 
    subtitle: "Animated container", 
    link: "/animated", 
    icon: Icons.check_box_outline_blank_rounded
  ),
  MenuItem(
    title: "UI Controls", 
    subtitle: "Controles de flutter", 
    link: "/ui-controls", 
    icon: Icons.abc
  ),
  MenuItem(
    title: "Infinite Scroll", 
    subtitle: "Scroll Infinito", 
    link: "/infinite", 
    icon: Icons.list_alt_rounded
  ),
  MenuItem(
    title: "Introducción", 
    subtitle: "Pageview con introducción", 
    link: "/tutorial", 
    icon: Icons.accessible_rounded
  ),
  MenuItem(
    title: "Cambiar tema", 
    subtitle: "Cambiar tema de la aplicación", 
    link: "/theme", 
    icon: Icons.color_lens_outlined
  ),
  
];