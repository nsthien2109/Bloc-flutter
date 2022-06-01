# fetch_list_bloc

import package [flutter_bloc](https://pub.dev/packages/flutter_bloc)
import package [equatable](https://pub.dev/packages/equatable)
import package [http](https://pub.dev/packages/http)



Structure of project 

    ├── lib
    |   ├── posts
    │   │   ├── bloc
    │   │   │   └── post_bloc.dart
    |   |   |   └── post_event.dart
    |   |   |   └── post_state.dart
    |   |   └── models
    |   |   |   └── models.dart*
    |   |   |   └── post.dart
    │   │   └── view
    │   │   |   ├── posts_page.dart
    │   │   |   └── posts_list.dart
    |   |   |   └── view.dart*
    |   |   └── widgets
    |   |   |   └── bottom_loader.dart
    |   |   |   └── post_list_item.dart
    |   |   |   └── widgets.dart*
    │   ├── post_observer.dart
    │   └── main.dart

lib/posts/models/post.dart

    file này là model của post

