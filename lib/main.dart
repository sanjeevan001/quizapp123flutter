import 'package:flutter/material.dart';
import 'package:quiz/quizetense.dart';

void main() {
  runApp(MaterialApp(

      debugShowCheckedModeBanner: false,

home: home(),
  ));
}


class home extends StatefulWidget {
  const home({ Key? key }) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  var score=0;
  var n=0;



  List que_list=[
    Questions("1.MS Word is a hardware.",false),
    Questions("2.CPU controls only input data of computer.",false),
    Questions("3.CPU stands for Central Processing Unit.",true),
    Questions("4.Freeware is software that is available for use at no monetary cost..",true),
  ];



  void checkanswer(bool choice,BuildContext ctx){
    if(choice==que_list[n].ans){

      debugPrint("corecr");
   
      // setState((  ) {
      //       score=score+1;
        
      // });
   score=score+1;

    final snackbar=SnackBar(content: Text("Quiz Completed Score $score/4"),
     duration: Duration(seconds: 5),
          backgroundColor: Colors.blueAccent,
        );
Scaffold.of(ctx).showSnackBar(snackbar);
        reset();



    }

    else{
      debugPrint("wrong");
      //  score=score-1;
  final snackbar=SnackBar(content: Text("wrong answer $score/4"),
     duration: Duration(seconds: 5),
          backgroundColor: Colors.red,
        );
Scaffold.of(ctx).showSnackBar(snackbar);
        reset();





    }

setState(() {

if(n<que_list.length-1){

n=n+1;
}
else{
    final snackbar=SnackBar(content: Text("Quiz Completed Score $score/4"),
     duration: Duration(seconds: 5),
          backgroundColor: Colors.blueAccent,
        );
Scaffold.of(ctx).showSnackBar(snackbar);
        reset();


}
  
});


  }


void reset(){

setState(() {
n=0;
score=0;


  
});

}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(backgroundColor: Colors.brown,title: Text("Simple Quiz"),centerTitle:true,),
       body: Builder(
         builder:(ctx)=>Container(
           padding: EdgeInsets.symmetric(vertical: 20,horizontal: 15),
       
           child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: [
         Text("score:$score/4",style: TextStyle(color:Colors.brown,fontWeight: FontWeight.bold,),),
         InkWell(
           onTap: ()=>reset(),
           child: Text("reset",style: TextStyle(color:Colors.brown,fontWeight: FontWeight.bold,),))
       
       
       ],
       
       
               ),
       
       
       
       
               Container(height: 75,width: double.infinity,   decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(color: Colors.brown),
                  ),
                  child:Column(mainAxisAlignment: MainAxisAlignment.center,
                    
                    children: [
                     Text(que_list[n].que,style: TextStyle(fontSize: 15.0),)
       
                  ],),
                  
                  
                  
                  ),
       
       
       SizedBox(height: 15,),
                  Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
            RaisedButton(onPressed: ()=>checkanswer(true,ctx),
            child: Text("true",style: TextStyle(color: Colors.white,fontSize: 20.0),),
            padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
            color: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                      ),
            
            ),
       
             RaisedButton(onPressed: () =>checkanswer(false,ctx),
            child: Text("false",style: TextStyle(color: Colors.white,fontSize: 20.0),),
            padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
            color: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                      ),
            
            ),
       
                    ],
                    
                  )
       
       
       
       
       
       
             ],
       
       
           ),
         ),
       ),
      
    );
  }
}

