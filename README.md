# Flutter Travel app
A simple flutter mobile application that illustrates the use of clean architecture while utilising Riverpod as the state management solution.
The app allows you to add, edit and delete trips on Hive (a local storage database).
It also allows you to view Trips.

# Folder Structure
```
lib
│───core
│   │───error
│───features
│   │───trip
│   │   │───data
│   │   │   │───datasources
│   │   │   │───models
│   │   │   │───repositories
│   │   │───domain
│   │   │   │───entities
│   │   │   │───repositories
│   │   │   │───usecases
│   │   │───presentation
│   │   │   │───providers
│   │   │   │───pages
│   │   │   │───widgets
│   │   

## core
This folder contains the core functionality of the app. It contains the error handling logic and the base classes for the app.

## features
This folder contains the features of the app. It contains the trip feature which is the only feature in the app.

### trip
This folder contains the trip feature. It contains the data, domain and presentation layers of the feature.

#### data
This folder contains the data layer of the trip feature. It contains the data sources, models and repositories of the feature.

##### datasources
This folder contains the data sources of the trip feature. It contains the local data source which is Hive.

##### models
This folder contains the models of the trip feature. It contains the trip model which is the model for the trip entity.

##### repositories
This folder contains the repositories of the trip feature. It contains the trip repository which is the repository for the trip entity.

#### domain
This folder contains the domain layer of the trip feature. It contains the entities, repositories and usecases of the feature.

##### entities
This folder contains the entities of the trip feature. It contains the trip entity which is the entity for the trip feature.

##### repositories
This folder contains the repositories of the trip feature. It contains the trip repository which is the repository for the trip entity.

##### usecases
This folder contains the usecases of the trip feature. It contains the add trip, delete trip, edit trip and get trips usecases.

#### presentation
This folder contains the presentation layer of the trip feature. It contains the providers, pages and widgets of the feature.

##### providers
This folder contains the providers of the trip feature. It contains the add trip, delete trip, edit trip and get trips providers.

##### pages
This folder contains the pages of the trip feature. It contains the add trip, edit trip and home pages.

##### widgets
This folder contains the widgets of the trip feature. It contains the trip card widget which is the widget for the trip entity.

# Dependencies
## Flutter packages
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  flutter_riverpod: ^2.4.4
  path_provider: ^2.1.1
  dartz: ^0.10.1
  intl: ^0.18.1
  cached_network_image: ^3.3.1

# Flutter versions
flutter: 3.16.6

# Author
- [Brian Mutinda](https://github.com/Brian1011)

# Acknowledgements
This project is based on a tutorial by [Flutter Guys](https://www.youtube.com/watch?v=fT-eOgl_jhk).
It gave me a good understanding of clean architecture with Riverpod and how to implement it in flutter.
I made some changes to the architecture to suit my needs.


