import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meme_app_flutter/Providers/meme_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:meme_app_flutter/UI/post_link_page.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Center(child: Text('Meme',style: TextStyle(fontSize: 25),),),
      ),
      body: Consumer(builder: (context, ref, child) {
        final memeData = ref.watch(memeProvider);
        return Column(
          children: [
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 370,
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 4,
                    color: Colors.black,
                  ),
                  shape: BoxShape.rectangle,
                  color: Color(0xffbb12e6),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    '${memeData.url}',
                    height: 300,
                    width: 300,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Container(
              height: 31,

              decoration: BoxDecoration(
                color: Colors.blueGrey,
                border: Border.all(
                  color: Colors.black,
                  width: 3
                ),
                borderRadius: BorderRadius.circular(8)
              ),

              child:  Text(
                'Author : ${memeData.author}',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: Colors.purple,
                      border: Border.all(
                          color: Colors.black,
                          width: 4
                      )
                  ),
                  height: 33,
                  width: 110,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.lightBlueAccent),
                    ),
                    onPressed: () {
                      Share.share('${memeData.url}',subject: 'see what i got!!' );
                    },
                    child: Row(
                      children: [
                        Text('Share'),
                        SizedBox(width: 9,),
                        Icon(Icons.share,size: 23,color: Colors.black,),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: Colors.purple,
                      border: Border.all(
                          color: Colors.black,
                          width: 4
                      )
                  ),
                  height: 33,
                  width: 110,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                    onPressed: () {
                      ref.read(memeProvider.notifier).getMeme();
                    },
                    child: Row(
                      children: [
                        Text('Next'),
                        SizedBox(width: 3,),
                        Icon(Icons.navigate_next_sharp,size: 28,color: Colors.black,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: Colors.purple,
                  border: Border.all(
                      color: Colors.black,
                      width: 4
                  )
              ),
              height: 33,
              width: 160,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                onPressed: () {
                 Get.to(() => PostLinkPage('${memeData.postLink}'));
                },
                child: Row(
                  children: [
                    Text('See the post'),
                    SizedBox(width: 9,),
                    Icon(Icons.arrow_forward,size: 23,color: Colors.black,),
                  ],
                ),
              ),
            ),

          ],
        );
      }),
    );
  }
}
