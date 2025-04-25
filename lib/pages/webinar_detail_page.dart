import 'package:flutter/material.dart';
import '../models/webinar_model.dart';

class WebinarDetailPage extends StatelessWidget {
  final Webinar webinar;

  const WebinarDetailPage({Key? key, required this.webinar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Webinar Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColor.withOpacity(0.8),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    webinar.title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  _buildHeaderInfo(
                    context,
                    Icons.calendar_today,
                    '${_formatDate(webinar.date)} at ${webinar.time}',
                  ),
                  SizedBox(height: 4),
                  _buildHeaderInfo(
                    context,
                    Icons.timer,
                    '${webinar.duration} minutes',
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle(context, 'Description'),
                  SizedBox(height: 8),
                  Text(
                    webinar.description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 24),
                  _buildSectionTitle(context, 'Registration'),
                  SizedBox(height: 8),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.link, color: Theme.of(context).primaryColor),
                      title: Text('Registration Link'),
                      subtitle: Text(
                        webinar.registrationLink,
                        style: TextStyle(color: Colors.blue),
                      ),
                      trailing: Icon(Icons.open_in_new),
                      onTap: () {
                        // TODO: Implement link opening
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () {
            // TODO: Implement registration
          },
          child: Text('Join Webinar'),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderInfo(BuildContext context, IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.white70, size: 16),
        SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(color: Colors.white70),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}