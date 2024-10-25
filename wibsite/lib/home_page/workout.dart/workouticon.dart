import 'package:flutter/material.dart';
import 'package:wibsite/home_page/workout.dart/fitnessTap.dart';
import 'package:wibsite/home_page/workout.dart/workoutpage.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// Define the Workout model
class Workout {
  final String title;
  final String imageUrl;
  final int duration;
  final String difficulty;
  final List<WorkoutVideo> videos;

  Workout({
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.difficulty,
    required this.videos,
  });
}

// Define the WorkoutVideo model
class WorkoutVideo {
  final String title;
  final String videoUrl;

  WorkoutVideo({required this.title, required this.videoUrl});
}

class workout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: home(),
    );
  }
}

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: TabBar(
            tabs: [
              Tab(text: 'Workouts'),
              Tab(text: 'Fitness'),
              Tab(text: 'Plans'),
              Tab(text: 'Training'),
            ],
            indicatorColor: Colors.white, // Customize tab indicator if needed
          ),
        ),
        body: TabBarView(
          children: [
            WorkoutPage(),
            FitnessTab(),
//PlansTab(),
            // TrainingTab(),
          ],
        ),
      ),
    );
  }
}



// Dummy tabs for other categories
