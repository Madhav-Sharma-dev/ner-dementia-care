# 🌱 NER Dementia Care – "Remember It"
> **Smart India Hackathon (SIH) Project** • Culturally-Inclusive Dementia & Elderly Care Companion for North East India.

[![Vercel Deployment Ready](https://img.shields.io/badge/Vercel-Deployment%20Ready-000000?style=for-the-badge&logo=vercel&logoColor=white)](https://vercel.com)
[![Languages](https://img.shields.io/badge/Languages-8%20NER%20Dialects-2E7D6E?style=for-the-badge)](#-multilingual-support)
[![Accessibility](https://img.shields.io/badge/WCAG-AA%20Compliant-E87C3E?style=for-the-badge)](#-elderly-friendly-accessibility)

---

## 🌟 Overview

**NER Dementia Care ("Remember It")** is designed specifically to address the clinical, cultural, and linguistic challenges of dementia care in North East India. It features both a **cross-platform Flutter Mobile Application** and an **instant, high-performance Web Version** ready for 1-click Vercel hosting.

---

## 🚀 Live Web Version & 1-Click Vercel Deployment

The web version is fully configured at the root with `vercel.json` and static optimizations for instant zero-configuration deployment.

### How to Connect & Deploy to Vercel:

1. **Commit & Push to GitHub**:
   ```bash
   git add .
   git commit -m "Add full-featured web app version and vercel config"
   git push origin main
   ```

2. **Deploy on Vercel**:
   - Go to [vercel.com](https://vercel.com) and log in with your GitHub account.
   - Click **"Add New..."** ➔ **"Project"**.
   - Select your repository: `Madhav-Sharma-dev/ner-dementia-care`.
   - **Framework Preset**: Select **"Other"** (or leave as default).
   - **Root Directory**: Leave as `./` (Root).
   - Click **"Deploy"**!
   - ⚡ *Your website will be live in under 15 seconds with a free `.vercel.app` domain!*

---

## 🌐 Key Features of the Web Version

### 1. 🗣️ Multilingual Voice & Cultural Support (8 Languages)
Full UI localization, native greetings, and Web Speech API text-to-speech for:
1. **English** (Universal) 📖
2. **Hindi** (हिन्दी) 🙏
3. **Assamese** (অসমীয়া) 🦏🍵 *(Tea & Kaziranga Rhino)*
4. **Manipuri / Meitei** (মৈতৈলোন্) 🦌🌊 *(Sangai Deer & Loktak Lake)*
5. **Khasi** (Khasi) 🌉🌧️ *(Living Root Bridge & Cherrapunji Rain)*
6. **Mizo** (Mizo ṭawng) 🌸🌺 *(Anthurium Flower)*
7. **Bodo** (बड़ो) 🌾🎶 *(Bihu Culture)*
8. **Garo** (A·chik) 🏔️🍊 *(Nokrek & Garo Hills)*

### 2. 🧓 Patient Mode (Elderly-Centric WCAG AA UI)
- **Live Time, Day & Dynamic Weather**: High-contrast digital clock with friendly greeting banner.
- **Voice Assistant**: Reads personalized greetings in the selected native dialect.
- **Daily Medicine Tracker**: Touch-friendly checklists for Morning, Afternoon, Evening, and Bedtime medications.
- **Interactive Memory Match Game**: Cognitive stimulation game featuring cultural symbols with celebratory fanfare and score tracking.
- **Family Reminiscence Album**: Photo cues, names, family relations, and speech reminder playback.
- **Pulsing Emergency SOS Button**: Bottom persistent floating button with simulated audio siren, GPS coordinates (`Guwahati, Assam`), and speed dial to Ambulance (108) and Police (112).

### 3. 🩺 Caregiver & Family Portal
- **Real-Time Patient Vitals & Safe Zone Tracker**: Monitored geofence perimeter and heart rate indicators.
- **Medication Administration Matrix**: Mark medications as Taken, Pending, or Missed; add custom prescription reminders.
- **7-Day Cognitive Score Trend Chart**: Interactive SVG visual chart tracking weekly recall and memory performance.
- **Emergency Directory**: Direct contact links to GMCH neurologists and primary family caregivers.

### 4. 📱 View Mode Toggle
- **Phone Frame Mode**: Experience the application as it looks on an elderly user's handheld smartphone.
- **Wide View Mode**: Expands into an expansive desktop clinic/family portal.

---

## 🛠️ Tech Stack

| Component | Technology |
|---|---|
| **Web Architecture** | HTML5, Vanilla CSS3 (Custom Design System), JavaScript (ES6+) |
| **Audio Engine** | Web Audio API (Synthesized chimes, clicks, fanfare, and emergency siren) |
| **Voice / Speech** | Web Speech API (SpeechSynthesis) |
| **Mobile App** | Flutter 3.x, Dart 3.x, Provider, Flutter TTS |
| **Hosting & CI/CD** | Vercel (`vercel.json`), GitHub Actions ready |
| **Design Tokens** | Deep Teal (`#2E7D6E`), Warm Amber (`#E87C3E`), SOS Red (`#D32F2F`) |

---

## 💻 Local Web Preview

To test the web version locally:
```bash
# Using Python
python -m http.server 8080

# Or using Node
npx serve .
```
Open [http://localhost:8080](http://localhost:8080) in your web browser.

---

## 👥 Smart India Hackathon Team
- **Project**: NER Dementia Care - Remember It
- **Category**: Healthcare & Social Inclusion
- **Target Audience**: North East India Elderly Citizens & Caregivers
