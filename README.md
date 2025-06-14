# ♻️ Recycle App

A **Flutter-based mobile application** designed to promote responsible waste management through a smart **recycling reward system**. The app connects **eco-conscious users** with **administrators** who verify recycling efforts and enable **point-based redemptions**. It not only encourages recycling behavior but also provides a **transparent platform** to track environmental contributions.

---

## 🌍 How This Project Helps in Waste Management

The **Recycle App** addresses one of the most pressing issues of modern society — improper waste disposal and lack of incentive to recycle. By gamifying the recycling process and enabling a **point-based system for recyclable waste**, it:

- **Promotes awareness**: Educates users about the importance of recycling.
- **Incentivizes eco-actions**: Offers rewards for responsible disposal.
- **Bridges the gap** between citizens and recycling authorities.
- **Reduces landfill waste** through traceable user activity.
- **Encourages digital participation** in sustainability efforts.

This solution can be especially impactful when used at the **municipal**, **school**, or **corporate** levels as part of environmental CSR (Corporate Social Responsibility) initiatives.

---

## 🌟 Key Features & Impact on Nature

- ✅ **Gamified Point System**: Earn points for each recyclable item submitted.
- 🔄 **Trackable Recycling Requests**: Users upload proof of recycled items, and admins verify.
- 🎁 **Reward Redemption**: Points can be redeemed via UPI for real-world rewards, motivating consistent behavior.
- 📈 **Environmental Impact Logging**: Transparency in how much waste is recycled over time.
- 🧾 **Digital Accountability**: No paperwork, all submissions and verifications are stored in the cloud.
- ♻️ **Reduced E-waste and Material Waste**: Can be extended to include e-waste, plastics, glass, etc.

---

## 📱 Features

### 👤 User Side
- **User Registration & Login:** Secure Firebase-based authentication.
- **Profile Management:** Editable profile with name, email, and profile photo.
- **Earn Points:** For submitting proof of recycling efforts.
- **Redeem Points:** Request redemption by submitting UPI details.
- **Transaction History:** View of submitted and approved recycling/redemption records.
- **Account Management:** Secure logout and delete account functionality.

### 🛠️ Admin Side
- **Admin Login:** Protected authentication layer for admins.
- **Admin Dashboard:**
  - **Recycling Approval:** View and verify user-submitted recycling requests.
  - **Redeem Approval:** Approve or reject point redemption requests.
- **Real-time Sync:** All updates reflected in both user and admin Firestore collections.

---

## 🔧 Tech Stack

- **Flutter** (UI and app logic)
- **Firebase Firestore** (Realtime NoSQL Database)
- **Firebase Authentication** (Login/SignUp)
- **Provider** (State management)
- **Cloud Functions** (Optional advanced backend logic)

---

## Folder Structure

lib/
  ├── Admin/
  │     ├── admin_home.dart
  │     ├── admin_approval.dart
  │     └── admin_reedem.dart
  ├── pages/
  │     ├── points.dart
  │     └── profile.dart
  ├── services/
  │     ├── auth.dart
  │     ├── database.dart
  │     ├── shared_pref.dart
  │     └── widget_support.dart
  └── main.dart
---

## 🔄 How It Works

- **User Redeem Flow:**  
  When a user submits a redemption request, a document is created in their subcollection and the global `Reedem` collection. Admin approval updates both locations to reflect status changes.

- **Admin Approval Flow:**  
  Admin reviews requests from all users, approves them, and the update syncs across collections for transparency and traceability.

---

## 🚀 Getting Started

1. **Clone the repository**
2. **Add your Firebase configuration**
3. **Run dependencies**
   ```bash
   flutter pub get
   flutter run



