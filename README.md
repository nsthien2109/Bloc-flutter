# counter_bloc

Structure project : 

    ├── lib
    │   ├── counter
    │   │   ├── cubit
    │   │   │   └── counter_cubit.dart
    │   │   └── view
    │   │       ├── counter_page.dart
    │   │       └── counter_view.dart
    │   ├── counter_observer.dart
    │   └── main.dart



counter_observer.dart  : 

    Cái này dùng để quan sát các trạng thái (state) thay đổi trong ứng dụng phải gọi từ hàm main.dart

main.dart :

    void main() {
     BlocOverrides.runZoned(() => 
        runApp(const MyApp()),
        blocObserver: CounterObserver()
     );
    }

    + Hàm main phải gọi BlocOverrides để thực thi CounterObserver nhằm quan sát các thay đổi state

counter_page.dart : 

    file này chứa BlocProvider => có trách nhiệm tạo ra cubit và cung cấp nó cho view

counter_view.dart : 

    file này chứa giao diện ứng dụng 

counter_cubit.dart : 

    file này chứa hàm thực thi và sự kiện

    a