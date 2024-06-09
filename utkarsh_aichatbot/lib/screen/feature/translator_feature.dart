import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:translator/translator.dart';

class TranslatorFeature extends StatefulWidget {
  const TranslatorFeature({super.key});

  @override
  State<TranslatorFeature> createState() => _TranslatorFeatureState();
}

class _TranslatorFeatureState extends State<TranslatorFeature> {
  List<String> languages = [
    'English',
    'Hindi',
    'Arabic	',
    'German',
    'Russian',
    'Spanish',
    'Urdu',
    'Japanese	',
    'Italian',
    'Afrikaans',
    'Albanian',
    'Amharic',
    'Armenian',
    'Assamese',
    'Aymara',
    'Azerbaijani',
    'Bambara',
    'Basque',
    'Belarusian',
    'Bengali',
    'Bhojpuri',
    'Bosnian',
    'Bulgarian',
    'Catalan',
    'Corsican',
    'Croatian',
    'Czech',
    'Danish',
    'Dhivehi',
    'Dutch',
    'Esperanto',
    'Estonian',
    'Ewe',
    'Finnish',
    'French',
    'Frisian',
    'Galician',
    'Georgian	',
    'Greek	',
    'Guarani',
    'Gujarati',
    'Hausa',
    'Hawaiian',
    'Hungarian',
    'Icelandic	',
    'Igbo',
    'Indonesian',
    'Irish',
    'Kannada',
    'Kazakh',
    'Khmer',
    'Kinyarwanda',
    'Konkani',
    'Korean',
    'Kurdish',
    'Kyrgyz',
    'Lao',
    'Latin',
    'Latvian',
    'Lingala	',
    'Lithuanian',
    'Luganda	',
    'Luxembourgish',
    'Macedonian',
    'Maithili',
    'Malagasy',
    'Malay',
    'Malayalam',
    'Maltese',
    'Maori',
    'Marathi',
    'Mizo	',
    'Mongolian',
    'Myanmar ',
    'Nepali',
    'Norwegian',
    'Oromo',
    'Pashto',
    'Persian',
    'Polish',
    'Punjabi',
    'Quechua',
    'Romanian',
    'Russian',
    'Samoan',
    'Sanskrit',
    'Sepedi',
    'Serbian',
    'Sesotho',
    'Shona	',
    'Sindhi',
    'Slovak',
    'Slovenian',
    'Somali',
    'Sundanese',
    'Swahili',
    'Swedish',
    'Tajik',
    'Tamil',
    'Tatar',
    'Telugu',
    'Thai',
    'Tigrinya',
    'Tsonga',
    'Turkish',
    'Turkmen',
    'Ukrainian',
    'Uzbek',
    'Vietnamese',
    'Welsh',
    'Xhosa',
    'Yiddish',
    'Yoruba',
    'Zulu',
  ];
  List<String> languagescode = [
    'en',
    'hi',
    'ar',
    'de',
    'ru',
    'es',
    'ur',
    'ja',
    'it',
    'af',
    'sq',
    'am',
    'hy',
    "as",
    "ay",
    "az",
    "bm",
    "eu",
    "be",
    "bn",
    "bho",
    "bs",
    "bg",
    "ca",
    "co",
    "hr",
    "cs",
    "da",
    "dv",
    "nl",
    "eo",
    "et",
    "ee",
    "fi",
    "fr",
    "fy",
    "gl",
    "ka",
    "de",
    "el",
    "gu",
    "gn",
    "ha",
    "haw",
    "hu",
    "is",
    "ig",
    "id",
    "ga",
    "kn",
    "kk",
    "km",
    "rw",
    "gom",
    "ko",
    "ku",
    "ky",
    "lo",
    "la",
    "lv",
    "ln",
    "lt",
    "lg",
    "lb",
    "mk",
    "mai",
    "mg",
    "ms",
    "ml",
    "mt",
    "mi",
    "mr",
    "lus",
    "mn",
    "ne",
    "no",
    "om",
    "ps",
    "fa",
    "pl",
    "pa",
    "qu",
    "ro",
    "ru",
    "sm",
    "sa",
    "nso",
    "sr",
    "st",
    "sn",
    "sd",
    "si",
    "sk",
    "sl",
    "so",
    "su",
    "sw",
    "sv",
    "tg",
    "ta",
    "tt",
    "te",
    "th",
    "ti",
    "ts",
    "tr",
    "tk",
    "uk",
    "uz",
    "vi",
    "cy",
    "xh",
    "yi",
    "yo",
    "zu",
  ];
  final translator = GoogleTranslator();
  String from = 'en';
  String to = 'hi';
  String data = 'आप कैसे हैं?';
  String selectedvalue = 'English';
  String selectedvalue2 = 'Hindi';
  TextEditingController controller =
      TextEditingController(text: 'How are you?');
  final formkey = GlobalKey<FormState>();
  bool isloading = false;
  translate() async {
    try {
      if (formkey.currentState!.validate()) {
        await translator
            .translate(controller.text, from: from, to: to)
            .then((value) {
          data = value.text;
          isloading = false;
          setState(() {});
          // print(value);
        });
      }
    } on SocketException catch (_) {
      isloading = true;
      SnackBar mysnackbar = const SnackBar(
        content: Text('Internet not Connected'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 5),
      );
      ScaffoldMessenger.of(context).showSnackBar(mysnackbar);
      setState(() {});
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    
        centerTitle: true,
        flexibleSpace: Container(
            decoration: const BoxDecoration(
          color: Colors.black,
        )),
        title: const Text(
          'AI  Language Translator',
          style: TextStyle(
              color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16,),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 60,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('From'),
                const SizedBox(
                  width: 100,
                ),
                DropdownButton(
                  value: selectedvalue,
                  focusColor: Colors.transparent,
                  items: languages.map((lang) {
                    return DropdownMenuItem(
                      value: lang,
                      child: Text(lang),
                      onTap: () {
                        if (lang == languages[0]) {
                          from = languagescode[0];
                        } else if (lang == languages[1]) {
                          from = languagescode[1];
                        } else if (lang == languages[2]) {
                          from = languagescode[2];
                        } else if (lang == languages[3]) {
                          from = languagescode[3];
                        } else if (lang == languages[4]) {
                          from = languagescode[4];
                        } else if (lang == languages[5]) {
                          from = languagescode[5];
                        } else if (lang == languages[6]) {
                          from = languagescode[6];
                        } else if (lang == languages[7]) {
                          from = languagescode[7];
                        } else if (lang == languages[8]) {
                          from = languagescode[8];
                        } else if (lang == languages[9]) {
                          from = languagescode[9];
                        } else if (lang == languages[10]) {
                          from = languagescode[10];
                        } else if (lang == languages[11]) {
                          from = languagescode[11];
                        } else if (lang == languages[12]) {
                          from = languagescode[12];
                        } else if (lang == languages[13]) {
                          from = languagescode[13];
                        } else if (lang == languages[14]) {
                          from = languagescode[14];
                        } else if (lang == languages[15]) {
                          from = languagescode[15];
                        } else if (lang == languages[16]) {
                          from = languagescode[16];
                        } else if (lang == languages[17]) {
                          from = languagescode[17];
                        } else if (lang == languages[18]) {
                          from = languagescode[18];
                        } else if (lang == languages[19]) {
                          from = languagescode[19];
                        } else if (lang == languages[20]) {
                          from = languagescode[20];
                        } else if (lang == languages[21]) {
                          from = languagescode[21];
                        } else if (lang == languages[22]) {
                          from = languagescode[22];
                        } else if (lang == languages[23]) {
                          from = languagescode[23];
                        } else if (lang == languages[24]) {
                          from = languagescode[24];
                        } else if (lang == languages[25]) {
                          from = languagescode[25];
                        } else if (lang == languages[26]) {
                          from = languagescode[26];
                        } else if (lang == languages[27]) {
                          from = languagescode[27];
                        } else if (lang == languages[28]) {
                          from = languagescode[28];
                        } else if (lang == languages[29]) {
                          from = languagescode[29];
                        } else if (lang == languages[30]) {
                          from = languagescode[30];
                        } else if (lang == languages[31]) {
                          from = languagescode[31];
                        } else if (lang == languages[32]) {
                          from = languagescode[32];
                        } else if (lang == languages[33]) {
                          from = languagescode[33];
                        } else if (lang == languages[34]) {
                          from = languagescode[34];
                        } else if (lang == languages[35]) {
                          from = languagescode[35];
                        } else if (lang == languages[36]) {
                          from = languagescode[36];
                        } else if (lang == languages[37]) {
                          from = languagescode[37];
                        } else if (lang == languages[38]) {
                          from = languagescode[38];
                        } else if (lang == languages[39]) {
                          from = languagescode[39];
                        } else if (lang == languages[40]) {
                          from = languagescode[40];
                        } else if (lang == languages[41]) {
                          from = languagescode[41];
                        } else if (lang == languages[42]) {
                          from = languagescode[42];
                        } else if (lang == languages[43]) {
                          from = languagescode[43];
                        } else if (lang == languages[44]) {
                          from = languagescode[44];
                        } else if (lang == languages[45]) {
                          from = languagescode[45];
                        } else if (lang == languages[46]) {
                          from = languagescode[46];
                        } else if (lang == languages[47]) {
                          from = languagescode[47];
                        } else if (lang == languages[48]) {
                          from = languagescode[48];
                        } else if (lang == languages[49]) {
                          from = languagescode[49];
                        } else if (lang == languages[50]) {
                          from = languagescode[50];
                        } else if (lang == languages[51]) {
                          from = languagescode[51];
                        } else if (lang == languages[52]) {
                          from = languagescode[52];
                        } else if (lang == languages[53]) {
                          from = languagescode[53];
                        } else if (lang == languages[54]) {
                          from = languagescode[54];
                        } else if (lang == languages[55]) {
                          from = languagescode[55];
                        } else if (lang == languages[56]) {
                          from = languagescode[56];
                        } else if (lang == languages[57]) {
                          from = languagescode[57];
                        } else if (lang == languages[58]) {
                          from = languagescode[58];
                        } else if (lang == languages[59]) {
                          from = languagescode[59];
                        } else if (lang == languages[60]) {
                          from = languagescode[60];
                        } else if (lang == languages[61]) {
                          from = languagescode[61];
                        } else if (lang == languages[62]) {
                          from = languagescode[62];
                        } else if (lang == languages[63]) {
                          from = languagescode[63];
                        } else if (lang == languages[64]) {
                          from = languagescode[64];
                        } else if (lang == languages[65]) {
                          from = languagescode[65];
                        } else if (lang == languages[66]) {
                          from = languagescode[66];
                        } else if (lang == languages[67]) {
                          from = languagescode[67];
                        } else if (lang == languages[68]) {
                          from = languagescode[68];
                        } else if (lang == languages[69]) {
                          from = languagescode[69];
                        } else if (lang == languages[70]) {
                          from = languagescode[70];
                        } else if (lang == languages[71]) {
                          from = languagescode[71];
                        } else if (lang == languages[72]) {
                          from = languagescode[72];
                        } else if (lang == languages[73]) {
                          from = languagescode[73];
                        } else if (lang == languages[74]) {
                          from = languagescode[74];
                        } else if (lang == languages[75]) {
                          from = languagescode[75];
                        } else if (lang == languages[76]) {
                          from = languagescode[76];
                        } else if (lang == languages[77]) {
                          from = languagescode[77];
                        } else if (lang == languages[78]) {
                          from = languagescode[78];
                        } else if (lang == languages[79]) {
                          from = languagescode[79];
                        } else if (lang == languages[80]) {
                          from = languagescode[80];
                        } else if (lang == languages[81]) {
                          from = languagescode[81];
                        } else if (lang == languages[82]) {
                          from = languagescode[82];
                        } else if (lang == languages[83]) {
                          from = languagescode[83];
                        } else if (lang == languages[84]) {
                          from = languagescode[84];
                        } else if (lang == languages[85]) {
                          from = languagescode[85];
                        } else if (lang == languages[86]) {
                          from = languagescode[86];
                        } else if (lang == languages[87]) {
                          from = languagescode[87];
                        } else if (lang == languages[88]) {
                          from = languagescode[88];
                        } else if (lang == languages[89]) {
                          from = languagescode[89];
                        } else if (lang == languages[90]) {
                          from = languagescode[90];
                        } else if (lang == languages[91]) {
                          from = languagescode[91];
                        } else if (lang == languages[92]) {
                          from = languagescode[92];
                        } else if (lang == languages[93]) {
                          from = languagescode[93];
                        } else if (lang == languages[94]) {
                          from = languagescode[94];
                        } else if (lang == languages[95]) {
                          from = languagescode[95];
                        } else if (lang == languages[96]) {
                          from = languagescode[96];
                        } else if (lang == languages[97]) {
                          from = languagescode[97];
                        } else if (lang == languages[98]) {
                          from = languagescode[98];
                        } else if (lang == languages[99]) {
                          from = languagescode[99];
                        } else if (lang == languages[100]) {
                          from = languagescode[100];
                        } else if (lang == languages[101]) {
                          from = languagescode[101];
                        } else if (lang == languages[102]) {
                          from = languagescode[102];
                        } else if (lang == languages[103]) {
                          from = languagescode[103];
                        } else if (lang == languages[104]) {
                          from = languagescode[104];
                        } else if (lang == languages[105]) {
                          from = languagescode[105];
                        } else if (lang == languages[106]) {
                          from = languagescode[106];
                        } else if (lang == languages[107]) {
                          from = languagescode[107];
                        } else if (lang == languages[108]) {
                          from = languagescode[108];
                        } else if (lang == languages[109]) {
                          from = languagescode[109];
                        } else if (lang == languages[110]) {
                          from = languagescode[110];
                        } else if (lang == languages[111]) {
                          from = languagescode[111];
                        } else if (lang == languages[112]) {
                          from = languagescode[112];
                        } else if (lang == languages[113]) {
                          from = languagescode[113];
                        } else if (lang == languages[114]) {
                          from = languagescode[114];
                        }
                        setState(() {
                          // print(lang);
                          // print(from);
                        });
                      },
                    );
                  }).toList(),
                  onChanged: (value) {
                    selectedvalue = value!;
                  },
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(30),
            decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black)),
            child: Form(
              key: formkey,
              child: TextFormField(
                controller: controller,
                maxLines: null,
                minLines: null,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    errorBorder: InputBorder.none,
                    errorStyle: TextStyle(color: Colors.white)),
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('To'),
                const SizedBox(
                  width: 100,
                ),
                DropdownButton(
                  value: selectedvalue2,
                  focusColor: Colors.transparent,
                  items: languages.map((lang) {
                    return DropdownMenuItem(
                      value: lang,
                      child: Text(lang),
                      onTap: () {
                        if (lang == languages[0]) {
                          to = languagescode[0];
                        } else if (lang == languages[1]) {
                          to = languagescode[1];
                        } else if (lang == languages[2]) {
                          to = languagescode[2];
                        } else if (lang == languages[3]) {
                          to = languagescode[3];
                        } else if (lang == languages[4]) {
                          to = languagescode[4];
                        } else if (lang == languages[5]) {
                          to = languagescode[5];
                        } else if (lang == languages[6]) {
                          to = languagescode[6];
                        } else if (lang == languages[7]) {
                          to = languagescode[7];
                        } else if (lang == languages[8]) {
                          to = languagescode[8];
                        } else if (lang == languages[9]) {
                          to = languagescode[9];
                        } else if (lang == languages[10]) {
                          to = languagescode[10];
                        } else if (lang == languages[11]) {
                          to = languagescode[11];
                        } else if (lang == languages[12]) {
                          to = languagescode[12];
                        } else if (lang == languages[13]) {
                          to = languagescode[13];
                        } else if (lang == languages[14]) {
                          to = languagescode[14];
                        } else if (lang == languages[15]) {
                          to = languagescode[15];
                        } else if (lang == languages[16]) {
                          to = languagescode[16];
                        } else if (lang == languages[17]) {
                          to = languagescode[17];
                        } else if (lang == languages[18]) {
                          to = languagescode[18];
                        } else if (lang == languages[19]) {
                          to = languagescode[19];
                        } else if (lang == languages[20]) {
                          to = languagescode[20];
                        } else if (lang == languages[21]) {
                          to = languagescode[21];
                        } else if (lang == languages[22]) {
                          to = languagescode[22];
                        } else if (lang == languages[23]) {
                          to = languagescode[23];
                        } else if (lang == languages[24]) {
                          to = languagescode[24];
                        } else if (lang == languages[25]) {
                          to = languagescode[25];
                        } else if (lang == languages[26]) {
                          to = languagescode[26];
                        } else if (lang == languages[27]) {
                          to = languagescode[27];
                        } else if (lang == languages[28]) {
                          to = languagescode[28];
                        } else if (lang == languages[29]) {
                          to = languagescode[29];
                        } else if (lang == languages[30]) {
                          to = languagescode[30];
                        } else if (lang == languages[31]) {
                          to = languagescode[31];
                        } else if (lang == languages[32]) {
                          to = languagescode[32];
                        } else if (lang == languages[33]) {
                          to = languagescode[33];
                        } else if (lang == languages[34]) {
                          to = languagescode[34];
                        } else if (lang == languages[35]) {
                          to = languagescode[35];
                        } else if (lang == languages[36]) {
                          to = languagescode[36];
                        } else if (lang == languages[37]) {
                          to = languagescode[37];
                        } else if (lang == languages[38]) {
                          to = languagescode[38];
                        } else if (lang == languages[39]) {
                          to = languagescode[39];
                        } else if (lang == languages[40]) {
                          to = languagescode[40];
                        } else if (lang == languages[41]) {
                          to = languagescode[41];
                        } else if (lang == languages[42]) {
                          to = languagescode[42];
                        } else if (lang == languages[43]) {
                          to = languagescode[43];
                        } else if (lang == languages[44]) {
                          to = languagescode[44];
                        } else if (lang == languages[45]) {
                          to = languagescode[45];
                        } else if (lang == languages[46]) {
                          to = languagescode[46];
                        } else if (lang == languages[47]) {
                          to = languagescode[47];
                        } else if (lang == languages[48]) {
                          to = languagescode[48];
                        } else if (lang == languages[49]) {
                          to = languagescode[49];
                        } else if (lang == languages[50]) {
                          to = languagescode[50];
                        } else if (lang == languages[51]) {
                          to = languagescode[51];
                        } else if (lang == languages[52]) {
                          to = languagescode[52];
                        } else if (lang == languages[53]) {
                          to = languagescode[53];
                        } else if (lang == languages[54]) {
                          to = languagescode[54];
                        } else if (lang == languages[55]) {
                          to = languagescode[55];
                        } else if (lang == languages[56]) {
                          to = languagescode[56];
                        } else if (lang == languages[57]) {
                          to = languagescode[57];
                        } else if (lang == languages[58]) {
                          to = languagescode[58];
                        } else if (lang == languages[59]) {
                          to = languagescode[59];
                        } else if (lang == languages[60]) {
                          to = languagescode[60];
                        } else if (lang == languages[61]) {
                          to = languagescode[61];
                        } else if (lang == languages[62]) {
                          to = languagescode[62];
                        } else if (lang == languages[63]) {
                          to = languagescode[63];
                        } else if (lang == languages[64]) {
                          to = languagescode[64];
                        } else if (lang == languages[65]) {
                          to = languagescode[65];
                        } else if (lang == languages[66]) {
                          to = languagescode[66];
                        } else if (lang == languages[67]) {
                          to = languagescode[67];
                        } else if (lang == languages[68]) {
                          to = languagescode[68];
                        } else if (lang == languages[69]) {
                          to = languagescode[69];
                        } else if (lang == languages[70]) {
                          to = languagescode[70];
                        } else if (lang == languages[71]) {
                          to = languagescode[71];
                        } else if (lang == languages[72]) {
                          to = languagescode[72];
                        } else if (lang == languages[73]) {
                          to = languagescode[73];
                        } else if (lang == languages[74]) {
                          to = languagescode[74];
                        } else if (lang == languages[75]) {
                          to = languagescode[75];
                        } else if (lang == languages[76]) {
                          to = languagescode[76];
                        } else if (lang == languages[77]) {
                          to = languagescode[77];
                        } else if (lang == languages[78]) {
                          to = languagescode[78];
                        } else if (lang == languages[79]) {
                          to = languagescode[79];
                        } else if (lang == languages[80]) {
                          to = languagescode[80];
                        } else if (lang == languages[81]) {
                          to = languagescode[81];
                        } else if (lang == languages[82]) {
                          to = languagescode[82];
                        } else if (lang == languages[83]) {
                          to = languagescode[83];
                        } else if (lang == languages[84]) {
                          to = languagescode[84];
                        } else if (lang == languages[85]) {
                          to = languagescode[85];
                        } else if (lang == languages[86]) {
                          to = languagescode[86];
                        } else if (lang == languages[87]) {
                          to = languagescode[87];
                        } else if (lang == languages[88]) {
                          to = languagescode[88];
                        } else if (lang == languages[89]) {
                          to = languagescode[89];
                        } else if (lang == languages[90]) {
                          to = languagescode[90];
                        } else if (lang == languages[91]) {
                          to = languagescode[91];
                        } else if (lang == languages[92]) {
                          to = languagescode[92];
                        } else if (lang == languages[93]) {
                          to = languagescode[93];
                        } else if (lang == languages[94]) {
                          to = languagescode[94];
                        } else if (lang == languages[95]) {
                          to = languagescode[95];
                        } else if (lang == languages[96]) {
                          to = languagescode[96];
                        } else if (lang == languages[97]) {
                          to = languagescode[97];
                        } else if (lang == languages[98]) {
                          to = languagescode[98];
                        } else if (lang == languages[99]) {
                          to = languagescode[99];
                        } else if (lang == languages[100]) {
                          to = languagescode[100];
                        } else if (lang == languages[101]) {
                          to = languagescode[101];
                        } else if (lang == languages[102]) {
                          to = languagescode[102];
                        } else if (lang == languages[103]) {
                          to = languagescode[103];
                        } else if (lang == languages[104]) {
                          to = languagescode[104];
                        } else if (lang == languages[105]) {
                          to = languagescode[105];
                        } else if (lang == languages[106]) {
                          to = languagescode[106];
                        } else if (lang == languages[107]) {
                          to = languagescode[107];
                        } else if (lang == languages[108]) {
                          to = languagescode[108];
                        } else if (lang == languages[109]) {
                          to = languagescode[109];
                        } else if (lang == languages[110]) {
                          to = languagescode[110];
                        } else if (lang == languages[111]) {
                          to = languagescode[111];
                        } else if (lang == languages[112]) {
                          to = languagescode[112];
                        } else if (lang == languages[113]) {
                          to = languagescode[113];
                        } else if (lang == languages[114]) {
                          to = languagescode[114];
                        }
                        setState(() {
                          print(lang);
                          print(from);
                        });
                      },
                    );
                  }).toList(),
                  onChanged: (value) {
                    selectedvalue2 = value!;
                  },
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(30),
            decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black)),
            child: Center(
              child: SelectableText(
                data,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: translate,
              style:const ButtonStyle(
                  backgroundColor:
                      WidgetStatePropertyAll(Colors.blue),
                  fixedSize: const WidgetStatePropertyAll(Size(double.infinity, 55))),
              child: isloading
                  ? const SizedBox.square(
                      dimension: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : const Text('Translate',style: TextStyle(color: Colors.black),)),
          const SizedBox(
            height: 30,
          )
        ],
      )),
    );
  }
}
