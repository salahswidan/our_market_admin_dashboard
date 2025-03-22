import 'package:flutter/material.dart';
import 'package:our_market_admin_dashboard/core/components/custom_elevated_button.dart';
import 'package:our_market_admin_dashboard/core/components/custom_text_field.dart';
import 'package:our_market_admin_dashboard/core/functions/build_appBar.dart';

class CommentsView extends StatelessWidget {
  const CommentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, "Conmments"),
      body: ListView.builder(itemBuilder: (context,index)=> CommentCard(),itemCount: 10,),
    );
  }
}

class CommentCard extends StatelessWidget {
   CommentCard({
    super.key,
  });
  final TextEditingController replyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Card(
        child: Column(
          children: [
            const Text("Comment : This is User Comment",style: TextStyle(fontSize: 20),),
            const SizedBox(height: 10,),
            const Text("Reply : This is Reply",style: TextStyle(fontSize: 20),),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:   CustomTextField(lableText: "Reply",
              controller: replyController,),
            ),
            const SizedBox(height: 10,),
            CustomElevatedButton(onPressed: (){}, child: const Text("Reply"),),
          ],
        ),
      ),
    );
  }
}