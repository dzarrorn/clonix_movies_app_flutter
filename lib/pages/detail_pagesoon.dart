import 'package:flutter/material.dart';
import 'package:netflix_app/theme.dart';

class DetailPageSoon extends StatefulWidget {
  final String detailImage;
  final String title;
  final String sub;
  DetailPageSoon({
    this.detailImage,
    this.sub,
    this.title,
  });
  @override
  State<DetailPageSoon> createState() => _DetailPageSoonState();
}

class _DetailPageSoonState extends State<DetailPageSoon> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.pop(context);
                          });
                        },
                        child: Icon(
                          Icons.chevron_left,
                          color: whiteColor,
                        ),
                      ),
                      Text(
                        'Details Movie',
                        style: semiBoldWhite.copyWith(
                          fontSize: 20,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isClicked = !isClicked;
                          });
                        },
                        child: Icon(
                          Icons.star,
                          color: isClicked ? Colors.yellow : Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      21,
                    ),
                    child: Image.network(
                      // 'assets/potrait3.png',
                      //!BUAT BESOK
                      widget.detailImage,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 1.5,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    child: Text(
                      // 'FASDFASDFASDF',
                      //!BUAT BESOK
                      widget.title,
                      style: mediumWhite.copyWith(
                        fontSize: 24,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Text(
                        'Director: Dliya\' Zarror Nibros | ',
                        style: regulerGrey.copyWith(
                          fontSize: 17,
                        ),
                      ),
                      Icon(
                        Icons.star,
                        size: 20,
                        color: Colors.yellow,
                      ),
                      Text(
                        ' 4,9',
                        style: regulerGrey.copyWith(
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                    child: Container(
                      color: oldGreyColor,
                      child: Text(
                        // ' Drama, Thriller, Western ',
                        //! BUAT BESOK
                        ' ${widget.sub} ',
                        style: regulerGrey.copyWith(
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Storyline',
                    style: mediumWhite.copyWith(
                      fontSize: 24,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Container(
                    child: Text(
                      'A one-time rodeo star and washed-up horse breeder takes a job to bring a man\'s young son home and away from his alcoholic mom. On their journey, the horseman finds redemption through teaching the boy what it means to be a good man.',
                      style: regulerGrey.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//! NOTE: FOR SOON
