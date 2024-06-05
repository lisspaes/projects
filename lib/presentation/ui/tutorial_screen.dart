import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo{
  final String title;
  final String caption;
  final String url;

  SlideInfo(this.title, this.caption, this.url);
}

final slides = <SlideInfo>[
  SlideInfo("Dash", "Atención.... Este es Dash", 'assets/images/dash.png'),
  SlideInfo("Dash & Sparky", "Dash y Sparky comparten timepo", "assets/images/dash-sparky.gif"),
  SlideInfo("Dash veraniego", "Dash en vacaciones", "assets/images/dash-sombrero.png")
];

class TutotialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';
  const TutotialScreen({super.key});

  @override
  State<TutotialScreen> createState() => _TutotialScreenState();
}

class _TutotialScreenState extends State<TutotialScreen> {
  final PageController pageviewController = PageController();
  bool end = false;

  @override
  void initState() {
    pageviewController.addListener(() {
      final page = pageviewController.page ?? 0;
      if(!end && page >= (slides.length -1.5)){
        setState(() {
          end = true;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    pageviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageviewController,
            physics: const BouncingScrollPhysics(),
            children: slides.map(
              (slidesData) => _Slide(
                title: slidesData.title,
                caption: slidesData.caption,
                url: slidesData.url,
              )
            ).toList(),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text('Salir'),
              onPressed: () => context.pop(),
            )
          ),
          end? 
          Positioned(
            bottom: 30,
            right: 30,
            child: FadeInRight(
              from: 15,
              delay: const Duration(seconds: 1),
              child: FilledButton(
                onPressed: () => context.pop(),
                child: const Text("Comenzar"),
              ),
            )
          )
          : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String url;

  const _Slide({
    required this.title, 
    required this.caption, 
    required this.url
  });

  @override
  Widget build(BuildContext context) {

    final tittleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.all(2),
      child: Center(
        child: Column(
          children: [
            Image(image: AssetImage(url)),
            const SizedBox(height: 20),
            Text(title, style: tittleStyle,),
            const SizedBox(height: 10),
            Text(caption, style: captionStyle,)
          ],
        ),
      ),  
    );
  }
}