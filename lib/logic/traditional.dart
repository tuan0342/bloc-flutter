// C1: Sử dụng khởi tạo đối tượng

// Class UserManager sẽ bị phụ thuộc vào class User

class UserManager {
  User? user;

  UserManager() {
    user = User();
  }

  void sayHelloAgain() {
    user!.sayHello();
    user!.sayHello();
  }
}

class User {
  void sayHello() {
    print("hello");
  }
}

void main() {
  UserManager userManager = UserManager();
  userManager.sayHelloAgain();
}
