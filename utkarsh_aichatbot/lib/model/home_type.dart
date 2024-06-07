import 'package:flutter/material.dart';

enum HomeType { aiChatbot , aiImage , aiTranslator}


extension MyHomeType on HomeType{
  //title
  String get title => switch (this){
    
    
    HomeType.aiChatbot => "AI ChatBot",
   
    HomeType.aiImage => "AI Image Creator",
    
    HomeType.aiTranslator => "Language \nTranslator",
  };
//for lottie
   String get lottie => switch (this){
    
    
    HomeType.aiChatbot => "ai_hand_waving.json",
   
    HomeType.aiImage => "ai_play.json",
    
    HomeType.aiTranslator => "ai_ask_me.json",
  };
  //for alignment
  bool get leftAlign => switch (this){
    
    
    HomeType.aiChatbot => true,
    
    HomeType.aiImage => false,
    
    HomeType.aiTranslator => true,
  };
  //for padding
  EdgeInsets get padding => switch (this){
    
    
    HomeType.aiChatbot => EdgeInsets.zero,
    
    HomeType.aiImage =>const EdgeInsets.all(20),
    
    HomeType.aiTranslator => EdgeInsets.zero,
  };

}