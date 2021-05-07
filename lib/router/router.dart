import 'package:flutter/material.dart';
import 'package:fcFlutter/components/mine.dart';
import 'package:fcFlutter/components/hall.dart';
import 'package:fcFlutter/components/profile.dart';
import 'package:fcFlutter/components/other.dart';
import 'package:fcFlutter/components/music/musicPlayer.dart';
import 'package:fcFlutter/components/video/appPlayer.dart';
final routers={
  '/':(context,{arguments})=>Mine(),
  '/mine':(context,{arguments})=>Mine(arguments:arguments),
  'hall':(context,{arguments})=>Hall(),
  'profile':(context,{arguments})=>Profile(),
  'musicPlayer':(context,{arguments})=>MusicPlayer(),
  'youtubePlayer':(context,{arguments})=>AppPlayer(),
  'other':(context,{arguments})=>Other(),
};


var onGenerateRoute =(RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routers[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments)
      );
      return route;
    } else {
      final Route route = MaterialPageRoute(
          builder: (context) => pageContentBuilder(context)
      );
      return route;
    }
  }
};
