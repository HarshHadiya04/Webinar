# 🎓 Event & Webinar Management App

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Firebase](https://img.shields.io/badge/firebase-%23039BE5.svg?style=for-the-badge&logo=firebase)
![MongoDB](https://img.shields.io/badge/MongoDB-%234ea94b.svg?style=for-the-badge&logo=mongodb&logoColor=white)

A modern Flutter application for managing educational events and webinars.

</div>

## ✨ Features

- 🔐 **Authentication** - Secure user authentication using Firebase
- 📅 **Events Management** - Create, view, and manage educational events
- 🎥 **Webinars** - Schedule and manage online webinar sessions
- 👤 **User Profiles** - Personalized user profiles and preferences
- 🎨 **Modern UI** - Beautiful and responsive Material Design interface

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (Latest Version)
- Node.js (for backend)
- MongoDB
- Firebase Account

### Installation

1. Clone the repository
```bash
git clone https://github.com/yourusername/event-webinar-app.git
```

2. Install Flutter dependencies
```bash
flutter pub get
```

3. Set up Firebase
- Add your `google-services.json` for Android
- Add your `GoogleService-Info.plist` for iOS

4. Start the backend server
```bash
cd backend
npm install
npm start
```

5. Run the app
```bash
flutter run
```

## 📱 Screenshots

<div align="center">

### 🔐 Authentication
<p align="center">
  <img src="https://github.com/user-attachments/assets/c5ff9ba9-8c2f-462c-a4fa-55c6618fae8e" width="300" alt="Login & Signup Screen"/>
</p>

### 🎥 Webinars
<p align="center">
  <img src="https://github.com/user-attachments/assets/8dd31fa3-0f84-4ccf-a412-53c5b1b20bc0" width="300" alt="Webinars List"/>
  <img src="https://github.com/user-attachments/assets/6a9825a2-f09b-417f-a4b9-b6b6722b6537" width="300" alt="Create Webinar"/>
</p>

### 📅 Events
<p align="center">
  <img src="https://github.com/user-attachments/assets/c160271c-59a3-4f11-a83d-146039145567" width="300" alt="Events List"/>
  <img src="https://github.com/user-attachments/assets/a5111997-103c-4680-8d5d-cd1bc6dffa2e" width="300" alt="Create Event"/>
</p>

</div>

### ✨ Key UI Features

- Material Design 3 Components
- Responsive Layout
- Dark/Light Theme Support
- Custom Animations
- Interactive Elements
- Modern Card Designs
- Beautiful Gradients
- Clean Typography

## 🏗️ Architecture

The app follows a clean architecture pattern with:
- **Models** - Data models for events and webinars
- **Services** - API and Firebase services
- **UI** - Presentation layer with Material Design
- **Backend** - Node.js with Express and MongoDB

## 🛠️ Tech Stack

- **Frontend**
  - Flutter
  - Firebase Auth
  - Provider State Management
  
- **Backend**
  - Node.js
  - Express
  - MongoDB
  - Mongoose

## 📄 API Documentation

### Events API

```http
GET /api/events
POST /api/events
GET /api/events/:id
```

### Webinars API

```http
GET /api/webinars
POST /api/webinars
GET /api/webinars/:id
```

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Authors

- **Harsh Hadiya** - *Initial work* - harshhadiya04(https://github.com/HarshHadiya04)

## 🙏 Acknowledgments

- Flutter Team
- Firebase
- MongoDB
- All contributors

---
<div align="center">
Made with ❤️ by Harsh Hadiya
</div>
