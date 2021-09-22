import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width:double.infinity,
      height: size.height * 0.5,
      child:Swiper(
        itemCount: 10,
        layout:SwiperLayout.STACK,
        itemWidth: size.width * 6,
        itemHeight: size.height * 9,
        itemBuilder: ( _, int index){
          return FadeInImage(
            placeholder: NetworkImage('https://via.placeholder.com/300*400'), 
            image: NetworkImage('https://via.placeholder.com/300*400'),
            );
        },
      )

    );
  }
}