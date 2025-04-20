import 'package:flutter/material.dart';
import 'package:neura_ai_2/models/message.dart';
import 'package:neura_ai_2/providers/chat_provider.dart';
import 'package:neura_ai_2/widgets/assistant_message_widget.dart';
import 'package:neura_ai_2/widgets/my_message_widget.dart';


class ChatMessages extends StatelessWidget {
  const ChatMessages({
    super.key,
    required this.scrollController,
    required this.chatProvider,
  });

  final ScrollController scrollController;
  final ChatProvider chatProvider;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: chatProvider.inChatMessages.length,
      itemBuilder: (context, index) {
        // compare with timeSent before showing the list
        final message = chatProvider.inChatMessages[index];
        return message.role.name == Role.user.name
            ? MyMessageWidget(message: message)
            : AssistantMessageWidget(message: message.message.toString());
      },
    );
  }
}
