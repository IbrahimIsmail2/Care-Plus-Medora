import 'package:flutter/material.dart';
import 'package:medoraa_1/plog_in.dart';

class MedicalArticlesScreen extends StatelessWidget {
  final List<Map<String, String>> articles = [
    {
      "title": "hvbgfxcdvbgnhjmnb",
      "image": "https://via.placeholder.com/150",
      "content": "This is the full content of hvbgfxcdvbgnhjmnb."
    },
    {
      "title": "sdfghjkljhhhhhhhhhhhhhhhhhhhj",
      "image": "https://via.placeholder.com/150",
      "content": "This is the full content of sdfghjkljhhhhhhhhhhhhhhhhhhhj."
    },
    {
      "title": "Are Dogs Social Animals?",
      "image": "https://via.placeholder.com/150",
      "content": "Dogs are highly social animals and..."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(344, 45),
        child: AppBar(
          title:
              Text("Medical articles", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          elevation: 1,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlogInScreen(
                      title: articles[index]['title']!,
                      imageUrl: articles[index]['image']!,
                      content: articles[index]['content']!,
                    ),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 24),
                decoration: BoxDecoration(
                  color: Color(0xFF0F0F0F80),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 328,
                      height: 182,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        color: Colors.white,
                        image: DecorationImage(
                          image: NetworkImage(articles[index]['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        articles[index]['title']!,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
