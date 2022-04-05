import 'package:flutter/material.dart';
import 'package:helpings_needlys/chats/user_chats.dart';

class HomeChats extends StatelessWidget {
  const HomeChats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Chats Home'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: ListTile(
              subtitle: Text("this is the subtitle"),
              trailing: Text(
                  '${DateTime.now().year}_${DateTime.now().month}_${DateTime.now().day}',
                  style: TextStyle(fontSize: 15)),
              leading: CircleAvatar(child: Icon(Icons.person)),
              title: Text('name of volunteers ${index + 1}'),
              onTap: () {
                // Get.offAll(UserChats());
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserChats()),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
