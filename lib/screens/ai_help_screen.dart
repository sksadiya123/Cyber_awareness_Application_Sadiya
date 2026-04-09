import 'package:flutter/material.dart';
import '../services/openrouter_service.dart';
import '../models/chat_message.dart';

class AIHelpScreen extends StatefulWidget {
  @override
  _AIHelpScreenState createState() => _AIHelpScreenState();
}

class _AIHelpScreenState extends State<AIHelpScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final OpenRouterService _aiService = OpenRouterService();
  
  List<ChatMessage> messages = [];
  bool isLoading = false;
  bool hasStartedChat = false;

  @override
  void initState() {
    super.initState();
    _addWelcomeMessage();
  }

  void _addWelcomeMessage() {
    setState(() {
      messages.add(ChatMessage(
        text: "🛡️ CyberSafe AI Assistant Active\n\nI'm your cybersecurity specialist, ready to assist with:\n\n• Emergency incident response\n• Fraud detection & reporting\n• Identity theft recovery protocols\n• Advanced threat mitigation\n• Digital forensics guidance\n\nDescribe your security incident and I'll initiate the appropriate response protocol.",
        isUser: false,
        timestamp: DateTime.now(),
      ));
    });
  }

  void _sendMessage() async {
    final message = _messageController.text.trim();
    if (message.isEmpty) return;

    if (!_isCybersecurityRelated(message)) {
      _showNonCybersecurityDialog();
      return;
    }

    setState(() {
      hasStartedChat = true;
      messages.add(ChatMessage(
        text: message,
        isUser: true,
        timestamp: DateTime.now(),
      ));
      isLoading = true;
    });

    _messageController.clear();
    _scrollToBottom();

    try {
      final response = await _aiService.sendMessage(message);
      setState(() {
        messages.add(ChatMessage(
          text: response,
          isUser: false,
          timestamp: DateTime.now(),
        ));
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        messages.add(ChatMessage(
          text: "🔴 CONNECTION ERROR: Unable to reach security servers. For critical incidents, contact law enforcement immediately. System will retry connection automatically.",
          isUser: false,
          timestamp: DateTime.now(),
        ));
        isLoading = false;
      });
    }

    _scrollToBottom();
  }

  bool _isCybersecurityRelated(String message) {
    final cybersecurityKeywords = [
  // 🔐 General Cybercrime
  'fraud', 'scam', 'cybercrime', 'hacked', 'hacking', 'attack',
  'phishing', 'spoofing', 'identity theft', 'impersonation',

  // 💳 Banking & Money
  'bank', 'credit card', 'debit card', 'upi', 'transaction',
  'payment', 'money', 'refund', 'cashback', 'loan',
  'otp', 'pin', 'cvv', 'ifsc', 'account number',

  // 📱 Mobile & Apps
  'mobile', 'app', 'apk', 'download', 'install',
  'unknown app', 'fake app', 'loan app', 'spy app',

  // 🌐 Internet & Links
  'website', 'fake website', 'link', 'url', 'short link',
  'attachment', 'email link', 'sms link',

  // 📧 Email & Messages
  'email', 'fake email', 'spam', 'sms', 'whatsapp',
  'telegram', 'message', 'notification',

  // 🔑 Security
  'password', 'login', 'username', 'access',
  'two factor', '2fa', 'security', 'verification',

  // 🦠 Malware & Virus
  'virus', 'malware', 'trojan', 'spyware', 'ransomware',
  'keylogger', 'infected', 'hack tool',

  // 🕵️ Suspicious Activity
  'suspicious', 'unknown', 'unauthorized',
  'breach', 'leak', 'data leak', 'data breach',

  // 👤 Personal Data
  'personal information', 'data', 'profile',
  'aadhaar', 'pan', 'id proof', 'documents',

  // 📞 Calls & Social Engineering
  'call', 'fake call', 'customer care',
  'support', 'agent', 'bank call', 'telecaller',

  // 🛒 Online Shopping
  'shopping', 'offer', 'discount', 'sale',
  'fake product', 'delivery scam',

  // 💔 Social Media
  'facebook', 'instagram', 'account hacked',
  'fake profile', 'dm', 'message request',

  // 🎯 Common Scams
  'lottery', 'prize', 'win money',
  'job offer', 'job scam', 'work from home',
  'investment', 'crypto', 'trading scam',

  // ⚠ Emergency
  'help', 'stolen', 'lost', 'complaint',
  'report', 'cyber police'

    ];
    
    final lowerMessage = message.toLowerCase();
    return cybersecurityKeywords.any((keyword) => lowerMessage.contains(keyword));
  }

  void _showNonCybersecurityDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color(0xFF1A1F35),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            Icon(Icons.security, color: Color(0xFFEF4444)),
            SizedBox(width: 8),
            Text(
              'Security Protocol',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        content: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color(0xFFEF4444).withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Color(0xFFEF4444).withOpacity(0.3)),
          ),
          child: Text(
            'This AI is specialized for cybersecurity incidents only.\n\nAuthorized queries:\n• Security breaches\n• Fraud investigations\n• Identity theft cases\n• Malware incidents\n• Phishing attempts',
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Color(0xFF3B82F6), Color(0xFF1E3A8A)]),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text('UNDERSTOOD', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
    _messageController.clear();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!hasStartedChat) {
      return _buildLandingPage();
    }
    
    return _buildChatPage();
  }

  Widget _buildLandingPage() {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E1A),
      appBar: AppBar(
        title: Text('Incident Response', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF1A1F35),
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0A0E1A),
              Color(0xFF1A1F35),
              Color(0xFF0A0E1A),
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 40),
              
              // Alert Icon with Animation
              Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      Color(0xFFEF4444).withOpacity(0.3),
                      Color(0xFFEF4444).withOpacity(0.1),
                      Colors.transparent,
                    ],
                  ),
                  shape: BoxShape.circle,
                ),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xFFEF4444).withOpacity(0.2),
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0xFFEF4444), width: 2),
                  ),
                  child: Icon(
                    Icons.emergency,
                    size: 60,
                    color: Color(0xFFEF4444),
                  ),
                ),
              ),
              
              SizedBox(height: 32),
              
              Text(
                'SECURITY BREACH DETECTED?',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFEF4444),
                  letterSpacing: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
              
              SizedBox(height: 16),
              
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF00E676).withOpacity(0.1),
                      Color(0xFF00E676).withOpacity(0.05),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xFF00E676).withOpacity(0.3)),
                ),
                child: Text(
                  'Immediate response protocol activated.\nOur AI specialist will guide you through recovery.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              
              SizedBox(height: 32),
              
              // Capabilities Card
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF1E3A8A).withOpacity(0.8),
                      Color(0xFF3B82F6).withOpacity(0.6),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Color(0xFF00E676).withOpacity(0.3)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.psychology, color: Color(0xFF00E676)),
                        SizedBox(width: 8),
                        Text(
                          'AI SPECIALIST CAPABILITIES',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF00E676),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    _buildCapabilityItem('🚨', 'Emergency breach response'),
                    _buildCapabilityItem('💳', 'Financial fraud investigation'),
                    _buildCapabilityItem('🔒', 'Identity theft recovery'),
                    _buildCapabilityItem('📱', 'Social engineering analysis'),
                    _buildCapabilityItem('🛡️', 'Advanced threat mitigation'),
                    _buildCapabilityItem('📊', 'Digital forensics guidance'),
                  ],
                ),
              ),
              
              SizedBox(height: 32),
              
              // Start Button
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFEF4444), Color(0xFFDC2626)],
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFEF4444).withOpacity(0.4),
                      blurRadius: 12,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      setState(() {
                        hasStartedChat = true;
                      });
                    },
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.flash_on, color: Colors.white, size: 24),
                          SizedBox(width: 8),
                          Text(
                            'INITIATE EMERGENCY PROTOCOL',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              
              SizedBox(height: 24),
              
              // Emergency Notice
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFFF59E0B).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xFFF59E0B).withOpacity(0.3)),
                ),
                child: Row(
                  children: [
                    Icon(Icons.warning, color: Color(0xFFF59E0B), size: 20),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'For life-threatening emergencies, contact local law enforcement immediately',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[300],
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCapabilityItem(String emoji, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Text(emoji, style: TextStyle(fontSize: 16)),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatPage() {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E1A),
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.psychology, color: Color(0xFF00E676), size: 24),
            SizedBox(width: 8),
            Text(
              'AI Security Specialist',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        backgroundColor: Color(0xFF1A1F35),
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            setState(() {
              hasStartedChat = false;
              messages.clear();
              _addWelcomeMessage();
            });
          },
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Color(0xFF00E676).withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Color(0xFF00E676),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 6),
                Text(
                  'ONLINE',
                  style: TextStyle(
                    color: Color(0xFF00E676),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0A0E1A),
              Color(0xFF1A1F35),
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: EdgeInsets.all(16.0),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  return _buildMessageBubble(message);
                },
              ),
            ),
            
            if (isLoading)
              Container(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF00E676)),
                      ),
                    ),
                    SizedBox(width: 16),
                    Text(
                      'AI analyzing threat vectors...',
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                  ],
                ),
              ),
            
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF1A1F35),
                    Color(0xFF0A0E1A),
                  ],
                ),
                border: Border(
                  top: BorderSide(
                    color: Color(0xFF00E676).withOpacity(0.2),
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF1A1F35),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: Color(0xFF00E676).withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: TextField(
                        controller: _messageController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Describe your security incident...',
                          hintStyle: TextStyle(color: Colors.grey[500]),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 16,
                          ),
                          prefixIcon: Icon(
                            Icons.shield,
                            color: Color(0xFF00E676).withOpacity(0.7),
                          ),
                        ),
                        maxLines: null,
                        textInputAction: TextInputAction.send,
                        onSubmitted: (_) => _sendMessage(),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFEF4444), Color(0xFFDC2626)],
                      ),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFEF4444).withOpacity(0.4),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(25),
                        onTap: isLoading ? null : _sendMessage,
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageBubble(ChatMessage message) {
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6.0),
        padding: EdgeInsets.all(16.0),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.8,
        ),
        decoration: BoxDecoration(
          gradient: message.isUser
              ? LinearGradient(colors: [Color(0xFF3B82F6), Color(0xFF1E3A8A)])
              : LinearGradient(colors: [Color(0xFF1A1F35), Color(0xFF0F1419)]),
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: message.isUser
                ? Color(0xFF3B82F6).withOpacity(0.3)
                : Color(0xFF00E676).withOpacity(0.3),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: (message.isUser ? Color(0xFF3B82F6) : Color(0xFF00E676))
                  .withOpacity(0.2),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!message.isUser)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.psychology,
                    color: Color(0xFF00E676),
                    size: 16,
                  ),
                  SizedBox(width: 6),
                  Text(
                    'AI SPECIALIST',
                    style: TextStyle(
                      color: Color(0xFF00E676),
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            if (!message.isUser) SizedBox(height: 8),
            Text(
              message.text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                height: 1.4,
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (message.isUser)
                  Icon(
                    Icons.check_circle,
                    color: Colors.white.withOpacity(0.7),
                    size: 12,
                  ),
                if (message.isUser) SizedBox(width: 4),
                Text(
                  _formatTime(message.timestamp),
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}