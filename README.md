## project structure

```
|-- lib
  |-- app
    |-- data
      |-- provider
        api.dart
      |-- model
        department.dart
        products.dart
      |-- repository
        repository.dart
    |-- controller
      home_controller.dart
    |-- view
      |-- home
        |-- widgets
          carousel_card.dart
          image_network.dart
          product_card.dart
          title.dart
        home_page.dart
      theme.dart
    |-- routes
      app_routes.dart
      app_pages.dart
    |-- bindings
      home_binding.dart
    main.dart
```
### Data
Here we don't have much to discuss, it is just a repository where you will abstract/package _everything_ related to your data: your models, your services and data providers.
If you choose to use the module version, the data folder will have the same role, leaving your data available for all your modules, having only what is vital for your module in it!  
This was designed so that you can keep your directory structure as small as possible when working with Flutter, and at the same time, be intuitive and didactic to speed up your learning curve.

### Provider
obs: In some other structures, the term 'provider' can be approached in various ways, but here, it exists only and exclusively, to make http requests or persistence in a database. If you use both, create the respective directories and / or files within it.  
If there are many requests, in a single file, you can choose to separate by entities, or keep it in the same file, this is a personal choice and it is up to each programmer.

### Model
In our model class we will have our attributes and two methods, toJson and fromJson responsible for converting our object to json or a json to our object.  
Generally when we work with API's, we use these methods to create objects from our api's response, or create a json to send to our api.

### Repository
The repository is now responsible only for grouping the functionalities of the providers consumed by the controller of that module, in order to map the use of the providers and to group their calls.

### Module
The modules will contain our respective Binding, Page, Controller.  
This makes the project shorter and easier to maintain.

### Controller
Controllers are the vital part of your application, in which you will create your .obs variables which will store values ​​that can be changed during the application.  
Your controller is also responsible for consuming your data>, through its repositories, which in turn only perform data calls from your providers
Rule: Every controller must have one, and only one, repository, which is an attribute required to initialize your controller in your GetX widget.  
If you need data from two different repositories on the same page, you must use two GetX widgets. We recommend that there is at least one controller for each page.  
There is only one exception so that you can use the same controller for several pages, and it is quite simple:  

**IMPORTANT**: You can use a controller on several pages, only and exclusively, if the data on all pages, consume a single repository.  

The purpose of this is to get you to use GetX and take full advantage of its power, so whenever you need to manipulate two entities, you will need two different controllers and a view.  
Why? Imagine that you have a controller with two repositories, and that controller is being used with a GetX widget on a page, using data retrieved by the controller from the two repositories.  
Whenever an entity is modified, the controller will update its widgets responsible for the two variables, one of which did not need to be changed. So separating a repository by controller, it can be a good practice when working with the GetX widget, having a responsible controller for each widget, which somehow shows this information from them, rendering only the widget that had its `.obs` variable changed.

### Bindings
Ideal for your dependency management, bindings can initialize your controllers and repositories, apis and whatever you need, without having to call them directly from View with GetView<YourController>!

### Page
Your module interface using YourPage extends GetView<YourController>.
