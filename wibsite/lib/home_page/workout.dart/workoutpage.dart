import 'package:flutter/material.dart';

import 'package:wibsite/home_page/workout.dart/vidioplayer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// Make sure to import the VideoPlayerPage

class WorkoutPage extends StatelessWidget {
  final List<Map<String, String>> videos = [
    {
      'id': 'o2tDhbgYEdk',
      'title': 'Workout Video 1',
      'description': 'This is a description for video 1.'
    },
    {
      'id': '1Lg5rJSKjZk',
      'title': 'Workout Video 2',
      'description': 'This is a description for video 2.'
    },
    {
      'id': 'LFJ9ptKsQUo',
      'title': 'Workout Video 3',
      'description': 'This is a description for video 3.'
    },
    {
      'id': 'qdGtc6-c0F0',
      'title': 'Workout Video 4',
      'description': 'This is a description for video 4.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Display two videos per row
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.7, // Adjust the aspect ratio for layout
        ),
        itemCount: videos.length,
        itemBuilder: (context, index) {
          final video = videos[index];

          return Card(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    // When a video is tapped, navigate to the VideoPlayerPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            VideoPlayerPage(videoId: video['id']!),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      YoutubePlayer(
                        controller: YoutubePlayerController(
                          initialVideoId: video['id']!,
                          flags: YoutubePlayerFlags(
                            autoPlay: false,
                            mute: false,
                          ),
                        ),
                        showVideoProgressIndicator: true,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              video['title']!,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(video['description']!),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Add to My List'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
