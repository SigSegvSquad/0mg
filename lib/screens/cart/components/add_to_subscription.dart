import 'package:flutter/material.dart';
import 'package:shop_app/models/Cart.dart';

class AddToSubscription extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return(
    Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      child: Container(
        padding: EdgeInsets.all(20),
        height: 200,
        child: Column(
          children: [
            Text("Do you want to add the current cart items to your subscription?",
            style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text("No")),
                TextButton(onPressed: (){
                  subscriptionCart.addAll(yourCart);
                  updateSubscription();
                  Navigator.of(context).pop();
                }, child: Text("Yes")),
              ],
            )
          ],
        ),
      ),
    )
    );
  }
}
