import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenRouterService {
  static const String _baseUrl = 'https://openrouter.ai/api/v1/chat/completions';
  static const String _apiKey = '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'; // Replace with your actual API key
  
  final String _systemPrompt = '''
You are an expert cybersecurity assistant specializing in fraud and cybercrime recovery. You help victims with specific, actionable solutions.

EXPERTISE AREAS:
- Email/SMS phishing and scams
- Financial fraud (credit cards, banking, online payments)
- Identity theft and data breaches
- Social media hacking and fake profiles
- Online shopping fraud and fake websites
- Romance and investment scams
- Account hacking and password issues
- Malware and suspicious software
- Wi-Fi and network security issues

RESPONSE STYLE:
1. Understand the SPECIFIC situation first
2. Provide immediate protective steps
3. Give detailed recovery instructions
4. Include reporting procedures for India (Cyber Crime Helpline: 1930, cybercrime.gov.in)
5. Be empathetic but practical
6. Ask follow-up questions to provide better help

EXAMPLE: If someone says "I got scammed", ask: "What type of scam? Was money involved? What information did you share? This helps me give you specific recovery steps."

Focus on understanding their exact problem and giving tailored solutions, not generic advice.
''';

  Future<String> sendMessage(String userMessage) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_apiKey',
          'HTTP-Referer': 'https://cyberhelp.app',
          'X-Title': 'CyberSecurity Help App',
        },
        body: jsonEncode({
          'model': 'meta-llama/llama-3.1-8b-instruct:free', // Free model
          'messages': [
            {
              'role': 'system',
              'content': _systemPrompt,
            },
            {
              'role': 'user',
              'content': userMessage,
            }
          ],
          'max_tokens': 1000,
          'temperature': 0.7,
        }),
      );
bool isCyberQuery(String text) {
  final keywords = [
    'fraud','scam','hacked','phishing','otp','bank','upi',
    'password','virus','malware','account','money','fake',
    'loan','job','lottery','payment','link','email','message'
  ];
  text = text.toLowerCase();

  return keywords.any((keyword) => text.contains(keyword));
}
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final aiResponse = data['choices'][0]['message']['content'];
        
        // Add standard footer with reporting info
        final responseWithFooter = '''
$aiResponse

📞 IMPORTANT: For immediate help or to report cybercrime:
• National Cyber Crime Helpline: 1930
• Local Police Cyber Crime Cell
• Your bank's fraud hotline (if financial fraud)

Remember: Act quickly, don't panic, and keep records of everything.
        ''';
        
        return responseWithFooter.trim();
      } else {
        throw Exception('Failed to get response: ${response.statusCode}');
      }
    } catch (e) {
      // Fallback response if API fails
      return _getFallbackResponse(userMessage);
    }
  }

  String _getFallbackResponse(String userMessage) {
    // Basic keyword-based fallback responses
    final message = userMessage.toLowerCase();
    
    if (message.contains('scam') || message.contains('fraud')) {
      return '''
I understand you may have encountered a scam or fraud. Here are immediate steps:

1. **Stop all contact** with the suspected scammer
2. **Don't send any more money** or personal information
3. **Document everything** - save emails, messages, transaction records
4. **Contact your bank** immediately if money was involved
5. **Report to authorities**:
   • National Cyber Crime Helpline: 1930
   • Local Police Cyber Crime Cell
   • File online complaint at cybercrime.gov.in

6. **Change passwords** for any accounts that may be compromised
7. **Monitor your accounts** closely for unauthorized activity

Remember: You're not alone, and reporting helps prevent others from being victimized.

What specific type of scam did you encounter? I can provide more targeted advice.
      ''';
    }
    
    if (message.contains('hack') || message.contains('password')) {
      return '''
If your account has been hacked, act quickly:

**IMMEDIATE STEPS:**
1. **Change your password** right away (use a strong, unique one)
2. **Enable two-factor authentication** if available
3. **Check recent activity** on the account
4. **Log out all devices** from account settings
5. **Review and revoke** suspicious app permissions

**NEXT STEPS:**
6. **Scan your devices** for malware
7. **Check other accounts** that used the same password
8. **Update recovery information** (email, phone)
9. **Report to the platform** if it's a social media/email account

**IF FINANCIAL ACCOUNTS:**
• Contact your bank/credit card company immediately
• File a police report
• Monitor credit reports

Need help with a specific platform or type of account? Let me know!
      ''';
    }
    
    if (message.contains('phish') || message.contains('suspicious email')) {
      return '''
Received a suspicious email? Here's what to do:

**DON'T:**
❌ Click any links in the email
❌ Download attachments
❌ Reply or provide any information
❌ Forward it to others

**DO:**
✅ **Report it** as spam/phishing to your email provider
✅ **Delete the email** after reporting
✅ **Check your accounts** if you clicked anything
✅ **Change passwords** if you entered any information

**WARNING SIGNS of phishing:**
• Urgent language ("act now or lose account")
• Spelling/grammar errors
• Suspicious sender address
• Requests for personal information
• Unexpected attachments

If you already clicked or provided information:
1. Change relevant passwords immediately
2. Contact affected companies directly
3. Monitor accounts closely
4. Report to cybercrime.gov.in

What specifically made the email suspicious?
      ''';
    }
    
    // Default response
    return '''
I'm here to help with your cybersecurity issue. While I'm having trouble connecting to my full knowledge base right now, here are some general steps:

**IMMEDIATE ACTIONS:**
1. **Stay calm** - most issues can be resolved
2. **Document everything** - take screenshots, save messages
3. **Change passwords** for any potentially affected accounts
4. **Contact relevant companies** directly using official phone numbers

**REPORTING:**
• National Cyber Crime Helpline: 1930
• Online: cybercrime.gov.in
• Local Police Cyber Crime Cell

Could you provide more details about your specific situation? Even with limited connectivity, I can try to give you more targeted advice based on keywords like:
• Email scam, phone fraud, identity theft
• Hacked account, suspicious activity
• Online shopping fraud, fake website
• Social media issues, fake profiles

What type of cybersecurity issue are you dealing with?
    ''';
  }
}