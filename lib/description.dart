import 'package:flutter/material.dart';
import 'package:movie_recommendation/utils/text.dart';

class Description extends StatelessWidget {
  final String? name, description, bannerurl, posterurl, vote, launch_on;

  const Description({
    Key? key,
    this.name,
    this.description,
    this.bannerurl,
    this.posterurl,
    this.vote,
    this.launch_on,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(
                          bannerurl ?? '', // Provide a default empty string
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: modified_text(
                        text: ' ❤️ Average Rating - ' + (vote ?? 'N/A'), // Provide a default 'N/A'
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: modified_text(
                  text: name != null ? name! : 'Not Loaded',
                  size: 24,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: modified_text(
                  text: 'Releasing on - ' + (launch_on ?? 'N/A'), // Provide a default 'N/A'
                  size: 14,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 200,
                    width: 100,
                    child: Image.network(posterurl ?? ''), // Provide a default empty string
                  ),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: modified_text(
                        text: description ?? '', // Provide a default empty string
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
