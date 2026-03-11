# simple_notification_app
Simple Notification App


## Getting Started
A Flutter application that displays notifications fetched from an API using Dio and Retrofit. The app uses Bloc for state management and supports pull-to-refresh, mark as read/unread, and displays dates for each notification.


## Features
Fetch notifications from API using Dio + Retrofit.
Bloc state management for handling loading, success, and error states.
Pull-to-refresh to reload notifications.
Mark notifications as read/unread by tapping a notification card.
Snackbar shows status when notification is read/unread.


## Installation & Running
Follow these steps to run the project:

1. Clone the repository:
-> git clone https://github.com/SoeYuLay/simple_notification_app.git

2. Navigate to the project directory:
-> cd simple_notification_app

3. Install dependencies:
-> flutter pub get

4. Generate Retrofit & JSON Serializable code:
-> flutter pub run build_runner build

5. Run the app on an emulator or device:
-> flutter run

## Usage
Open NotificationPage.dart.
The app automatically fetches notifications when the page loads.
Pull down to refresh the list of notifications.

Tap a notification card to toggle read/unread:
Unread: Card color uses primary theme color.
Read: Card color changes to white.

A Snackbar shows the notification status.

## Notes
The API used in this demo is JSONPlaceholder.
The isRead property is maintained locally in the app.
Snackbars are shown on read/unread toggle for user feedback.

## Dependencies
flutter_bloc – State management
dio – HTTP client
retrofit – API code generation
json_serializable – JSON parsing
intl – Date formatting