import 'package:despicableme/model/character.dart';
import 'package:despicableme/ui/CharacterWidget.dart';
import 'package:despicableme/ui/styleguide.dart';
import 'package:flutter/material.dart';

class CharacterScreen extends StatefulWidget {
  @override
  _CharacterScreenState createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  PageController _pageController ;
  int currentPage = 0;

  @override
  void initState(){
    super.initState();

    _pageController = PageController(
      viewportFraction: 1.0,
      initialPage: currentPage,
      keepPage: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        actions: <Widget>[
          Padding(padding: const EdgeInsets.only(right: 16),
          child: Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 8),
                child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: "Despicable Me", style: AppTheme.display1),
                        TextSpan(text: "\n"),
                        TextSpan(text: "Characters", style: AppTheme.display2),
                      ]
                    )
                ),
              ),
              Expanded(child: PageView(
                controller: _pageController,
              children: <Widget>[
                for(var i = 0; i<characters.length; i++)
                  CharacterWidget(character: characters[i], pageController: _pageController, currentPage: i)
              ],

              )
              ),

            ],
          ),
        ),
      ),
    );
  }
}
