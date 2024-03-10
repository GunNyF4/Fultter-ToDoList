import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});

  final List<PageViewModel> pages = [
    PageViewModel(//PageViewModel1
      title: 'Mental Wellbeing',
      body:
          'Mental wellbeing doesn t have one set meaning. We might use it to talk about how we feel, how well were coping with daily life or what feels possible at the moment.',
      footer: SizedBox(
        height: 45,
        width: 150,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            elevation: 8,
          ),
          onPressed: () {},
          child: const Text('See more'),
          
        ),
      ),
      image: Image.asset('assets/images/1.PNG'),
      decoration: const PageDecoration(
          titleTextStyle: TextStyle(
           fontSize: 25,
           fontWeight: FontWeight.bold,
        ),

      ),
    ),
    PageViewModel(//PageViewModel2
      title: 'Financial Wellbeing ',
      body:
          'Financial wellbeing is learning how to manage your money and resources responsibly with an eye toward long-term financial security.',
      footer: SizedBox(
        height: 45,
        width: 150,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            elevation: 8,
          ),
          onPressed: () {},
          child: const Text('See more'),
        ),
      ),
      image: Image.asset('assets/images/2.PNG'),
      decoration: const PageDecoration(
          titleTextStyle: TextStyle(
           fontSize: 25,
           fontWeight: FontWeight.bold,
        ),

      ),
    ),
    PageViewModel(//PageViewModel3
      title: 'Physical  Wellbeing',
      body:
          'Physical well-being is practicing self-care for the needs of your body. This includes physical activity, balanced nutrition, getting adequate sleep, and avoiding harmful behaviors.',
      footer: SizedBox(
        height: 45,
        width: 150,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            elevation: 8,
          ),
          onPressed: () {},
          child: const Text('See more'
          ),
        ),
      ),
      image: Image.asset('assets/images/3.PNG'),
      decoration: const PageDecoration(
          titleTextStyle: TextStyle(
           fontSize: 25,
           fontWeight: FontWeight.bold,
        ),

      ),
    ),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text('Wellbeing'),
        centerTitle: true,
      ),
      body : IntroductionScreen(
        pages: pages,
        showSkipButton: true,
        skip: const Text('Skip'),
        showDoneButton: true,
        done: const Text('Done'),
        showNextButton: true,
        next: const Icon(Icons.arrow_forward,size: 25,),
        onDone: () => onDone(context),
        curve: Curves.bounceOut,
        dotsDecorator: const DotsDecorator(
          size: Size(15, 15),
          color: Colors.green,
          activeColor: Colors.orange,
          activeSize: Size.square(20),


        ),

      ),
    );
  }
  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>  HomeScreen(),
      ),
    );
  }



}
