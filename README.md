# recipe_finder_app



## Overview
You’re building a small Flutter app that lets users search for recipes and view details using TheMealDB public API.
It’s a demonstration of Flutter UI skills, state management with Riverpod, and Clean Architecture practices.

## Features

- **Listing meals**: View a list of meal  with essential details about it like title and category and title.
- **meal details**: show product with more details .


## Screenshots
<img width="1080" height="2400" alt="Screenshot_1754667407" src="https://github.com/user-attachments/assets/e1a60379-b085-462f-8a2a-afd77faef95a" />
<img width="1080" height="2400" alt="Screenshot_1754667410" src="https://github.com/user-attachments/assets/862022ca-9d72-4f2b-812f-b0e4c54af1cf" />




# recipe finder app

## Architecture

The Recipe Finder App follows a clean and modular architecture, ensuring that business logic, data handling, and presentation layers are clearly separated.
This separation of concerns enhances maintainability, testability, and scalability as the project grows.

### Architecture Components

1. **Presentation Layer (UI):**
   - Widgets: Responsible for rendering the user interface.
   - Screens: Represent individual screens of the application.
   - controller(state management): Manage the presentation logic.

2. **Domian Layer (contract)**
   - Entitys: models of the data without serialization to the data.
   - BaseRepositories: it will be abstract class to be as contract between data and domain .
   - usecase: it only node which is connect to Presentation Layer.


3. **Data Layer:**
   - dataSource: Communicate with external APIs or databases.
   - Models: inherit from Entitys and make factory to serialized  the data return from API.
   - Repositories: implemantion to BaseRepositories to handle request from data source.

### Architecture Flow

![clean_Arch](https://github.com/user-attachments/assets/b9ce5d54-dc3a-4112-bbed-187362be3374)


*Clean Architecture With Flutter *


## Getting Started

Follow these steps to run the project locally:

1. Clone the repository:

   ```bash
   git clone https://github.com/MohamedAbdelbaky544/recipe_finder_app.git

2. Navigate to the Project Directory:
  
   ```bash
   cd recipe_finder_app

3. Install Dependencies:
  
   ```bash
   flutter pub get

4. Run the App:

   ```bash
   flutter run
