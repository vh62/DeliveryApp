# DeliveryApp Documentation

## Overview
iOS app for managing deliveries and favorites using SwiftUI and SwiftData.

## Architecture
- MVVM design pattern
- SwiftData for persistence
- Async/await for networking
- Protocol-oriented design for testability

## Key Features
- Delivery list with pagination
- Favorite deliveries management
- Offline support with local storage
- Error handling
- Unit and UI tests

## Core Components
1. Models
- `Delivery`: Delivery data model
- `Favorite`: Favorite delivery model
- `Route`: Route information

2. ViewModels 
- `DeliveryListViewModel`: Manages deliveries and favorites

3. Services
- `DeliveryAPIService`: Handles API requests
- `NetworkService`: Generic networking layer

4. Views
- `DeliveryListView`: Main deliveries list
- `DeliveryRow`: Individual delivery cell
- `DeliveryDetailView`: Delivery details

## Testing
- Unit tests for services and viewmodels
- UI tests for critical user flows
- Mocked network layer for testing

## Dependencies
- Kingfisher: Image caching

## Requirements
* iOS 17.0+
* Xcode 15+
* CocoaPods
* Compile on swift 5!

## Installation
```bash
git clone [repository-url]
cd DeliveryApp
pod install
open DeliveryApp.xcworkspace
