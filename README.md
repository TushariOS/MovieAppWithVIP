# MovieAppWithVIP + VIP Architecture + Builder pattern + Dependency Injection.
This project build with the help of VIP Architecture, Builder pattern and Dependency Injection.

# Purpose
_MovieAppWithVIP the repo to understand and learn VIP Architecture, Builder pattern and Dependency Injection.

# Authors
- Tushar Jaunjalkar

# VIP Architecture (Clean Swift Architecture)
Then Clean architecture, introduced by Robert C. Martin (a.k.a. Uncle Bob) started gaining interest by the mobile community. 
In Clean Swift, your project structure is built around scenes. Here is an example how does one scene looks like. In other words, we will have a set of components for each scene that will "work" for our controller. These are the components:
- Models
- Router
- ViewController
- Interactor
- Presenter
The communication between the components is done with protocols. Each component will contain protocols which will be used for receiving and passing data between them. ViewController communicates with Interactor, then Interactor with Presenter and Presenter with ViewController.

# Flow
![](VipFlow.png)

# Builder pattern
The Builder pattern is a well-known pattern in Swift world. It’s especially useful when you need to create an object with lots of possible configuration options.
The intent of the Builder design pattern is to separate the construction of a complex object from its representation.
So if you have an object with lots of properties, you want to hide the complexity of the initialization process, you could write a builder and construct the object through that. It can be as simple as a build method or an external class that controls the entire construction process. It all depends on the given environment

# Dependency Injection
Dependency Injection (DI) is a design pattern used to implement IoC. It allows the creation of dependent objects outside of a class and provides those objects to a class through different ways. Using DI, we move the creation and binding of the dependent objects outside of the class that depends on them.
