# Payments App

The Payments App is a Flutter application designed to demonstrate payment processing using multiple payment gateways such as Flutter Stripe, PayPal, and Paymop. It also includes a custom payment interface (UI-only). The app follows Clean Architecture principles and uses Bloc for state management along with Dio for API communication.

## Features 🎯

- **Flutter Stripe Integration:** Allows users to make payments using Stripe.
- **PayPal Integration:** Supports payments through PayPal.
- **Paymop Integration:** Users can also make payments through Paymop.
- **Custom Payment UI:** A custom payment interface is provided (UI-only, without backend).
- **Bloc State Management:** Bloc is used for efficient state management.

## Key Features Breakdown

- **Multiple Payment Options:**
  - The app integrates several popular payment gateways (Stripe, PayPal, and Paymop) to demonstrate real-world payment processing.

- **Custom Payment UI:**
  - A custom payment interface is included, which simulates a payment flow but is UI-only without backend integration.

- **State Management with Bloc:**
  - Bloc is used for managing the state across the application, ensuring efficient handling of business logic and UI interaction.

- **API Interaction using Dio:**
  - Dio library is employed for handling API communication, making it easy to connect with the payment gateway APIs.

## API Integrations

- **Stripe:** Integrated using `flutter_stripe` for handling secure payments.
- **PayPal:** PayPal SDK is used for seamless PayPal transactions.
- **Paymop:** Paymop payment gateway integration for local payment options.

## Bloc State Management

Bloc is used for managing the application state, ensuring the payment flows are handled efficiently and consistently.
