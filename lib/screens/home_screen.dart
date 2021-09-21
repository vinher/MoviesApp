import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Movies In Cinnemas'),
        centerTitle:true,
        actions: [
          IconButton(
            icon:Icon( Icons.search_outlined),
            onPressed: (){}), 
        ],
        
        
      ),
      body: Center(
        child:Text('Home Screen')
      ),
    );
  }
}