@echo off
flutter packages pub run build_runner build --delete-conflicting-outputs
flutter packages pub run build_runner clean
::flutter packages pub run build_runner watch --delete-conflicting-outputs
