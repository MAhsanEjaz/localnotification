import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_sms/flutter_sms.dart';

class EmailSendScreen extends StatefulWidget {
  const EmailSendScreen({Key? key}) : super(key: key);

  @override
  State<EmailSendScreen> createState() => _EmailSendScreenState();
}

class _EmailSendScreenState extends State<EmailSendScreen> {
  Email email = Email(
      body: 'How are you',
      bcc: ['ahsanejaz99@gmail.com'],
      cc: ['ahsanejaz99@gmail.com'],
      isHTML: true,
      subject: 'What is this');

  emailSend() async {
    await FlutterEmailSender.send(email);
  }

  String message = "This is a test message!";
  List<String> recipents = ["1234567890", "5556787676"];

  sendMessageDirect() async {
    String _result =
        await sendSMS(message: message, recipients: recipents, sendDirect: true)
            .catchError((onError) {
      print(onError);
    });
    print(_result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  sendMessageDirect();
                },
                child: Text('Send'))
          ],
        ),
      ),
    );
  }
}
