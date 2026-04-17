# --- TaskZen Smart Launcher ---
# இந்த ஸ்கிரிப்ட் உங்கள் புராஜெக்ட்டை பாதுகாப்பான இடத்திற்கு மாற்றி ரன் செய்யும்.

Write-Host "--- TaskZen Smart Launcher ---" -ForegroundColor Cyan

# 1. லோக்கல் ஃபோல்டர் பாதை (Local directory path)
$localPath = "C:\Users\ELCOT\TaskZen_Local"

Write-Host "1. லோக்கல் ஃபோல்டரைத் தயார் செய்கிறது..." -ForegroundColor Yellow
if (!(Test-Path $localPath)) {
    New-Item -ItemType Directory -Path $localPath -Force
}

# 2. ஃபைல்களை காப்பி செய்தல் (Copying project files)
# லாக் செய்யப்பட்ட (Locked) ஃபைல்களைத் தவிர்த்து மற்றவற்றை காப்பி செய்யும்.
Write-Host "2. ஃபைல்களை காப்பி செய்கிறது (OneDrive-க்கு வெளியே)..." -ForegroundColor Yellow
Copy-Item -Path ".\*" -Destination $localPath -Recurse -Exclude "build",".dart_tool" -ErrorAction SilentlyContinue

# 3. புதிய இடத்திற்கு மாறுதல் (Switching location)
Write-Host "3. லோக்கல் இடத்திற்கு மாறுகிறது..." -ForegroundColor Yellow
Set-Location $localPath

# 4. பழைய பில்ட் டேட்டாவை நீக்குதல் (Cleaning)
Write-Host "4. பழைய பில்ட் டேட்டாவை நீக்குகிறது..." -ForegroundColor Yellow
flutter clean

# 5. டிபென்டென்சிகளைப் பெறுதல் (Get Packages)
Write-Host "5. தேவையான பேக்கேஜ்களைப் பெறுகிறது..." -ForegroundColor Yellow
flutter pub get

# 6. Chrome-ல் இயக்குதல் (Run in Chrome)
Write-Host "6. TaskZen-ஐ Chrome-ல் இயக்குகிறது..." -ForegroundColor Green
flutter run -d chrome
