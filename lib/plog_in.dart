import 'package:flutter/material.dart';

class PlogInScreen extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String content;

  PlogInScreen(
      {required this.title, required this.imageUrl, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 294,
                height: 107,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(width: 1, color: Colors.grey),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            // نص المقال
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  content,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                    height: 19.92 / 17,
                    letterSpacing: 0,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            // زر تحميل المزيد
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF8ACBDA),
                  padding:
                      EdgeInsets.symmetric(horizontal: 9.92, vertical: 3.97),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const SizedBox(
                  width: 168,
                  height: 40,
                  child: Center(
                    child: Text(
                      "MORE ARTICLES",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
