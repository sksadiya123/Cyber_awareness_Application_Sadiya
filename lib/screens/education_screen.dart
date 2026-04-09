import 'package:flutter/material.dart';
import '../models/education_topic.dart';
import 'topic_detail_screen.dart';

class EducationScreen extends StatelessWidget {
  final List<EducationTopic> topics = [

    // 🔥 1. PHISHING
    EducationTopic(
      id: 1,
      title: "Phishing",
      subtitle: "Fake messages to steal data",
      icon: Icons.warning,

      contentEn: """
Phishing is one of the most common cyber attacks.

Attackers send fake emails, messages, or links pretending to be banks, companies, or government.

⚠ Risks:
- Stealing passwords
- Stealing bank details
- Account hacking

✅ Safety Tips:
- Never click unknown links
- Check sender email carefully
- Do not share OTP or password
- Verify website URL before login

Example:
Message: "Your bank account blocked. Click here"

👉 This is FAKE
""",

      contentHi: """
फिशिंग एक आम साइबर हमला है।

धोखेबाज नकली ईमेल या मैसेज भेजते हैं।

⚠ खतरे:
- पासवर्ड चोरी
- बैंक जानकारी चोरी

✅ सुरक्षा:
- अज्ञात लिंक पर क्लिक न करें
- ओटीपी साझा न करें
""",

      contentTe: """
ఫిషింగ్ ఒక సాధారణ సైబర్ దాడి.

మోసగాళ్లు నకిలీ సందేశాలు పంపుతారు.

⚠ ప్రమాదాలు:
- పాస్‌వర్డ్ దొంగతనం
- బ్యాంక్ వివరాలు దొంగతనం

✅ భద్రత:
- తెలియని లింక్ క్లిక్ చేయవద్దు
- ఓటీపీ పంచుకోవద్దు
""",

      quiz: [
        QuizQuestion("Phishing means?", ["Safe", "Fake"], 1),
      ],
    ),

    // 🔥 2. SOCIAL MEDIA SCAMS
    EducationTopic(
      id: 2,
      title: "Social Media Scams",
      subtitle: "Fake profiles & messages",
      icon: Icons.people,

      contentEn: """
Social media scams are increasing rapidly.

Hackers create fake accounts or hack your friends’ accounts.

⚠ Common scams:
- Fake job offers
- Fake investment links
- Romance scams

✅ Safety:
- Do not trust unknown profiles
- Do not send money online
- Enable 2FA
- Report fake accounts

Example:
"Send money urgently, I am in trouble"

👉 Verify before trusting
""",

      contentHi: """
सोशल मीडिया स्कैम तेजी से बढ़ रहे हैं।

⚠ खतरे:
- फर्जी प्रोफाइल
- पैसे मांगना

✅ सुरक्षा:
- अजनबी पर भरोसा न करें
- पैसे न भेजें
""",

      contentTe: """
సోషల్ మీడియా మోసాలు పెరుగుతున్నాయి.

⚠ ప్రమాదాలు:
- నకిలీ ఖాతాలు
- డబ్బు అడగడం

✅ భద్రత:
- అపరిచితులను నమ్మవద్దు
- డబ్బు పంపవద్దు
""",

      quiz: [
        QuizQuestion("Should you trust unknown profiles?", ["Yes", "No"], 1),
      ],
    ),

    // 🔥 3. PASSWORD SECURITY
    EducationTopic(
      id: 3,
      title: "Password Security",
      subtitle: "Keep accounts safe",
      icon: Icons.lock,

      contentEn: """
Strong passwords protect your accounts.

⚠ Weak password = easy hack

✅ Tips:
- Use 8+ characters
- Mix letters, numbers, symbols
- Do not reuse passwords
- Enable 2FA

Example:
❌ 123456
✅ A@123Strong

👉 Keep it strong!
""",

      contentHi: """
मजबूत पासवर्ड जरूरी है।

✅ सुझाव:
- बड़ा पासवर्ड रखें
- 2FA चालू करें
""",

      contentTe: """
బలమైన పాస్‌వర్డ్ అవసరం.

✅ చిట్కాలు:
- పెద్ద పాస్‌వర్డ్ వాడండి
- 2FA ఆన్ చేయండి
""",

      quiz: [
        QuizQuestion("Strong password should be?", ["Simple", "Complex"], 1),
      ],
    ),

    // 🔥 4. UPI SCAM
    EducationTopic(
      id: 4,
      title: "UPI Scam",
      subtitle: "Payment fraud awareness",
      icon: Icons.payment,

      contentEn: """
UPI scams are very common in India.

⚠ Trick:
Fraudster sends payment request

❌ You think you will receive money
✅ Actually you are sending money

👉 Rule:
Receiving money does NOT require approval

✅ Safety:
- Never approve unknown request
- Check details carefully
""",

      contentHi: """
यूपीआई स्कैम बहुत आम है।

पैसे पाने के लिए मंजूरी नहीं चाहिए।
""",

      contentTe: """
UPI మోసం సాధారణం.

డబ్బు పొందడానికి అనుమతి అవసరం లేదు.
""",

      quiz: [
        QuizQuestion("UPI request should be?", ["Accept", "Reject"], 1),
      ],
    ),

    // 🔥 5. MALWARE
    EducationTopic(
      id: 5,
      title: "Malware",
      subtitle: "Virus & harmful apps",
      icon: Icons.bug_report,

      contentEn: """
Malware is harmful software.

⚠ Types:
- Virus
- Spyware
- Trojan

It can:
- Steal data
- Track activity
- Hack phone

✅ Safety:
- Install apps from Play Store
- Avoid unknown APK files
- Use antivirus
""",

      contentHi: "मैलवेयर खतरनाक सॉफ्टवेयर है।",
      contentTe: "మాల్వేర్ హానికరమైన సాఫ్ట్‌వేర్.",

      quiz: [
        QuizQuestion("Malware is?", ["Safe", "Dangerous"], 1),
      ],
    ),

    // 🔥 6. OTP FRAUD
    EducationTopic(
      id: 6,
      title: "OTP Fraud",
      subtitle: "Never share OTP",
      icon: Icons.sms,

      contentEn: """
OTP fraud happens when someone asks your OTP.

⚠ Reality:
Bank NEVER asks OTP

✅ Rule:
Never share OTP with anyone

👉 Even bank employee = FAKE
""",

      contentHi: "ओटीपी कभी साझा न करें।",
      contentTe: "ఓటీపీ ఎప్పుడూ పంచుకోవద్దు.",

      quiz: [
        QuizQuestion("Share OTP?", ["Yes", "No"], 1),
      ],
    ),

    // 🔥 7. ONLINE SHOPPING SCAM
    EducationTopic(
      id: 7,
      title: "Online Shopping Fraud",
      subtitle: "Fake websites",
      icon: Icons.shopping_cart,

      contentEn: """
Fake websites offer huge discounts.

⚠ Signs:
- Very low price
- No reviews
- Fake URL

✅ Safety:
- Check website URL
- Read reviews
- Use trusted apps
""",

      contentHi: "ऑनलाइन धोखाधड़ी से सावधान रहें।",
      contentTe: "ఆన్‌లైన్ మోసాలకు జాగ్రత్త.",

      quiz: [
        QuizQuestion("Fake sites give?", ["Normal price", "Huge discount"], 1),
      ],
    ),

    // 🔥 8. IDENTITY THEFT
    EducationTopic(
      id: 8,
      title: "Identity Theft",
      subtitle: "Your data misuse",
      icon: Icons.person,

      contentEn: """
Identity theft means using your personal data illegally.

⚠ Data:
- Aadhaar
- PAN
- Bank details

✅ Safety:
- Do not share documents
- Use secure apps
""",

      contentHi: "पहचान चोरी से बचें।",
      contentTe: "గుర్తింపు దొంగతనం నుండి జాగ్రత్త.",

      quiz: [
        QuizQuestion("Identity theft means?", ["Safe use", "Misuse"], 1),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E1A),
      appBar: AppBar(
        title: Text("Learn Hub"),
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        itemCount: topics.length,
        itemBuilder: (context, index) {
          final topic = topics[index];

          return Card(
            color: Color(0xFF1A1F35),
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(topic.icon, color: Colors.green),
              title: Text(topic.title,
                  style: TextStyle(color: Colors.white)),
              subtitle: Text(topic.subtitle,
                  style: TextStyle(color: Colors.grey)),
              trailing:
                  Icon(Icons.arrow_forward_ios, color: Colors.grey),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        TopicDetailScreen(topic: topic),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}