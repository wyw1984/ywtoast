import 'package:flutter/material.dart';
import 'jhTextList.dart';
import 'package:ywtoast/ywtoast.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:ToastTestPage(),
    );
  }
}



class ToastTestPage extends StatelessWidget {

  final List titleData = ["文字","成功","失败","警告","加载中","水平加载中","自定义图文","水平自定义图文","iOS样式加载中"];

  @override
  Widget build(BuildContext context) {
    return  JhTextList(
      title: "YwToast",dataArr: titleData,
      callBack: (index,str){

        if(index==0){
          YwToast.showText(context, msg: "这是一条提示文字信息",
//              closeTime: 10
          );
        }
        if(index==1){
          YwToast.showSuccess(context, msg: "加载成功");
        }
        if(index==2){
          YwToast.showError(context, msg: "上传失败。请重新上传数据");
        }
        if(index==3){
          YwToast.showInfo(context, msg: "注意！注意！注意！");
        }
        if(index==4){
          var hide =  YwToast.showLoadingText(context,
              msg:"正在加载中..."
          );
          Future.delayed(Duration(seconds: 2),(){
            hide();
          });
        }

        if(index==5){
          var hide =  YwToast.showHorizontalLoadingText(context,
              msg:"正在加载中..."
          );
          Future.delayed(Duration(seconds: 2),(){
            hide();
          });

        }
        if(index==6){

          Widget img = Image.asset("assets/images/toast_error.png",package: "ywtoast",);
          YwToast.showImageText(context,
              msg: "自定义图文",
              image: img);
        }

        if(index==7){
          Widget img = Image.asset("assets/images/toast_success.png",package: "ywtoast");
          YwToast.showHorizontalImageText(context,
              msg: "水平自定义图文",
              image: img);
        }

        if(index==8){
          var hide =  YwToast.showIOSLoadingText(context,
            msg:"正在加载中...",
          );
          Future.delayed(Duration(seconds: 2),(){
            hide();
          });
        }


      },
    );

  }
}
