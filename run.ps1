# TaskZen Run Script - Step by Step
Write-Host "Step 1: Moving project to C:\TaskZen (fixes OneDrive permissions)..." -ForegroundColor Green
New-Item -ItemType Directory -Force -Path "C:\TaskZen"
Copy-Item -Path . -Destination "C:\TaskZen" -Recurse -Force
Set-Location "C:\TaskZen"

Write-Host "Step 2: Flutter clean..." -ForegroundColor Green
flutter clean

Write-Host "Step 3: Get dependencies..." -ForegroundColor Green
flutter pub get

Write-Host "Step 4: Check devices..." -ForegroundColor Green
flutter devices

Write-Host "Step 5: Running on Chrome..." -ForegroundColor Green
flutter run -d chrome

Write-Host "Done! Check browser. Use Ctrl+C to stop." -ForegroundColor Yellow
