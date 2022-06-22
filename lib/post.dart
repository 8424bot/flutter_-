import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('投稿画面'),
      ),
      body: Center(
        child: TextField(
          controller: _textEditingController,
          onSubmitted: _onSubmitted,
          enabled: true,
          maxLength: 50,
          maxLengthEnforcement: MaxLengthEnforcement.none,
          style: TextStyle(color: Colors.black),
          obscureText: false,
          maxLines: 1,
          decoration: const InputDecoration(
            icon: Icon(Icons.speaker_notes),
            hintText: '投稿内容を記載します',
            labelText: '内容 * ',
          ),
        ),
      ),
    );
  }
}

_onSubmitted(String content) {
  CollectionReference posts = FirebaseFirestore.instance.collection('posts');
  posts.add({"content": content});

  //_textEditingController.clear();
}
