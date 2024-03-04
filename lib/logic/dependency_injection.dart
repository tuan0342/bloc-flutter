// C2: Sử dụng Dependency Injection

// Để class UserManager ko bị phụ thuộc vào class User.
// - Ta sẽ truyền User vào trong phương thức khởi tạo của UserManager
// (vẫn bị phụ thuộc nhưng ko bị phụ thuộc trực tiếp)

class UserManager {
  User user;

  UserManager({required this.user});

  void sayHelloAgain() {
    user.sayHello();
    user.sayHello();
  }
}

class User {
  void sayHello() {
    print("hello");
  }
}

void main() {
  User user = User();
  UserManager userManager = UserManager(user: user);
  userManager.sayHelloAgain();
}
