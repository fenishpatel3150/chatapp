<h2 align = "center"> 1. Chat App </h2>

To implement a chat screen using Firebase in a Flutter application, you'll typically use Firebase Firestore for real-time data storage, Firebase Authentication for user login, and Firebase Cloud Storage for storing media files like images.

### Here's an overview of the steps:

#### 1. **Set up Firebase**
- Create a Firebase project in the Firebase Console.
- Add Firebase to your Flutter app by configuring it with the required keys (iOS and Android).
- Install the necessary dependencies in `pubspec.yaml`:
   ```yaml
   dependencies:
     firebase_core: latest_version
     firebase_auth: latest_version
     cloud_firestore: latest_version
     firebase_storage: latest_version
   ```

#### 2. **Authenticate Users**
- Use Firebase Authentication to sign in users, typically with email/password or Google sign-in.
- Once users are authenticated, you can access their user ID (`uid`) to identify messages.

#### 3. **Create Chat Data Model**
Define a data model for chat messages:
- `senderId`: The UID of the sender.
- `message`: The content of the message.
- `timestamp`: Time when the message was sent.
- `imageUrl`: (optional) URL of any image sent in the chat.

Example data structure:
```json
{
  "senderId": "user123",
  "message": "Hello!",
  "timestamp": 1636543210,
  "imageUrl": ""
}
```

#### 4. **Set up Firestore for Chat**
- Create a Firestore collection (e.g., `chats`) and a sub-collection for messages.
- Store each message as a document, and query the messages in real-time.

```dart
FirebaseFirestore.instance.collection('chats').doc(chatId).collection('messages');
```

#### 5. **Real-time Chat UI**
- Use `StreamBuilder` to listen to the messages in real time:
   ```dart
   StreamBuilder(
     stream: FirebaseFirestore.instance.collection('chats').doc(chatId).collection('messages').orderBy('timestamp').snapshots(),
     builder: (context, snapshot) {
       if (!snapshot.hasData) {
         return CircularProgressIndicator();
       }
       var messages = snapshot.data!.docs;
       return ListView.builder(
         itemCount: messages.length,
         itemBuilder: (context, index) {
           var message = messages[index];
           return ChatMessageWidget(message['message'], message['senderId']);
         },
       );
     },
   );
   ```

#### 6. **Send Messages**
- Add a text input field and a send button to send messages to Firestore:
   ```dart
   FirebaseFirestore.instance.collection('chats').doc(chatId).collection('messages').add({
     'senderId': currentUserId,
     'message': messageTextController.text,
     'timestamp': FieldValue.serverTimestamp(),
   });
   ```

#### 7. **Media Sharing**
- For sharing images, upload them to Firebase Storage and store the image URL in Firestore along with the message:
   ```dart
   TaskSnapshot snapshot = await FirebaseStorage.instance.ref('chat_images').putFile(imageFile);
   String imageUrl = await snapshot.ref.getDownloadURL();

   FirebaseFirestore.instance.collection('chats').doc(chatId).collection('messages').add({
     'senderId': currentUserId,
     'imageUrl': imageUrl,
     'timestamp': FieldValue.serverTimestamp(),
   });
   ```

### Key Features:
- **Firebase Authentication:** Secure login.
- **Firestore:** Real-time syncing of chat messages.
- **Cloud Storage:** Image sharing functionality.
- **StreamBuilder:** Real-time UI updates.

  
     <img src="https://github.com/user-attachments/assets/53cfbb34-1572-4512-b0ef-e6866e810cbd" alt="" width="300" height="auto">
     <img src="https://github.com/user-attachments/assets/bf119120-5531-4932-8910-8ee3dfecdca9" alt="" width="300" height="auto">
     <img src="https://github.com/user-attachments/assets/b570be73-b579-46a9-b84d-a006c22d672b" alt="" width="300" height="auto">
     <img src="https://github.com/user-attachments/assets/f8694198-2242-43cb-a579-48e32e8b7ca5" alt="" width="300" height="auto">
    <img src="https://github.com/user-attachments/assets/de929c4c-f3d5-4635-84af-e2eba347ba27" alt="" width="300" height="auto">
     <img src="https://github.com/user-attachments/assets/4a85d030-5500-4ecf-b6ce-20e630166497" alt="" width="300" height="auto">



https://github.com/user-attachments/assets/421ebf8f-085d-4e7d-b85a-9953269317a9


https://github.com/user-attachments/assets/c48e5e57-b230-40c1-b04e-ae855401b9cb





## Contact

Name - PATEL FENISH

LinkedIn:  https://www.linkedin.com/in/fenish-patel-31287b2a8/
