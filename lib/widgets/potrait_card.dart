import 'package:flutter/material.dart';
import 'package:netflix_app/pages/detail_pagesoon.dart';

import 'package:netflix_app/theme.dart';

class PotraitCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String sub;
  PotraitCard({
    this.imageUrl,
    this.sub,
    this.title,
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
                  width: 146,
                  height: 211,
                  child: Image.network(
                    imageUrl,
                    width: 16,
                    height: 211,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 26,
              ),
              Container(
                width: 146,
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: regulerWhite.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                width: 146,
                child: Text(
                  sub,
                  overflow: TextOverflow.ellipsis,
                  style: regulerGrey.copyWith(
                    fontSize: 14,
                  ),
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
