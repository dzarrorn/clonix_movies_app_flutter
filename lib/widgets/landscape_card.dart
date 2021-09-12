import 'package:flutter/material.dart';
import 'package:netflix_app/pages/detail_pagesoon.dart';

import 'package:netflix_app/theme.dart';

class LandscapeCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String sub;
  LandscapeCard({
    this.imageUrl,
    this.title,
    this.sub,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPageSoon(
                  detailImage: imageUrl,
                  sub: sub,
                  title: title,
                ),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(21),
                child: Container(
                  width: 300,
                  height: 207,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 26,
              ),
              Text(
                title,
                style: regulerWhite.copyWith(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                sub,
                style: regulerGrey.copyWith(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 24,
        ),
      ],
    );
  }
}
