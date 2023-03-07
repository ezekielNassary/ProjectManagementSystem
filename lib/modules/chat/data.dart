import 'package:dash_chat_2/dash_chat_2.dart';

String profileImage =
    'https://firebasestorage.googleapis.com/v0/b/molteo-40978.appspot.com/o/1-intro-photo-final.jpeg?alt=media&token=daf78997-d8f0-49d1-9120-a9380bde48b5';

// We have all the possibilities for users
ChatUser user = ChatUser(
  id: '0',
  firstName: 'Fatuma ',
  lastName: 'Nkhangaa',
  profileImage: profileImage,
);
ChatUser user1 = ChatUser(
    id: '1',
    firstName: 'Ezekiel',
    lastName: 'Nassary',
    profileImage: profileImage,
    customProperties: {'Age': '32'});
ChatUser user2 = ChatUser(
    id: '2',
    firstName: 'Daniel',
    lastName: 'Felcian',
    profileImage: profileImage);

List<ChatMessage> allUsersSample = <ChatMessage>[
  ChatMessage(
    text: 'Test',
    user: user,
    createdAt: DateTime(2021, 01, 30, 16, 45),
  ),
  ChatMessage(
    text: 'Test',
    user: user1,
    createdAt: DateTime(2021, 01, 30, 16, 45),
  ),
  ChatMessage(
    text: 'Test',
    user: user2,
    createdAt: DateTime(2021, 01, 30, 16, 45),
  ),
];

List<ChatMessage> basicSample = <ChatMessage>[
  ChatMessage(
    text: "and please make sure right side is visible",
    user: user1,
    createdAt: DateTime(2021, 01, 30, 16, 45),
  ),
  ChatMessage(
    text: 'please send more photos',
    user: user,
    createdAt: DateTime(2021, 01, 30, 16, 45),
  ),
  ChatMessage(
      text: 'Hello this is our project',
      user: user2,
      createdAt: DateTime(2021, 01, 31, 16, 45),
      mentions: [
        Mention(title: user.lastName!),
        Mention(title: '&you'),
      ],
      medias: [
        ChatMedia(
          url:
              'https://firebasestorage.googleapis.com/v0/b/molteo-40978.appspot.com/o/memes%2F155512641_3864499247004975_4028017188079714246_n.jpg?alt=media&token=0b335455-93ed-4529-9055-9a2c741e0189',
          type: MediaType.image,
          fileName: 'image.png',
          isUploading: false,
        ),
      ]),
];

List<ChatMessage> media = <ChatMessage>[
  ChatMessage(
    medias: <ChatMedia>[
      ChatMedia(
        url:
            'https://firebasestorage.googleapis.com/v0/b/molteo-40978.appspot.com/o/memes%2F155512641_3864499247004975_4028017188079714246_n.jpg?alt=media&token=0b335455-93ed-4529-9055-9a2c741e0189',
        type: MediaType.image,
        fileName: 'image.png',
        isUploading: false,
      ),
      ChatMedia(
        url:
            'https://firebasestorage.googleapis.com/v0/b/molteo-40978.appspot.com/o/memes%2F155512641_3864499247004975_4028017188079714246_n.jpg?alt=media&token=0b335455-93ed-4529-9055-9a2c741e0189',
        type: MediaType.image,
        fileName: 'image.png',
      ),
      ChatMedia(
        url:
            'https://firebasestorage.googleapis.com/v0/b/molteo-40978.appspot.com/o/chat_medias%2F2GFlPkj94hKCqonpEdf1%2F20210526_162318.mp4?alt=media&token=01b814b9-d93a-4bf1-8be1-cf9a49058f97',
        type: MediaType.video,
        fileName: 'video.mp4',
        isUploading: true,
      ),
      ChatMedia(
        url:
            'https://firebasestorage.googleapis.com/v0/b/molteo-40978.appspot.com/o/memes%2F155512641_3864499247004975_4028017188079714246_n.jpg?alt=media&token=0b335455-93ed-4529-9055-9a2c741e0189',
        type: MediaType.file,
        fileName: 'image.png',
      ),
      ChatMedia(
        url:
            'https://firebasestorage.googleapis.com/v0/b/molteo-40978.appspot.com/o/memes%2F155512641_3864499247004975_4028017188079714246_n.jpg?alt=media&token=0b335455-93ed-4529-9055-9a2c741e0189',
        type: MediaType.image,
        fileName: 'image.png',
      )
    ],
    user: user1,
    createdAt: DateTime(2021, 01, 30, 16, 34),
  ),
];

List<ChatMessage> quickReplies = <ChatMessage>[
  ChatMessage(
    text: 'How you doin?',
    user: user2,
    createdAt: DateTime.now(),
    quickReplies: <QuickReply>[
      QuickReply(title: 'Great!'),
      QuickReply(title: 'Awesome'),
    ],
  ),
];

List<ChatMessage> mentionSample = <ChatMessage>[
  ChatMessage(
    text: 'Hello @Niki, you should check #channel',
    user: user2,
    createdAt: DateTime(2021, 01, 31, 16, 45),
    mentions: [
      Mention(title: '@Niki', customProperties: {'userId': user1.id}),
      Mention(title: '#channel'),
    ],
  ),
  ChatMessage(
    text: "Oh what's up guys?",
    user: user,
    createdAt: DateTime(2021, 01, 30, 16, 45),
  ),
];

List<ChatMessage> d = <ChatMessage>[];
