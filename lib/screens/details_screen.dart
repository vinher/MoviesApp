import 'package:flutter/material.dart';
import 'package:movies/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';
    return Scaffold(
      body:CustomScrollView(
          slivers:[
            _CustomAppBar(),
            SliverList(
              delegate: SliverChildListDelegate([
                 _PosterAndTitle(),
                 _Overview(), 
                 _Overview(), 
                 CastingCards()

              ]),
            ),



          ]
      )
    );
  }
}
class _CustomAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor:Colors.indigo,
        expandedHeight: 200,
        floating: false,
        pinned: true,
        flexibleSpace:FlexibleSpaceBar(
          centerTitle:true,
          titlePadding: EdgeInsets.all(0),
          title:Container(
            width:double.infinity,
            alignment: Alignment.bottomCenter,
            padding:EdgeInsets.only(bottom: 10),
            color:Colors.black12,
            child: Text(
              'movie.title',
              style:TextStyle(fontSize: 16)
            ),
          ),    
        background:FadeInImage(
          placeholder:AssetImage('assets/loading.gif'),
          image:NetworkImage('https://via.placeholder.com/500x300'),
          fit:BoxFit.cover,
        )
       ),     
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
     final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin:EdgeInsets.only(top:20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child:Row(
        children:[
          ClipRRect(
            borderRadius:BorderRadius.circular(20),
            child:FadeInImage(
              placeholder:AssetImage('assets/venom.jpg'),
              image: AssetImage('assets/venom.jpg'),
              height:150,
            ),
          ),
          SizedBox(width:20),
          Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children:[
              Text('Movie.title', style:textTheme.headline5, overflow:TextOverflow.ellipsis,maxLines:2),
              Text('Original.title', style:textTheme.subtitle1, overflow:TextOverflow.ellipsis),
              Row(
                children:[
                  Icon(Icons.star_outline,size:15, color:Colors.green),
                  SizedBox(width:5),
                  Text('movie.voteAverage' ,style:textTheme.caption)
                ],
              )
            
            
            ]


          )
        ]
      )   
    );
  }
}

class _Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30,vertical:15),
      child:Text('Aliquip quis reprehenderit deserunt dolor velit proident deserunt quis quis in sunt in sunt. Culpa consequat velit voluptate tempor esse eu cupidatat dolore mollit aliquip do cillum cupidatat. Sit dolor veniam elit laborum id sint cillum ullamco. Elit nostrud culpa incididunt et. Nostrud elit dolore cupidatat aute dolor aliquip nulla Lorem eiusmod nisi. Est aute laborum cupidatat minim excepteur mollit enim do.',
      textAlign: TextAlign.justify,
      style:Theme.of(context).textTheme.subtitle1),
      
    );
  }
}
