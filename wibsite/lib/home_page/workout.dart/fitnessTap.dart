import 'package:flutter/material.dart';
import 'package:wibsite/home_page/workout.dart/vidioplayer.dart'; // Ensure this import is correct
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FitnessTab extends StatelessWidget {
  final List<Map<String, String>> videos = [
    {
      'id': '1iqzlhL95cI',
      'title': 'Workout Video 1',
      'description': 'This is a description for video 1.'
    },
    {
      'id': '3p8EBPVZ2Iw',
      'title': 'Workout Video 2',
      'description': 'This is a description for video 2.'
    },
    {
      'id': 'JLdSuFF62AI',
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
      backgroundColor: Colors.black,
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
            color: Colors.black,
            child: GestureDetector(
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Display a thumbnail of the video instead of playing it
                    Image.network(
                      YoutubePlayer.getThumbnail(videoId: video['id']!),
                      fit: BoxFit.cover,
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
                                color: Colors.white),
                          ),
                          SizedBox(height: 8),
                          Text(
                            video['description']!,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Color(0xffD5FF5F), // Set your desired color here
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Success"),
                              content: Text("You added the item to your list."),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Close the dialog
                                  },
                                  child: Text("OK"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text(
                        'Add to My List',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 11,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
