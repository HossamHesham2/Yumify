# 🍴 Yumify  

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)  
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)  
![BLoC](https://img.shields.io/badge/BLoC-6F2CF4?style=for-the-badge&logo=flutter&logoColor=white)  
![Dio](https://img.shields.io/badge/Dio-FF6F00?style=for-the-badge&logo=dependabot&logoColor=white)  
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

Yumify is a **Recipe Generator App** that helps users discover new recipes easily, save favorites, view detailed ingredients & cooking steps, and share recipes with friends.  

---

## 🚀 Features  

- 🔍 **Search Recipes** by ingredients or keywords.  
- 📖 **View Recipe Details** (ingredients, steps, and image).  
- ❤️ **Save Favorite Recipes** for later access.  
- 📤 **Share Recipes** with others easily.  
- ✨ **Smooth User Experience** with BLoC state management.  
- 📱 **Responsive UI** using Flutter ScreenUtil.  
- 🎨 Clean design with custom colors and fonts.  

---

## 🛠️ Tech Stack  

- **Framework:** Flutter  
- **State Management:** BLoC (flutter_bloc)  
- **Dependency Injection:** get_it  
- **Networking:** Dio (Retrofit) 
- **Local Storage:** sqflite  
- **Image Caching:** cached_network_image  
- **UI Utils:** Flutter ScreenUtil, custom colors & fonts  
- **API Integration:** [Spoonacular API](https://spoonacular.com/food-api)  

---

## 📂 Project Structure  

```bash
lib/
 ┣ core/
 ┃ ┣ di/              # Dependency Injection setup
 ┃ ┣ models/          # Data Models (Recipe, RecipeDetails)
 ┃ ┣ utils/           # Colors, Fonts, Helpers
 ┃ ┣ constants/       # Constants names
 ┃ ┣ database/        # Manage APIs, sqflite
 ┃ ┣ errors/          # Handling errors
 ┃ ┣ widgets/         # Shared widgets in all Application
 ┣ features/
 ┃ ┣ main/
 ┃ ┃ ┣ home/          # Home Screen + BLoC
 ┃ ┃ ┣ favorites/     # Favorites Feature
 ┃ ┃ ┣ recipe_details/# Recipe Details Screen
 ┣ app.dart           # Root App
 ┣ main.dart          # Entry Point
📸 Screenshots
<img width="1440" height="3120" alt="Screenshot_1758904183" src="https://github.com/user-attachments/assets/ebc9e9e0-e39f-4282-9709-9936d00f26e7" />
<img width="1440" height="3120" alt="Screenshot_1758904319" src="https://github.com/user-attachments/assets/caf3c0e4-2001-4ab3-99d1-4df3e7e8da55" />
<img width="1440" height="3120" alt="Screenshot_1758904350" src="https://github.com/user-attachments/assets/e3fb3aa6-1e87-4cb6-b73f-1cb2838c189e" />
<img width="1440" height="3120" alt="Screenshot_1758904394" src="https://github.com/user-attachments/assets/0c76ee3f-4548-4396-9c5a-da96e508ada2" />
<img width="1440" height="3120" alt="Screenshot_1758904399" src="https://github.com/user-attachments/assets/9aee33f8-8761-4bee-8821-c1ca10edf51c" />
<img width="1440" height="3120" alt="Screenshot_1758904432" src="https://github.com/user-attachments/assets/2bf17934-6e11-45ca-80a9-757ae7d93d50" />



🏠 Home Screen

📖 Recipe Details

❤️ Favorites

⚙️ Installation
Clone the repo

bash
Copy code
git clone https://github.com/HossamHesham2/Yumify
Install dependencies

bash
Copy code
flutter pub get
Run the app

bash
Copy code
flutter run
🌟 Future Enhancements
📝 Add user authentication system.

🍽️ Daily random recipe suggestions.

🛒 Shopping list from ingredients.

📊 Improve performance with Pagination.

👨‍💻 Author
Developed by Hossam Hesham 💻
