 
import 'package:equatable/equatable.dart';

class Comment extends Equatable{
    final int postId;
    final int id;
    final String name;
    final String email;
    final String body;

    const Comment({
        required this.postId,
        required this.id,
        required this.name,
        required this.email,
        required this.body,
    });

    Comment copyWith({
        int? postId,
        int? id,
        String? name,
        String? email,
        String? body,
    }) => 
        Comment(
            postId: postId ?? this.postId,
            id: id ?? this.id,
            name: name ?? this.name,
            email: email ?? this.email,
            body: body ?? this.body,
        );

 
      @override
     
      List<Object?> get props => [postId, id, email, name, body];
}
