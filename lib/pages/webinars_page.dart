import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/webinar_model.dart';
import '../pages/webinar_detail_page.dart';
import 'create_webinar_page.dart';

class WebinarsPage extends StatefulWidget {
  @override
  _WebinarsPageState createState() => _WebinarsPageState();
}

class _WebinarsPageState extends State<WebinarsPage> {
  List<Webinar> webinars = [];
  bool isLoading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    fetchWebinars();
  }

  Future<void> fetchWebinars() async {
    try {
      // For Android emulator use: http://10.0.2.2:5000/api/webinars
      // For iOS simulator use: http://localhost:5000/api/webinars
      final response = await http.get(
        Uri.parse('http://localhost:5000/api/webinars'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          webinars = data.map((json) => Webinar.fromJson(json)).toList();
          isLoading = false;
          error = null;
        });
      } else {
        throw Exception('Failed to load webinars: ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        error = 'Error: ${e.toString()}';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upcoming Webinars'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateWebinarPage(),
            ),
          ).then((_) => fetchWebinars()); // Refresh list after returning
        },
        label: Text('Create Webinar'),
        icon: Icon(Icons.add),
      ),
      body: RefreshIndicator(
        onRefresh: fetchWebinars,
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              error!,
              style: TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: fetchWebinars,
              child: Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (webinars.isEmpty) {
      return Center(
        child: Text(
          'No webinars available',
          style: TextStyle(fontSize: 18),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: webinars.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Material(
                color: Colors.white,
                child: InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebinarDetailPage(webinar: webinars[index]),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 120,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Theme.of(context).primaryColor,
                              Theme.of(context).primaryColor.withOpacity(0.7),
                            ],
                          ),
                        ),
                        padding: EdgeInsets.all(12),
                        child: Center(
                          child: Icon(
                            Icons.video_camera_front,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                webinars[index].title,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Spacer(),
                              _buildInfoRow(
                                icon: Icons.calendar_today,
                                text: "${webinars[index].date.day}/${webinars[index].date.month}",
                                color: Theme.of(context).primaryColor,
                              ),
                              SizedBox(height: 4),
                              _buildInfoRow(
                                icon: Icons.access_time,
                                text: webinars[index].time,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String text,
    required Color color,
  }) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Icon(icon, size: 12, color: color),
        ),
        SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}