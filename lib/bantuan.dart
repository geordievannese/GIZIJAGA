import 'package:flutter/material.dart';

class BantuanPage extends StatefulWidget {
  const BantuanPage({super.key});

  @override
  BantuanPageState createState() => BantuanPageState();
}

class BantuanPageState extends State<BantuanPage> {
  final TextEditingController _queryController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, String>> _chatMessages = [];
  bool _isTyping = false; // Indicator to show typing animation

  final List<String> _questionSuggestions = [
    'How much is the consultation fee?',
    'What payment method can I use?',
    'How do I make an appointment with a nutritionist?',
    'Can I set a calorie goal?',
    'What should I do if I miss my appointment?',
    'How can I view my payment history?'
  ];

  final Map<String, String> _faqResponses = {
    'how much is the consultation fee?': 'The consultation fee starts from \$50 per session.',
    'what payment method can i use?': 'We accept credit cards, PayPal, and bank transfers.',
    'what do i do if my payment is accepted but in the app it doesn\'t appear to be successful?':
        'If your payment was accepted but does not reflect in the app, please try refreshing the app or contact support for assistance.',
    'obat': "Do you need medical assistant?, please consult to a Nutritionist. I can't prescribe you since, I am built using a database.",
    'how can i track my daily calorie intake?': 'You can track your daily calorie intake by using the "Cek Gizi Harian" feature in the app. It allows you to enter your food and drink consumption and calculates the calories for you.',
    'how': "can you specify more?, try typing : appointment",
    'can i set a calorie goal?': 'Yes, in the "Cek Gizi Harian" feature, you can set a daily calorie goal based on your personal health goals and monitor your intake accordingly.',
    'how do i make an appointment with a nutritionist?': 'To book an appointment, go to the "Konsultasi Dokter" page, select a nutritionist, and choose a time slot that fits your schedule.',
    'what should i bring to my consultation?': 'Bring a record of your recent meals, any medical history relevant to nutrition, and a list of your health goals. This information will help the nutritionist provide tailored advice.',
    'can i reschedule my nutritionist appointment?': 'Yes, you can reschedule your appointment by going to the "Konsultasi Dokter" page and selecting the reschedule option under your appointment details.',
    'what should i do if i miss my appointment?': 'If you miss an appointment, please contact support or your nutritionist directly to reschedule or inquire about any possible fees.',
    'how can i view my payment history?': 'To view your payment history, go to the "Account" section and select "Payment History" to see a summary of all your past transactions.',
    'is my payment information secure?': 'Yes, we use secure encryption and follow industry standards to protect your payment information.',
    'hello': 'Hello!, How can I help?',
  };

  void _sendMessage(String query) {
    final lowerQuery = query.trim().toLowerCase(); // Convert query to lowercase
    if (query.isNotEmpty) {
      setState(() {
        _chatMessages.add({'sender': 'user', 'message': query});
      });
      _scrollToBottom(); // Scroll to bottom after user message
      _showTypingIndicator();
      _provideResponse(lowerQuery);
    }
  }

  void _showTypingIndicator() {
    setState(() {
      _isTyping = true;
    });
  }

  void _hideTypingIndicator() {
    setState(() {
      _isTyping = false;
    });
  }

  String _findClosestResponse(String query) {
    if (_faqResponses.containsKey(query)) {
      return _faqResponses[query]!;
    }

    for (var key in _faqResponses.keys) {
      if (query.contains(key) || key.contains(query)) {
        return _faqResponses[key]!;
      }
    }

    return 'Sorry, I couldn\'t find an answer for that. Please contact support.';
  }

  void _provideResponse(String query) {
    final response = _findClosestResponse(query);

    Future.delayed(const Duration(milliseconds: 1500), () {
      // Simulate AI typing delay
      _hideTypingIndicator();
      setState(() {
        _chatMessages.add({'sender': 'assistant', 'message': response});
      });
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
  title: const Text(
    'Pusat Bantuan',
    style: TextStyle(color: Colors.white), 
  ),
  backgroundColor: const Color.fromARGB(179, 23, 227, 8), 
),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 8.0,
              children: _questionSuggestions.map((question) {
                return GestureDetector(
                  onTap: () {
                    _sendMessage(question);
                  },
                  child: Chip(
                    label: Text(question),
                    backgroundColor: Colors.grey[200],
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _chatMessages.length + (_isTyping ? 1 : 0),
              itemBuilder: (context, index) {
                if (_isTyping && index == _chatMessages.length) {
                  // Show typing indicator at the end
                  return const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      child: Text("Assistant is typing..."),
                    ),
                  );
                }
                final message = _chatMessages[index];
                final isUser = message['sender'] == 'user';
                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.green : Colors.grey[300],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      message['message']!,
                      style: TextStyle(color: isUser ? Colors.white : Colors.black),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _queryController,
                    decoration: const InputDecoration(
                      hintText: 'Ask me something...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    _sendMessage(_queryController.text);
                    _queryController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
