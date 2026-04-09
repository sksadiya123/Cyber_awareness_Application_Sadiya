import 'package:flutter/material.dart';
import '../models/education_topic.dart';
import 'topic_detail_screen.dart';

class EducationScreen extends StatefulWidget {
  @override
  _EducationScreenState createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<EducationTopic> filteredTopics = [];
  
  final List<EducationTopic> topics = [
    EducationTopic(
      id: 1,
      title: 'Password Safety',
      subtitle: 'Create and manage strong passwords',
      icon: Icons.lock,
      content: '''
# Password Safety Guide

## Why Strong Passwords Matter
Passwords are your first line of defense against cybercriminals. Weak passwords are like leaving your house key under a doormat.

## How to Create Strong Passwords
- **Use at least 12 characters**
- **Mix uppercase and lowercase letters**
- **Include numbers and special characters**
- **Avoid personal information** (birthdays, names, etc.)

## Good Password Examples
- MyDog\$Loves2Bark!
- Coffee&Rain2024#
- BlueSky!Morning88

## What NOT to Do
❌ Use "password123" or "123456"
❌ Use the same password everywhere
❌ Share your passwords with others
❌ Write passwords on sticky notes

## Password Manager Tips
Consider using password managers like:
- Built-in browser password managers
- Dedicated apps for better security
- They generate and store strong passwords for you

## Two-Factor Authentication (2FA)
Always enable 2FA when available:
- Adds an extra security layer
- Usually requires your phone for verification
- Makes it much harder for hackers to access your accounts
''',
      quiz: [
        QuizQuestion('How many characters should a strong password have?', ['8', '10', '12', '6'], 2),
        QuizQuestion('Should you use the same password for all accounts?', ['Yes', 'No'], 1),
        QuizQuestion('What is 2FA?', ['Two-Factor Authentication', 'Two-Finger Authentication', 'Two-Face Authentication'], 0),
      ],
    ),
    
    EducationTopic(
      id: 2,
      title: 'Email & Messaging Security',
      subtitle: 'Identify and avoid phishing attempts',
      icon: Icons.email,
      content: '''
# Email & Messaging Security

## What is Phishing?
Phishing is when criminals send fake emails or messages to trick you into giving them your personal information.

## Red Flags to Watch For
🚩 **Urgent language**: "Act now or lose your account!"
🚩 **Spelling mistakes**: Professional companies don't send poorly written emails
🚩 **Suspicious links**: Hover over links to see where they really go
🚩 **Unexpected attachments**: Don't open files you weren't expecting
🚩 **Requests for personal info**: Banks never ask for passwords via email

## Common Phishing Examples
- "Your account will be closed unless you verify now"
- "You've won a prize! Click here to claim"
- "Suspicious activity detected - confirm your details"
- "Invoice attached" (when you didn't buy anything)

## How to Stay Safe
✅ **Think before you click**
✅ **Verify sender identity** - call them directly if unsure
✅ **Check the email address** - look for slight misspellings
✅ **Don't download unexpected attachments**
✅ **Report suspicious emails** to your email provider

## Safe Email Practices
- Use spam filters
- Keep your email software updated
- Be careful with public Wi-Fi email access
- Log out of email on shared computers
- Use strong passwords for email accounts

## What to Do if You've Been Phished
1. **Don't panic**
2. **Change your passwords immediately**
3. **Contact your bank/credit card companies**
4. **Report to local authorities**
5. **Monitor your accounts closely**
''',
      quiz: [
        QuizQuestion('What should you do with suspicious emails?', ['Click to investigate', 'Delete and report', 'Forward to friends'], 1),
        QuizQuestion('Do banks ask for passwords via email?', ['Yes', 'No'], 1),
      ],
    ),
    
    EducationTopic(
      id: 3,
      title: 'Social Media Safety',
      subtitle: 'Protect your privacy and personal information',
      icon: Icons.people,
      content: '''
# Social Media Safety

## Privacy Settings Are Your Friend
Most people don't realize how much personal information they're sharing publicly on social media.

## What NOT to Share
❌ **Full birth date** (identity theft risk)
❌ **Your location in real-time** (safety risk)
❌ **Photos of important documents** (ID, credit cards, etc.)
❌ **Vacation plans** (while you're away from home)
❌ **Personal family details** (children's schools, etc.)
❌ **Financial information** (bragging about money)

## Privacy Settings Checklist
✅ Make your profile private
✅ Review who can see your posts
✅ Control who can tag you
✅ Limit personal information visibility
✅ Turn off location tracking
✅ Review app permissions regularly

## Recognizing Fake Profiles
🚨 **Warning signs:**
- Very few friends/followers
- Profile created recently
- Limited personal photos
- Sends friend requests to strangers
- Asks personal questions quickly

## Social Media Scams
- **Romance scams**: Fake profiles building relationships
- **Prize scams**: "You've won! Just pay shipping"
- **Job scams**: "Work from home - easy money"
- **Charity scams**: Fake fundraising after disasters

## Best Practices
- Think before you post
- Use privacy settings
- Be selective with friend requests
- Report suspicious activity
- Keep personal information private
- Use strong passwords
- Enable two-factor authentication
''',
      quiz: [
        QuizQuestion('Should you accept friend requests from strangers?', ['Yes', 'No'], 1),
        QuizQuestion('Is it safe to post your vacation plans in real-time?', ['Yes', 'No'], 1),
      ],
    ),
    
    EducationTopic(
      id: 4,
      title: 'Online Shopping & Banking',
      subtitle: 'Shop and bank safely online',
      icon: Icons.shopping_cart,
      content: '''
# Online Shopping & Banking Safety

## How to Identify Secure Websites
🔒 **Look for HTTPS** - the "S" stands for Secure
🔒 **Check for a padlock icon** in the address bar
🔒 **Verify the website address** - scammers use similar-looking URLs

## Safe Online Shopping Tips
✅ **Shop from reputable websites**
✅ **Read reviews and ratings**
✅ **Use secure payment methods**
✅ **Keep receipts and confirmations**
✅ **Check your statements regularly**

## Red Flags When Shopping Online
🚩 **Prices too good to be true**
🚩 **No contact information provided**
🚩 **Poor website design/spelling errors**
🚩 **Only accepts wire transfers or gift cards**
🚩 **Pressures you to buy immediately**

## Online Banking Safety
- **Only use official bank apps/websites**
- **Never bank on public Wi-Fi**
- **Log out completely when done**
- **Monitor accounts regularly**
- **Set up account alerts**
- **Use strong, unique passwords**

## Safe Payment Methods
**Safest:**
- Credit cards (better fraud protection)
- PayPal or similar services
- Bank transfers through official apps

**Avoid:**
- Wire transfers to strangers
- Gift cards as payment
- Cryptocurrency to unknown sellers
- Debit cards on unfamiliar sites

## If Something Goes Wrong
1. **Contact your bank/credit card company immediately**
2. **Document everything** (screenshots, emails)
3. **Report to authorities**
4. **Dispute charges if necessary**
5. **Change passwords**
''',
      quiz: [
        QuizQuestion('What does HTTPS stand for?', ['HyperText Transfer Protocol Secure', 'High Tech Transfer Protection System'], 0),
        QuizQuestion('Should you use public Wi-Fi for online banking?', ['Yes', 'No'], 1),
      ],
    ),
    
    EducationTopic(
      id: 5,
      title: 'Wi-Fi & Internet Safety',
      subtitle: 'Secure your internet connection',
      icon: Icons.wifi,
      content: '''
# Wi-Fi & Internet Safety

## Public Wi-Fi Dangers
Public Wi-Fi networks are like postcards - anyone can read what you're sending.

## Risks of Public Wi-Fi
⚠️ **Data theft** - Others can see your internet activity
⚠️ **Password capture** - Login credentials can be stolen
⚠️ **Fake hotspots** - Criminals create fake Wi-Fi networks
⚠️ **Malware** - Infected networks can harm your device

## How to Use Public Wi-Fi Safely
✅ **Avoid sensitive activities** (banking, shopping)
✅ **Use HTTPS websites only**
✅ **Turn off automatic Wi-Fi connection**
✅ **Use your phone's hotspot instead**
✅ **Consider a VPN** for extra protection

## Home Wi-Fi Security
Your home network needs protection too!

## Securing Your Home Wi-Fi
1. **Change default router password**
2. **Use WPA3 or WPA2 security**
3. **Create a strong network password**
4. **Hide your network name (SSID)**
5. **Update router firmware regularly**
6. **Use guest networks for visitors**

## Safe Browsing Habits
- **Look for HTTPS on websites**
- **Don't click suspicious links**
- **Keep your browser updated**
- **Use reputable antivirus software**
- **Be careful with downloads**

## Warning Signs of Unsafe Websites
🚨 **Pop-up warnings** about viruses
🚨 **Requests to download software** to view content
🚨 **Too many ads** or inappropriate content
🚨 **Requests for unnecessary personal information**

## Internet Safety for the Family
- **Educate family members** about online risks
- **Set up parental controls** if needed
- **Create family internet rules**
- **Monitor internet usage** on shared devices
- **Keep devices updated**
''',
      quiz: [
        QuizQuestion('Is public Wi-Fi safe for online banking?', ['Yes', 'No'], 1),
        QuizQuestion('What security should your home Wi-Fi use?', ['WEP', 'WPA2/WPA3', 'No security'], 1),
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    filteredTopics = topics;
    _searchController.addListener(_filterTopics);
  }

  void _filterTopics() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredTopics = topics.where((topic) {
        return topic.title.toLowerCase().contains(query) ||
               topic.subtitle.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E1A),
      appBar: AppBar(
        title: Row(
          children: [
            Icon(
              Icons.school,
              color: Color(0xFF00E676),
              size: 28,
            ),
            SizedBox(width: 12),
            Text(
              'Cyber Training Hub',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xFF1A1F35),
        elevation: 0,
        centerTitle: false,
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
        child: Column(
          children: [
            // Header Stats
            Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF1E3A8A).withOpacity(0.8),
                    Color(0xFF3B82F6).withOpacity(0.6),
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Color(0xFF00E676).withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _buildStatItem('5', 'Training\nModules', Color(0xFF00E676)),
                  ),
                  Container(
                    width: 1,
                    height: 40,
                    color: Colors.white.withOpacity(0.2),
                  ),
                  Expanded(
                    child: _buildStatItem('∞', 'Knowledge\nBase', Color(0xFF3B82F6)),
                  ),
                  Container(
                    width: 1,
                    height: 40,
                    color: Colors.white.withOpacity(0.2),
                  ),
                  Expanded(
                    child: _buildStatItem('24/7', 'Learning\nAccess', Color(0xFFF59E0B)),
                  ),
                ],
              ),
            ),
            
            // Search Bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF1A1F35),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Color(0xFF00E676).withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: TextField(
                  controller: _searchController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Search training modules...',
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xFF00E676).withOpacity(0.7),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                  ),
                ),
              ),
            ),
            
            SizedBox(height: 16),
            
            // Training Modules Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Icon(
                    Icons.military_tech,
                    color: Color(0xFF00E676),
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'ADVANCED TRAINING MODULES',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00E676),
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 16),
            
            // Topics List
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: filteredTopics.length,
                itemBuilder: (context, index) {
                  final topic = filteredTopics[index];
                  final colors = _getTopicColors(index);
                  return _buildTopicCard(topic, colors, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white.withOpacity(0.8),
            height: 1.2,
          ),
        ),
      ],
    );
  }

  List<Color> _getTopicColors(int index) {
    final colorSets = [
      [Color(0xFFEF4444), Color(0xFFDC2626)], // Red
      [Color(0xFF3B82F6), Color(0xFF1E3A8A)], // Blue
      [Color(0xFF10B981), Color(0xFF059669)], // Green
      [Color(0xFFF59E0B), Color(0xFFD97706)], // Orange
      [Color(0xFF8B5CF6), Color(0xFF7C3AED)], // Purple
    ];
    return colorSets[index % colorSets.length];
  }

  Widget _buildTopicCard(EducationTopic topic, List<Color> colors, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colors[0].withOpacity(0.1),
            colors[1].withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colors[0].withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TopicDetailScreen(topic: topic),
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: colors),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: colors[0].withOpacity(0.3),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(
                    topic.icon,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              topic.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: colors[0].withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'LVL ${index + 1}',
                              style: TextStyle(
                                color: colors[0],
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        topic.subtitle,
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 14,
                          height: 1.3,
                        ),
                      ),
                      SizedBox(height: 12),
                      Row(
                        children: [
                          Icon(
                            Icons.quiz,
                            color: colors[0],
                            size: 16,
                          ),
                          SizedBox(width: 6),
                          Text(
                            '${topic.quiz.length} Challenge Questions',
                            style: TextStyle(
                              color: colors[0],
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white.withOpacity(0.7),
                            size: 16,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}