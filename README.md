<h2 align = "center"> 1. Chat App </h2>
<h1 align = "center"> 1. Login Page </h1>


# Flutter Firebase Login App

This project is a Flutter application that uses Firebase for user authentication and GetX for state management. It provides a simple and secure login interface, making it easy for users to sign in and out of the app. The application follows best practices in Flutter development, ensuring a high-quality and maintainable codebase.

## Features

- **Firebase Authentication**: Secure user authentication with email and password.
- **GetX State Management**: Efficient state management using GetX for improved performance and readability.
- **Responsive UI**: User-friendly and responsive login interface compatible with both iOS and Android devices.
- **Error Handling**: Comprehensive error handling to provide feedback to users on authentication issues.


## Screenshots
<details> 
  <summary><h2>📸Photo </h2></summary>
  <p>
    <table align="center">
      <tr>
        <td><img src="https://github.com/user-attachments/assets/95601c22-a003-4ba7-95a7-75a55a1bc430" alt="" width="350" height="auto"></td>
        <td><img src="https://github.com/user-attachments/assets/8543e657-fcea-49d9-b701-17d4a0d0599a" alt="" width="350" height="auto"></td>
        <td><img src="https://github.com/user-attachments/assets/faa22909-205f-4faf-b047-c0ab9e7a72f1" alt="" width="350" height="auto"></td>
        </td>
      </tr>
    </table>   
  </p>
</details>

## Getting Started

To get a local copy up and running, follow these steps.

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Firebase account: [Create a Firebase account](https://firebase.google.com/)

### Installation

1. **Clone the repo**
   ```sh
   git clone https://github.com/yourusername/flutter_firebase_login.git
   cd flutter_firebase_login
   ```

2. **Set up Firebase**
   - Create a Firebase project on the [Firebase Console](https://console.firebase.google.com/).
   - Add your Flutter app to the Firebase project.
   - Download the `google-services.json` file and place it in the `android/app` directory.
   - Follow the instructions to add Firebase SDK to your Flutter app: [Add Firebase to your Flutter app](https://firebase.google.com/docs/flutter/setup).

3. **Install dependencies**
   ```sh
   flutter pub get
   ```

4. **Run the app**
   ```sh
   flutter run
   ```

## Usage

1. Open the app on your device or emulator.
2. Enter your email and password to log in.
3. If you don't have an account, click on the "Register" button to create a new account.
4. Once logged in, you will be navigated to the home screen.

## Project Structure

The project follows a clean architecture with a clear separation of concerns.

- `lib`
  - `controllers`: Contains GetX controllers for managing state.
  - `models`: Contains data models.
  - `services`: Contains Firebase authentication service.
  - `views`: Contains UI code.
  - `main.dart`: Entry point of the application.

## License

Distributed under the MIT License. See `LICENSE` for more information.

## Contact

Name - PATEL FENISH

LinkedIn:  https://www.linkedin.com/in/fenish-patel-31287b2a8/



https://github.com/user-attachments/assets/04e6b127-87aa-4010-8870-1be6627f12cf


<h1 align = "center"> 2. Chat Page </h1>

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

<details> 
  <summary><h2>📸Photo </h2></summary>
  <p>
    <table align="center">
      <tr>
        <td><img src="https://github.com/user-attachments/assets/53cfbb34-1572-4512-b0ef-e6866e810cbd" alt="" width="350" height="auto"></td>
        <td><img src="https://github.com/user-attachments/assets/bf119120-5531-4932-8910-8ee3dfecdca9" alt="" width="350" height="auto"></td>
        <td><img src="https://github.com/user-attachments/assets/b570be73-b579-46a9-b84d-a006c22d672b" alt="" width="350" height="auto"></td>
        <td><img src="https://github.com/user-attachments/assets/f8694198-2242-43cb-a579-48e32e8b7ca5" alt="" width="350" height="auto"></td>
        <td><img src="https://github.com/user-attachments/assets/de929c4c-f3d5-4635-84af-e2eba347ba27" alt="" width="350" height="auto"></td>
    </td>
      </tr>
    </table>   
  </p>
</details>

