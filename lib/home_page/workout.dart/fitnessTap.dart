import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:wibsite/home_page/workout.dart/vidioplayer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FitnessTab extends StatefulWidget {
  @override
  _WorkoutPageState createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<FitnessTab> {
  List<Map<String, String>> chestVideos = [];
  List<Map<String, String>> shoulderVideos = [];
  List<Map<String, String>> handsVideos = [];
  List<Map<String, String>> backVideos = [];
  List<Map<String, String>> legsVideos = [];

  @override
  void initState() {
    super.initState();
    searchById("fitins.gmail", 'fitins');
  }

  void searchById(String id, String category) async {
    final url = Uri.parse('http://10.0.2.2:3000/pro/$id');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print("ezzzzzzzzzzzzzzzzzzzzz");
        print(data);

        if (data['fitnes'] != null && data['fitnes'] is List) {
          setState(() {
            List<Map<String, String>> videoList = [];
            for (var video in data['fitnes']) {
              if (video.length >= 3) {
                videoList.add({
                  'id': video[0],
                  'title': video[1],
                  'description': video[2],
                });
              }
            }
            if (category == 'fitins') {
              chestVideos = videoList;
            } else if (category == 'shoulder') {
              shoulderVideos = videoList;
            } else if (category == 'hands') {
              handsVideos = videoList;
            } else if (category == 'back') {
              backVideos = videoList;
            } else if (category == 'legs') {
              legsVideos = videoList;
            }
          });
        } else {
          print('Invalid fitness data!');
        }
      } else {
        print('Product not found!');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  // Method to build the video grid without title or color
  Widget buildVideoGrid(List<Map<String, String>> videos) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final video = videos[index];

        return Card(
          color: Colors.black,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VideoPlayerPage(
                          videoId: video['id']!,
                          description: video['description']!,
                          title: video['title']!),
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
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            video['description']!,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffD5FF5F),
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
                              Navigator.of(context).pop();
                            },
                            child: Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                  print(video['description']);
                },
                child: Text(
                  'Add to My List',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 5, 6, 12),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              buildVideoGrid(chestVideos),
            ],
          ),
        ),
      ),
    );
  }
}
