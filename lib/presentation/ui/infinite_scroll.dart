import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = "infinite_screen";
  const InfiniteScrollScreen({super.key});
  

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {

  List<int> images = [1, 2, 3, 4, 5];
  bool isLoading = false;
  bool isMounted = true; 
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {
      if(scrollController.position.pixels +500 >= scrollController.position.maxScrollExtent){
      loadNextPage();
    }
    });
    
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  Future loadNextPage() async{
    if(isLoading) return;
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));
    addFiveImages();

    isLoading = false;
    if(!isMounted) return;
    setState(() {});

    moveScrollToBottom();
  }

  void moveScrollToBottom(){
    if(scrollController.position.pixels + 100 <= scrollController.position.maxScrollExtent) return;
    scrollController.animateTo(
      scrollController.position.pixels +120, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.fastOutSlowIn
    );
  }



  Future<void> onRefresh ()async{
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
    if(!isMounted) return;
    isLoading = false;
    setState(() {});
    moveScrollToBottom();
  }

  void addFiveImages(){
    final lastId = images.last;

    images.addAll(
      [1, 2, 3, 4, 5].map((e) => lastId + e)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context, 
        child: RefreshIndicator(
          onRefresh: onRefresh,
          edgeOffset: 10,
          strokeWidth: 2,
          child: ListView.builder(
            controller: scrollController,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                placeholder: const AssetImage('assets/images/carga.png'), 
                image: NetworkImage('https://picsum.photos/id/${images[index]}/500/300')
              );
            },
          ),
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: isLoading
        ? SpinPerfect(
          infinite: true,
          child: const Icon(Icons.refresh_rounded))
        : FadeIn(child: const Icon(Icons.arrow_back_ios_new_outlined))
      ),
    );
  }
}