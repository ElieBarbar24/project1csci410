import 'package:flutter/material.dart';
import 'package:project1csci410/Data.dart';

class History extends StatefulWidget{
  @override
  _History createState() => _History();
}

class _History extends State<History>{

  @override
  Widget build(BuildContext context){
    history.sort((a,b)=> a['Date']!.compareTo(b['Date']!));
    return Scaffold(
      appBar: AppBar(
        title: Center(child:Text('History',style: TextStyle(color: Colors.white),)),
        backgroundColor: Color(0xFF113953),
      ),
      body: ListView.builder(
          itemCount: history.length,
          itemBuilder: (context, index){
            return Column(
              children: [
                Container(
                  color: Color(0xFF113953),
                  child: ListTile(
                    leading: Icon(Icons.history,color: Colors.white,),
                    title: Text('${history[index]['From']} to ${history[index]['To']}',style: TextStyle(color: Colors.white),),
                    subtitle: Text('Converted on: ${history[index]['Date']}',style: TextStyle(color: Colors.grey[600]),),
                    trailing: IconButton(
                      onPressed: (){
                        setState(() {
                          history.remove(index);
                        });
                      },
                      icon: Icon(Icons.delete,color: Colors.white,),
                    ),
                  ),
                ),
                SizedBox(height: 10,)
              ],
            );
          }

      ),
    );
  }
}
