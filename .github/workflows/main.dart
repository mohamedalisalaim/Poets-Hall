name: Build

on:
  push:
    branches:
      - main

# A single workflow can have multiple jobs.
jobs: 
 # 'A new job is defined with the name: "build_android" 
 build_android:
   # Defines what operating system will be used for the actions.
   # For android, we will use Linux GitHub-Hosted Runner.
   runs-on: ubuntu-22.04
   # Defines what step should be passed for successful run
   steps:
     # Checkout to the selected branch
     - name: Checkout
       uses: actions/checkout@v3
     # setup java
     - uses: actions/checkout@v4
     - uses: actions/setup-java@v4
       with:
        distribution: 'oracle' # See 'Supported distributions' for available options
        java-version: '18'
     # Download and install flutter packages
     - name: Install Flutter
       uses: subosito/flutter-action@v2
       with:
         # Define which stable flutter version should be used
         flutter-version: "3.24.3"
         channel: 'stable'
         # Enables cache for flutter packages              
         # Speed up the process
         cache: true
     # Get Flutter project dependencies
     - name: Get dependencies
       run: flutter pub get

     - name: build apk
       run: flutter build apk
       
     - uses: actions/upload-artifact@v4
       with:
         name: release-apk
         path: build/app/outputs/apk/release/app-release.apk