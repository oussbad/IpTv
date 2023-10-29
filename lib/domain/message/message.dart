import 'dart:convert';

class Message {
  //attributes
  String username;
  String message;
  //Constructor
  Message({
    required this.username,
    required this.message,
  });
// CopyWith :create a new instance and modified attributes
  Message copyWith({
    required String username,
    required String message,
  }) {
    return Message(
      username: username ?? this.username,
      message: message ?? this.message,
    );
  }
//Message object to a Map
//   Map<String, dynamic> toMap() {
//     return {
//       'username': username,
//       'message': message,
//     };
//   }
// Message object from a Map
  factory Message.fromMap(Map<String, dynamic> map) {

    return Message(
      username: map['username'],
      message: map['message'],
    );
  }
// Convert the Message object to a JSON string
  //String toJson() => json.encode(toMap());

// Create a Message object from a JSON string
  factory Message.fromJson(String source) =>
      Message.fromMap(json.decode(source));

// String representation of the Message object
  @override
  String toString() => '$username: $message';
// ????? don't understand
  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Message && o.username == username && o.message == message;
  }
//????
// don't understand
  @override
  int get hashCode => username.hashCode ^ message.hashCode;
}
