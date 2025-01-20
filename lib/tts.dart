import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeechExample extends StatefulWidget {
  @override
  State<TextToSpeechExample> createState() => _TextToSpeechExampleState();
}

class _TextToSpeechExampleState extends State<TextToSpeechExample> {
  TextEditingController textController = TextEditingController(
    text: '',
  );
  final FlutterTts flutterTts = FlutterTts();

  double volumerange = 0.5;
  double speechrange = 0.5;
  double pitchrange = 1;
  bool isSpeeeking = false;
  play() async {
    isSpeeeking = true;
    await flutterTts.speak(textController.text);
    setState(() {});
  }


  stop() async {
    final languages=await flutterTts.getLanguages;
    print(languages);
    await flutterTts.setLanguage(languages[21]);
    final voice=await flutterTts.getVoices;
    print(voice);
    await flutterTts.setVoice({

    });
    isSpeeeking = false;
    await flutterTts.stop();
    setState(() {});
  }

  pause() async {
    isSpeeeking = false;
    await flutterTts.pause();
    setState(() {});
  }

  volume(val) async {
    volumerange = val;
    await flutterTts.setVolume(volumerange);
    setState(() {});
  }

  pitch(val) async {
    pitchrange = val;
    await flutterTts.setPitch(pitchrange);
    setState(() {});
  }

  speech(val) async {
    speechrange = val;
    await flutterTts.setSpeechRate(speechrange);
    setState(() {});
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    flutterTts.setCompletionHandler((){
      setState(() {
        isSpeeeking = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Text to Speech Example",
        style: TextStyle(color: Colors.white),
      )),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.purple.shade200,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  maxLines: null,
                  controller: textController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            AvatarGlow(animate: isSpeeeking,glowColor: Colors.red,
              child: Material(
                elevation: 10,
                shape: CircleBorder(),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Color.fromARGB(255, 118, 80, 255),
                  child: Icon(
                    Icons.mic_none_outlined,
                    color: Colors.white,size: 40,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    play();
                  },
                  icon: Icon(Icons.play_circle),
                  color: Colors.green,
                  iconSize: 60,
                ),
                IconButton(
                  onPressed: () {
                    stop();
                  },
                  icon: Icon(Icons.stop_circle),
                  color: Colors.red,
                  iconSize: 60,
                ),
                IconButton(
                  onPressed: () {
                    pause();
                  },
                  icon: Icon(Icons.pause_circle),
                  color: Colors.orange,
                  iconSize: 60,
                )
              ],
            ),
            Slider(
              max: 1,
              value: volumerange,
              onChanged: (value) {
                volume(value);
              },
              label: "Valume:$volumerange",
              activeColor: Colors.red,
              divisions: 10,
            ),
            Text("Set pitch "),
            Slider(
              max: 2,
              value: pitchrange,
              onChanged: (value) {
                pitch(value);
              },
              label: "Pitch:$pitchrange",
              activeColor: Colors.green,
              divisions: 10,
            ),
            Text("Set pitch "),
            Slider(
              max: 1,
              value: speechrange,
              label: "Speech:$speechrange",
              onChanged: (value) {
                speech(value);
              },
              divisions: 10,
            ),
            Text("Set speech rate")
          ],
        ),
      ),
    );
  }
}
