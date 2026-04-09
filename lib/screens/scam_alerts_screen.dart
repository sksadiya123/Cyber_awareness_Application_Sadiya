import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../services/language_service.dart';

class ScamAlertsScreen extends StatefulWidget {
  @override
  _ScamAlertsScreenState createState() => _ScamAlertsScreenState();
}

class _ScamAlertsScreenState extends State<ScamAlertsScreen> {
  FlutterTts tts = FlutterTts();

  // 🔥 FULL LANGUAGE ALERTS
final List<Map<String, String>> alerts = [
  {
    "en": "Fake bank calls asking for OTP. Never share your OTP.",
    "hi": "बैंक से फर्जी कॉल आकर ओटीपी मांगते हैं। कभी ओटीपी साझा न करें।",
    "te": "బ్యాంక్ నుండి నకిలీ కాల్స్ వస్తాయి మరియు ఓటీపీ అడుగుతారు. ఎప్పుడూ ఓటీపీ పంచుకోవద్దు."
  },
  {
    "en": "Lottery scam messages claiming you won money.",
    "hi": "लॉटरी जीतने के संदेश धोखाधड़ी होते हैं।",
    "te": "లాటరీ గెలిచినట్లు వచ్చే సందేశాలు మోసం."
  },
  {
    "en": "Job fraud messages offering high salary.",
    "hi": "उच्च वेतन वाली नौकरी के फर्जी संदेशों से सावधान रहें।",
    "te": "అధిక జీతం ఇచ్చే ఉద్యోగ సందేశాలు మోసం కావచ్చు."
  },
  {
    "en": "QR code scams asking you to scan.",
    "hi": "क्यूआर कोड स्कैम से सावधान रहें।",
    "te": "QR కోడ్ స్కామ్‌లకు జాగ్రత్త."
  },
  {
    "en": "Fake customer care numbers on Google.",
    "hi": "गूगल पर फर्जी कस्टमर केयर नंबर होते हैं।",
    "te": "గూగుల్‌లో నకిలీ కస్టమర్ కేర్ నంబర్లు ఉంటాయి."
  },
  {
    "en": "UPI payment request scams.",
    "hi": "यूपीआई रिक्वेस्ट के जरिए धोखाधड़ी की जाती है।",
    "te": "UPI రిక్వెస్ట్ ద్వారా మోసం జరుగుతుంది."
  },
  {
    "en": "Fake loan apps stealing your data.",
    "hi": "फर्जी लोन ऐप आपके डेटा चुरा सकते हैं।",
    "te": "నకిలీ లోన్ యాప్‌లు మీ డేటాను దొంగిలిస్తాయి."
  },
  {
    "en": "Social media hacking links.",
    "hi": "सोशल मीडिया हैकिंग लिंक से सावधान रहें।",
    "te": "సోషల్ మీడియా హ్యాకింగ్ లింక్‌లకు జాగ్రత్త."
  },
  {
    "en": "Fake KYC update messages.",
    "hi": "फर्जी केवाईसी अपडेट संदेश धोखाधड़ी हैं।",
    "te": "నకిలీ KYC సందేశాలు మోసం."
  },
  {
    "en": "Online shopping fake websites.",
    "hi": "ऑनलाइन शॉपिंग में फर्जी वेबसाइट्स होती हैं।",
    "te": "ఆన్‌లైన్ షాపింగ్‌లో నకిలీ వెబ్‌సైట్లు ఉంటాయి."
  },
  {
    "en": "Unknown apps asking permissions.",
    "hi": "अनजान ऐप्स को अनुमति न दें।",
    "te": "తెలియని యాప్‌లకు అనుమతి ఇవ్వవద్దు."
  },
  {
    "en": "Email phishing pretending bank.",
    "hi": "बैंक बनकर आने वाले ईमेल फर्जी हो सकते हैं।",
    "te": "బ్యాంక్ లాగా వచ్చే ఇమెయిల్స్ నకిలీ కావచ్చు."
  },
  {
    "en": "Fake investment scams.",
    "hi": "नकली निवेश स्कैम से बचें।",
    "te": "నకిలీ పెట్టుబడి స్కామ్‌లను నివారించండి."
  },
  {
    "en": "OTP sharing scams.",
    "hi": "ओटीपी साझा करना खतरनाक है।",
    "te": "ఓటీపీ పంచుకోవడం ప్రమాదకరం."
  },
  {
    "en": "Fake courier delivery calls.",
    "hi": "फर्जी कुरियर कॉल से सावधान रहें।",
    "te": "నకిలీ కూరియర్ కాల్స్‌కు జాగ్రత్త."
  },
  {
    "en": "SIM swap fraud.",
    "hi": "सिम स्वैप फ्रॉड से सावधान रहें।",
    "te": "SIM స్వాప్ మోసం నుండి జాగ్రత్త."
  },
  {
    "en": "ATM card cloning scams.",
    "hi": "एटीएम कार्ड क्लोनिंग से सावधान रहें।",
    "te": "ATM కార్డ్ క్లోనింగ్ మోసం."
  },
  {
    "en": "Fake government scheme messages.",
    "hi": "सरकारी योजना के फर्जी संदेश आते हैं।",
    "te": "ప్రభుత్వ పథకాల పేరుతో మోసం జరుగుతుంది."
  },
  {
    "en": "Remote access app scams.",
    "hi": "रिमोट ऐप इंस्टॉल करवाकर धोखाधड़ी करते हैं।",
    "te": "రిమోట్ యాప్ ద్వారా మోసం చేస్తారు."
  },
  {
    "en": "Crypto and trading scams.",
    "hi": "क्रिप्टो और ट्रेडिंग स्कैम से सावधान रहें।",
    "te": "క్రిప్టో మరియు ట్రేడింగ్ స్కామ్‌లకు జాగ్రత్త."
  },
];

  @override
  void initState() {
    super.initState();
    speakAlerts();
  }

  Future<void> speakAlerts() async {
    String lang = await LanguageService.getLanguage();

    if (lang == "hi") {
      await tts.setLanguage("hi-IN");
    } else if (lang == "te") {
      await tts.setLanguage("te-IN");
    } else {
      await tts.setLanguage("en-IN");
    }

    await tts.setSpeechRate(0.4);

    for (var alert in alerts) {
      String text = alert[lang] ?? alert["en"]!;

      await tts.awaitSpeakCompletion(true);
      await tts.speak(text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E1A),
      appBar: AppBar(
        title: Text("Scam Alerts"),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(Icons.volume_up),
            onPressed: speakAlerts,
          )
        ],
      ),
      body: ListView.builder(
        itemCount: alerts.length,
        itemBuilder: (context, index) {
          return FutureBuilder<String>(
            future: LanguageService.getLanguage(),
            builder: (context, snapshot) {
              String lang = snapshot.data ?? "en";
              String text = alerts[index][lang] ?? alerts[index]["en"]!;

              return Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFF1A1F35),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Icon(Icons.warning, color: Colors.red),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        text,
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}