import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class MovieSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity,
      height:250,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:EdgeInsets.symmetric(horizontal: 20),
            child:Text('Populares',style:TextStyle(fontSize:20,fontWeight: FontWeight.bold)),
          ),

           Expanded(
             child: ListView.builder(
               scrollDirection:Axis.horizontal,
               itemCount:20,
               itemBuilder:(_, int index)=>_MoviePoster()),
           )
        ],
      ),

    );
      
  }
}
        //Metodo para el scroll de peliculas.
        class _MoviePoster extends StatelessWidget {
          @override
        Widget build(BuildContext context) {
          return Container(
                width:130,
                height:190,
                margin:EdgeInsets.symmetric(horizontal: 10),
                child:Column(
                  children:[
                  
                  GestureDetector(
                    onTap:()=> Navigator.pushNamed(context, 'details', arguments:'movies-instance'),
                    child: ClipRRect(
                      borderRadius:BorderRadius.circular(20),
                      child: FadeInImage(
                        placeholder:AssetImage('assets/venom.jpg') ,
                        image: NetworkImage('https://via.placeholder.com/200x400'),
                        width: 130,
                        height:190,
                        fit:BoxFit.cover,
                        ),
                    ),
                  ),

                    SizedBox(height: 5),
                    Text(
                      'VENOM: Let there be carnage',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines:2,
                      )

                  ],
            
                ),
              );
            }



}