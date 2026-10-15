/**
 * NER Dementia Care - "Remember It"
 * Core Web Application Engine
 * Multilingual Support (8 North-East Languages) • Web Speech API • Web Audio API Synthesizer
 */

// ── 1. Localization Dictionaries ─────────────────────────────────────────────
const TRANSLATIONS = {
  en: {
    app_name: "NER Dementia Care",
    tagline: "Smart India Hackathon • North East Region",
    select_language: "Select Your Language",
    tap_to_listen: "Tap to Listen",
    welcome_greeting: "Welcome! You are safe and loved.",
    patient_mode: "Patient Mode",
    caregiver_mode: "Caregiver Portal",
    daily_medicine: "Daily Medicine",
    daily_routine: "Daily Routine",
    brain_activities: "Brain Activities",
    family_album: "Family Album",
    sos_button: "SOS – Help Me!",
    good_morning: "Good Morning",
    good_afternoon: "Good Afternoon",
    good_evening: "Good Evening",
    medication_tracker: "Medication Tracker",
    cognitive_score: "Cognitive Score",
    offline_sync: "Offline – Syncing soon",
    online_sync: "Synced to Cloud",
    add_medication: "Add Medication",
    next_dose: "Next Dose",
    taken: "Taken",
    missed: "Missed",
    pending: "Pending",
    today: "Today",
    score_trend: "Score Trend (7 days)",
    back: "Back",
    save: "Save",
    cancel: "Cancel",
    time: "Time",
    weather: "Weather",
    voice_helper: "Voice Helper",
    speak_greeting: "Speak Greeting",
    language_saved: "Language saved!",
    weather_desc: "28°C • Pleasant Breeze",
    location: "Guwahati, Assam",
    speech_greeting: "Welcome to NER Dementia Care. You are safe, loved, and at home."
  },
  hi: {
    app_name: "NER डिमेंशिया केयर",
    tagline: "स्मार्ट इंडिया हैकाथॉन • उत्तर पूर्व क्षेत्र",
    select_language: "अपनी भाषा चुनें",
    tap_to_listen: "सुनने के लिए टैप करें",
    welcome_greeting: "स्वागत है! आप सुरक्षित हैं और आपको प्यार किया जाता है।",
    patient_mode: "मरीज़ मोड",
    caregiver_mode: "देखभालकर्ता पोर्टल",
    daily_medicine: "दैनिक दवाई",
    daily_routine: "दैनिक दिनचर्या",
    brain_activities: "मस्तिष्क गतिविधियाँ",
    family_album: "पारिवारिक एल्बम",
    sos_button: "SOS – मेरी मदद करें!",
    good_morning: "सुप्रभात",
    good_afternoon: "नमस्कार",
    good_evening: "शुभ संध्या",
    medication_tracker: "दवाई ट्रैकर",
    cognitive_score: "संज्ञानात्मक स्कोर",
    offline_sync: "ऑफलाइन – शीघ्र सिंक होगा",
    online_sync: "क्लाउड सिंक हो गया",
    add_medication: "दवाई जोड़ें",
    next_dose: "अगली खुराक",
    taken: "ली गई",
    missed: "छूट गई",
    pending: "बाकी है",
    today: "आज",
    score_trend: "स्कोर ट्रेंड (7 दिन)",
    back: "वापस",
    save: "सहेजें",
    cancel: "रद्द करें",
    time: "समय",
    weather: "मौसम",
    voice_helper: "आवाज़ सहायक",
    speak_greeting: "अभिवादन बोलें",
    language_saved: "भाषा सहेजी गई!",
    weather_desc: "28°C • सुहावना मौसम",
    location: "गुवाहाटी, असम",
    speech_greeting: "NER डिमेंशिया केयर में आपका स्वागत है। आप सुरक्षित हैं और अपने घर पर हैं।"
  },
  as: {
    app_name: "NER ডিমেনচিয়া কেয়াৰ",
    tagline: "স্মাৰ্ট ইণ্ডিয়া হেকাথন • উত্তৰ-পূৰ্বাঞ্চল",
    select_language: "আপোনাৰ ভাষা বাছক",
    tap_to_listen: "শুনিবলৈ টেপ কৰক",
    welcome_greeting: "স্বাগতম! আপুনি সুৰক্ষিত আৰু ভালোপোৱা।",
    patient_mode: "ৰোগীৰ মোড",
    caregiver_mode: "যত্ন লোৱাজনৰ মোড",
    daily_medicine: "দৈনিক দৰব",
    daily_routine: "দৈনিক ৰুটিন",
    brain_activities: "মগজুৰ কাৰ্যকলাপ",
    family_album: "পৰিয়ালৰ এলবাম",
    sos_button: "SOS – মোক সহায় কৰক!",
    good_morning: "শুভ পুৱা",
    good_afternoon: "শুভ আবেলি",
    good_evening: "শুভ সন্ধিয়া",
    medication_tracker: "দৰব ট্ৰেকাৰ",
    cognitive_score: "জ্ঞানমূলক স্কোৰ",
    offline_sync: "অফলাইন – সোনকালে সিংক হ'ব",
    online_sync: "সিংক হৈছে",
    add_medication: "দৰব যোগ দিয়ক",
    next_dose: "পৰৱৰ্তী ডোজ",
    taken: "লোৱা হৈছে",
    missed: "মিছ হৈছে",
    pending: "বাকী আছে",
    today: "আজি",
    score_trend: "স্কোৰ ট্ৰেণ্ড (৭ দিন)",
    back: "পিছলৈ",
    save: "সংৰক্ষণ কৰক",
    cancel: "বাতিল কৰক",
    time: "সময়",
    weather: "বতৰ",
    voice_helper: "কণ্ঠ সহায়ক",
    speak_greeting: "অভিবাদন কওক",
    language_saved: "ভাষা সংৰক্ষিত হৈছে!",
    weather_desc: "২৮°C • মৃদু বতাহ",
    location: "গুৱাহাটী, অসম",
    speech_greeting: "NER ডিমেনচিয়া কেয়াৰলৈ স্বাগতম। আপুনি সুৰক্ষিত আৰু আপোনাৰ নিজৰ ঘৰত আছে।"
  },
  mni: {
    app_name: "NER ডিমেনশিয়া কেয়ার",
    tagline: "স্মার্ট ইন্ডিয়া হ্যাকাথন • নোংপোক লমদম",
    select_language: "নহাক্না মশক পুথোক",
    tap_to_listen: "হায়েং থম্বিবু টেপ তৌবিয়ু",
    welcome_greeting: "পুক্নিং থাগৎকনু! নহাক্না লৈহৌনবা অমসুং চাউনা।",
    patient_mode: "মরুপ মোড",
    caregiver_mode: "খোংথাং তৌবা মোড",
    daily_medicine: "অহানবা অরোইবা",
    daily_routine: "অহানবা ৱাৰী",
    brain_activities: "মৈথবা থবক",
    family_album: "ইমুং এলবাম",
    sos_button: "SOS – চাবিয়ু!",
    good_morning: "শুভ হৌখিবা",
    good_afternoon: "শুভ নুংথিল",
    good_evening: "শুভ খরা",
    medication_tracker: "অরোইবা ট্র্যাকার",
    cognitive_score: "থাজনবা স্কোর",
    offline_sync: "অফলাইন – নত্তি সিংক তৌগনি",
    online_sync: "সিংক তৌরে",
    add_medication: "অরোইবা চপথোক",
    next_dose: "মথক ডোজ",
    taken: "থাগৎরে",
    missed: "অমুক্তা",
    pending: "মনুংদা লৈ",
    today: "অদুগা",
    score_trend: "স্কোর ট্রেন্ড (৭ নুমিৎ)",
    back: "হৌরকপা",
    save: "লৈথোক",
    cancel: "থাদোক",
    time: "কাং",
    weather: "নুমিৎ",
    voice_helper: "থেংনবা হেল্পার",
    speak_greeting: "পুক্নিং থাগৎকনু হায়বিয়ু",
    language_saved: "মশক লৈথোকখ্রে!",
    weather_desc: "২৮°C • নুমিৎ তোইনা",
    location: "ইম্ফাল, মণিপুর",
    speech_greeting: "NER ডিমেনশিয়া কেয়ারদা পুক্নিং থাগৎকনু। নহাক্না লৈহৌনবা অমসুং চাউনা অমদি অকায়বা।"
  },
  kha: {
    app_name: "NER Dementia Care",
    tagline: "Smart India Hackathon • Meghalaya & NER",
    select_language: "Hap ia ka ktien jong phi",
    tap_to_listen: "Tap bha ban tip",
    welcome_greeting: "Wan bah sha NER! Phi long kumno burom bad shynrang.",
    patient_mode: "Modo Patient",
    caregiver_mode: "Modo Caregiver",
    daily_medicine: "Dawai Sngi Sngi",
    daily_routine: "Riti Sngi Sngi",
    brain_activities: "Wanrep Jingpyrshah",
    family_album: "Album Kynmaw",
    sos_button: "SOS – Tip ia nga!",
    good_morning: "Sngi Bha",
    good_afternoon: "Sngi Bha (Weih)",
    good_evening: "Khyndai Bha",
    medication_tracker: "Tracker Dawai",
    cognitive_score: "Score Jingthymme",
    offline_sync: "Offline – Nangta da sync",
    online_sync: "Synced to Cloud",
    add_medication: "Shna dawai",
    next_dose: "Dose ha pynsneng",
    taken: "Laitluid",
    missed: "Chem",
    pending: "Nangta",
    today: "Sngi jaka",
    score_trend: "Score Trend (7 Sngi)",
    back: "Khynrong",
    save: "Kynmaw",
    cancel: "Thoh",
    time: "Snem",
    weather: "Riti Jingim",
    voice_helper: "Jingmut Tip",
    speak_greeting: "Ong wan bah",
    language_saved: "Ktien la kynmaw!",
    weather_desc: "24°C • Slap bad lyer",
    location: "Shillong, Meghalaya",
    speech_greeting: "Wan bah sha NER Dementia Care. Phi long kumno burom bad shynrang."
  },
  lus: {
    app_name: "NER Dementia Care",
    tagline: "Smart India Hackathon • Mizoram",
    select_language: "I tawng i thlang rawh",
    tap_to_listen: "Chhiar turin tap rawh",
    welcome_greeting: "I thleng thin! I phal tak ani tih ngai rawh.",
    patient_mode: "Nau Damdawi Mode",
    caregiver_mode: "Enkawltu Mode",
    daily_medicine: "Nitin Damdawi",
    daily_routine: "Nitin Tihna",
    brain_activities: "Ngaihtuah Hna",
    family_album: "Chhungkaw Album",
    sos_button: "SOS – Kan rawn tih ang!",
    good_morning: "Zingah",
    good_afternoon: "Tlanin",
    good_evening: "Tlai Chhung",
    medication_tracker: "Damdawi Tracker",
    cognitive_score: "Ngaihtuahna Score",
    offline_sync: "Offline – Tlanin Sync",
    online_sync: "Sync Rawn Ni",
    add_medication: "Damdawi Chhuak",
    next_dose: "Hnu Damdawi",
    taken: "Rawn la Ni",
    missed: "Chem Ni",
    pending: "Tla Lo",
    today: "Nitin",
    score_trend: "Score Trend (Ni 7)",
    back: "Tlem Leh",
    save: "Keng Lo",
    cancel: "Dah Lo",
    time: "Hun",
    weather: "Thlipuia",
    voice_helper: "Thu Engkai",
    speak_greeting: "Zahawm Ngeih Thu",
    language_saved: "Tawng Keng Lo!",
    weather_desc: "25°C • Boruak nuam",
    location: "Aizawl, Mizoram",
    speech_greeting: "NER Dementia Care-ah i thleng thin. I phal tak ani tih ngai rawh."
  },
  bod: {
    app_name: "NER डिमेन्सिया केयर",
    tagline: "स्मार्ट इन्डिया हेकाथन • बड'लेण्ड",
    select_language: "गावनि बिसान्थि फोरखौ सायख",
    tap_to_listen: "हन्जायनो टेप दो",
    welcome_greeting: "बिजिरनाय! नों सुरक्षित आरो गोसोखौ मिनथिनो।",
    patient_mode: "नोजोर मोड",
    caregiver_mode: "सुखु मोड",
    daily_medicine: "रोजाव दावाइ",
    daily_routine: "रोजाव काज",
    brain_activities: "मगज काजलाइ",
    family_album: "परिवार एलबाम",
    sos_button: "SOS – सोरखौ गनायख!",
    good_morning: "बिसोरखाब हांखो",
    good_afternoon: "आलासे आबहावा",
    good_evening: "बिसोरखाब रांखोन",
    medication_tracker: "दावाइ ट्रैकार",
    cognitive_score: "मगजखाइ स्कोर",
    offline_sync: "अफलाइन – बांसिन सिंक जागोन",
    online_sync: "सिंक जाबाय",
    add_medication: "दावाइ बावफाल",
    next_dose: "बांसिन डोज",
    taken: "थाखोबाय",
    missed: "नाथाय",
    pending: "बाकी",
    today: "बिसोर",
    score_trend: "स्कोर ट्रेन्ड (7 सान)",
    back: "उलटा",
    save: "सोङो",
    cancel: "मान",
    time: "सम",
    weather: "खामानि",
    voice_helper: "हाबखालि मदद",
    speak_greeting: "नमस्काराव हाबखालि",
    language_saved: "बिसान्थि सोङोबाय!",
    weather_desc: "27°C • बार सुलुं",
    location: "कोकराझार, बड'लेण्ड",
    speech_greeting: "NER डिमेन्सिया केयरमा स्वागत। नों सुरक्षित आरो गोसोखौ मिनथिनो।"
  },
  garo: {
    app_name: "NER Dementia Care",
    tagline: "Smart India Hackathon • Garo Hills",
    select_language: "Nim·ande kate nim·o kua bolgipa",
    tap_to_listen: "Nangna gilsibo tap dibo",
    welcome_greeting: "Rang·a! Ninde aro chi·gipaen.",
    patient_mode: "Patient Mode",
    caregiver_mode: "Caregiver Mode",
    daily_medicine: "Rokal Dawai",
    daily_routine: "Rokal Gimin",
    brain_activities: "Dimik·gimin",
    family_album: "Songchim·a Album",
    sos_button: "SOS – Singboa dibo!",
    good_morning: "Rang·a Aro",
    good_afternoon: "Rang·a Donggipa",
    good_evening: "Rang·a Raksial",
    medication_tracker: "Dawai Tracker",
    cognitive_score: "Dimik·a Score",
    offline_sync: "Offline – Wak·gipa Sync",
    online_sync: "Sync Jakoba",
    add_medication: "Dawai Chol·dibo",
    next_dose: "Wak·gipa Dose",
    taken: "Thakoba",
    missed: "Anang",
    pending: "Wak·gipa",
    today: "Rokal",
    score_trend: "Score Trend (7 Dal)",
    back: "Benang",
    save: "Gitchak",
    cancel: "Mang",
    time: "Wak",
    weather: "Rimil",
    voice_helper: "Kwang·a Singboa",
    speak_greeting: "Rang·a Haibo",
    language_saved: "Bolgipa Gitchak·ba!",
    weather_desc: "26°C • Rong·gimin",
    location: "Tura, Meghalaya",
    speech_greeting: "NER Dementia Careni songa. Ninde aro chi·gipaen."
  }
};

const LANGUAGES_META = [
  { code: 'en', name: 'English', native: 'English', state: 'Universal', icon: '📖', badge: '🇮🇳 India' },
  { code: 'hi', name: 'Hindi', native: 'हिन्दी', state: 'North India', icon: '🙏', badge: '🇮🇳 India' },
  { code: 'as', name: 'Assamese', native: 'অসমীয়া', state: 'Assam', icon: '🦏', badge: '🍵 Tea & Rhino' },
  { code: 'mni', name: 'Manipuri', native: 'মৈতৈলোন্', state: 'Manipur', icon: '🦌', badge: '🌊 Sangai' },
  { code: 'kha', name: 'Khasi', native: 'Khasi', state: 'Meghalaya', icon: '🌉', badge: '🌧️ Root Bridge' },
  { code: 'lus', name: 'Mizo', native: 'Mizo ṭawng', state: 'Mizoram', icon: '🌸', badge: '🌺 Anthurium' },
  { code: 'bod', name: 'Bodo', native: 'बड़ो', state: 'Bodoland', icon: '🌾', badge: '🎶 Bihu Song' },
  { code: 'garo', name: 'Garo', native: 'A·chik', state: 'Garo Hills', icon: '🏔️', badge: '🍊 Nokrek' }
];

// ── 2. Web Audio API Synthesizer (Chimes, Clicks, Fanfare, SOS Siren) ──────
class SoundEngine {
  constructor() {
    this.ctx = null;
    this.isMuted = false;
    this.sirenOsc = null;
    this.sirenTimer = null;
  }

  init() {
    if (!this.ctx) {
      const AudioContext = window.AudioContext || window.webkitAudioContext;
      this.ctx = new AudioContext();
    }
    if (this.ctx.state === 'suspended') {
      this.ctx.resume();
    }
  }

  playChime() {
    if (this.isMuted) return;
    this.init();
    const now = this.ctx.currentTime;
    const osc = this.ctx.createOscillator();
    const gain = this.ctx.createGain();

    osc.type = 'sine';
    osc.frequency.setValueAtTime(523.25, now); // C5
    osc.frequency.exponentialRampToValueAtTime(659.25, now + 0.12); // E5
    osc.frequency.exponentialRampToValueAtTime(783.99, now + 0.25); // G5
    osc.frequency.exponentialRampToValueAtTime(1046.50, now + 0.38); // C6

    gain.gain.setValueAtTime(0.3, now);
    gain.gain.exponentialRampToValueAtTime(0.001, now + 0.8);

    osc.connect(gain);
    gain.connect(this.ctx.destination);

    osc.start(now);
    osc.stop(now + 0.8);
  }

  playClick() {
    if (this.isMuted) return;
    this.init();
    const now = this.ctx.currentTime;
    const osc = this.ctx.createOscillator();
    const gain = this.ctx.createGain();

    osc.type = 'triangle';
    osc.frequency.setValueAtTime(800, now);
    osc.frequency.exponentialRampToValueAtTime(200, now + 0.05);

    gain.gain.setValueAtTime(0.2, now);
    gain.gain.exponentialRampToValueAtTime(0.01, now + 0.05);

    osc.connect(gain);
    gain.connect(this.ctx.destination);

    osc.start(now);
    osc.stop(now + 0.05);
  }

  playFanfare() {
    if (this.isMuted) return;
    this.init();
    const notes = [440, 554.37, 659.25, 880];
    notes.forEach((freq, idx) => {
      const now = this.ctx.currentTime + idx * 0.12;
      const osc = this.ctx.createOscillator();
      const gain = this.ctx.createGain();

      osc.type = 'sine';
      osc.frequency.setValueAtTime(freq, now);

      gain.gain.setValueAtTime(0.28, now);
      gain.gain.exponentialRampToValueAtTime(0.001, now + 0.4);

      osc.connect(gain);
      gain.connect(this.ctx.destination);

      osc.start(now);
      osc.stop(now + 0.4);
    });
  }

  startSiren() {
    if (this.isMuted) return;
    this.init();
    this.stopSiren();

    const osc = this.ctx.createOscillator();
    const gain = this.ctx.createGain();

    osc.type = 'sawtooth';
    gain.gain.setValueAtTime(0.35, this.ctx.currentTime);

    let high = true;
    osc.frequency.setValueAtTime(700, this.ctx.currentTime);

    this.sirenTimer = setInterval(() => {
      if (!this.ctx) return;
      const target = high ? 1050 : 650;
      osc.frequency.exponentialRampToValueAtTime(target, this.ctx.currentTime + 0.35);
      high = !high;
    }, 400);

    osc.connect(gain);
    gain.connect(this.ctx.destination);
    osc.start();
    this.sirenOsc = osc;
  }

  stopSiren() {
    if (this.sirenTimer) {
      clearInterval(this.sirenTimer);
      this.sirenTimer = null;
    }
    if (this.sirenOsc) {
      try {
        this.sirenOsc.stop();
        this.sirenOsc.disconnect();
      } catch (_) {}
      this.sirenOsc = null;
    }
  }
}

// ── 3. App State & Controller ──────────────────────────────────────────────
class DementiaCareApp {
  constructor() {
    this.lang = localStorage.getItem('ner_lang') || 'en';
    this.sound = new SoundEngine();
    this.activeScreen = 'patient';
    this.viewMode = 'desktop'; // 'mobile' or 'desktop'

    // Mock initial medications
    this.medications = JSON.parse(localStorage.getItem('ner_meds')) || [
      { id: 1, name: 'Donepezil 10mg', time: '08:00 AM', status: 'taken', icon: '💊', note: 'Morning with water' },
      { id: 2, name: 'Vitamin D3 & Calcium', time: '12:30 PM', status: 'pending', icon: '🌟', note: 'After lunch' },
      { id: 3, name: 'Memantine 20mg', time: '07:00 PM', status: 'pending', icon: '💊', note: 'Before dinner' },
      { id: 4, name: 'Omega-3 Fish Oil', time: '09:30 PM', status: 'pending', icon: '🐟', note: 'Before sleep' }
    ];

    // Cognitive Scores (last 7 days)
    this.cognitiveScores = [65, 68, 64, 70, 72, 69, 75];
    this.cognitiveDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    // Memory Game State
    this.memoryCards = [];
    this.flippedCards = [];
    this.matchedPairs = 0;
    this.moves = 0;

    // Family Album Data
    this.familyMembers = [
      {
        name: 'Riya Sharma',
        relation: 'Daughter (ডক্টৰ ৰিয়া)',
        icon: '👩‍⚕️',
        bg: '#E0F2F1',
        note: 'Visits every Sunday. Always brings your favourite Assam tea. Call her if you feel worried.',
        speech: 'This is your daughter Riya. She is a doctor and loves you very much.'
      },
      {
        name: 'Aarav Sharma',
        relation: 'Grandson (নাতি আৰভ)',
        icon: '👦',
        bg: '#FFF3E0',
        note: 'Studies in 5th standard. Plays chess with you on Saturdays. Loves your folk stories.',
        speech: 'This is Aarav, your grandson. He loves hearing your childhood stories.'
      },
      {
        name: 'Vikram Sharma',
        relation: 'Son (বৰপুত্ৰ বিক্ৰম)',
        icon: '👨‍💼',
        bg: '#E8EAF6',
        note: 'Engineers in Guwahati. Calls you every evening at 7:30 PM without fail.',
        speech: 'This is your son Vikram. He lives in Guwahati and calls you every evening.'
      },
      {
        name: 'Sunita Sharma',
        relation: 'Wife (ধৰ্মপত্নী সুনীতা)',
        icon: '👵',
        bg: '#FCE4EC',
        note: 'Your loving life partner for 48 years. Always with you in the living room.',
        speech: 'This is Sunita, your beloved wife of 48 years. You are safe together.'
      }
    ];

    this.init();
  }

  init() {
    this.initClock();
    this.initSpeech();
    this.renderLanguageModal();
    this.applyLanguage();
    this.renderMedications();
    this.renderCognitiveChart();
    this.renderFamilyAlbum();
    this.initMemoryGame();
    this.bindEvents();
  }

  // ── Clock & Date ────────────────────────────────────────────────────────
  initClock() {
    const updateTime = () => {
      const now = new Date();
      let hours = now.getHours();
      const minutes = String(now.getMinutes()).padStart(2, '0');
      const ampm = hours >= 12 ? 'PM' : 'AM';
      hours = hours % 12 || 12;

      const clockEl = document.getElementById('patientClock');
      if (clockEl) {
        clockEl.textContent = `${hours}:${minutes} ${ampm}`;
      }

      const days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
      const months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
      const dateEl = document.getElementById('patientDate');
      if (dateEl) {
        dateEl.textContent = `${days[now.getDay()]}, ${now.getDate()} ${months[now.getMonth()]} ${now.getFullYear()}`;
      }

      // Dynamic Greeting
      const currentH = now.getHours();
      const t = TRANSLATIONS[this.lang] || TRANSLATIONS.en;
      let greetWord = t.good_morning;
      if (currentH >= 12 && currentH < 17) greetWord = t.good_afternoon;
      else if (currentH >= 17) greetWord = t.good_evening;

      const greetWordEl = document.getElementById('greetingTitle');
      if (greetWordEl) greetWordEl.textContent = `${greetWord}! 🙏`;
    };

    updateTime();
    setInterval(updateTime, 1000);
  }

  // ── Text to Speech (Web Speech API) ──────────────────────────────────────
  initSpeech() {
    this.synth = window.speechSynthesis;
  }

  speak(text) {
    if (!this.synth) {
      this.showToast('Voice playback not supported on this browser.');
      return;
    }
    this.synth.cancel(); // Stop ongoing speech

    const utter = new SpeechSynthesisUtterance(text);
    utter.rate = 0.88; // Slightly slower for elderly comprehension
    utter.pitch = 1.0;

    // Language matching
    const voiceMap = {
      en: 'en-IN',
      hi: 'hi-IN',
      as: 'as-IN',
      mni: 'hi-IN',
      kha: 'en-IN',
      lus: 'en-IN',
      bod: 'hi-IN',
      garo: 'en-IN'
    };

    utter.lang = voiceMap[this.lang] || 'en-IN';

    const speakBtn = document.getElementById('btnSpeakGreeting');
    if (speakBtn) speakBtn.classList.add('speaking');

    utter.onend = () => {
      if (speakBtn) speakBtn.classList.remove('speaking');
    };
    utter.onerror = () => {
      if (speakBtn) speakBtn.classList.remove('speaking');
    };

    this.synth.speak(utter);
  }

  // ── Language Management ──────────────────────────────────────────────────
  renderLanguageModal() {
    const grid = document.getElementById('langGrid');
    if (!grid) return;

    grid.innerHTML = LANGUAGES_META.map(l => `
      <div class="lang-card ${l.code === this.lang ? 'selected' : ''}" data-code="${l.code}">
        <div style="display: flex; align-items: center; gap: 12px;">
          <div class="lang-icon-box">${l.icon}</div>
          <div class="lang-names">
            <h4>${l.native}</h4>
            <p>${l.name} • ${l.state}</p>
          </div>
        </div>
        <button class="lang-hear-btn" title="Tap to listen" data-hear="${l.code}">
          🔊
        </button>
      </div>
    `).join('');

    // Bind selection & audio preview
    grid.querySelectorAll('.lang-card').forEach(card => {
      card.addEventListener('click', (e) => {
        if (e.target.closest('.lang-hear-btn')) {
          const code = card.dataset.code;
          const sample = (TRANSLATIONS[code] || TRANSLATIONS.en).speech_greeting;
          this.speak(sample);
          return;
        }
        this.setLanguage(card.dataset.code);
        this.closeModal('langModal');
      });
    });
  }

  setLanguage(code) {
    if (!TRANSLATIONS[code]) return;
    this.lang = code;
    localStorage.setItem('ner_lang', code);
    this.applyLanguage();
    this.renderLanguageModal();
    this.sound.playClick();
    this.showToast((TRANSLATIONS[code] || TRANSLATIONS.en).language_saved);

    // Speak greeting in new language
    setTimeout(() => {
      this.speak(TRANSLATIONS[code].speech_greeting);
    }, 400);
  }

  applyLanguage() {
    const t = TRANSLATIONS[this.lang] || TRANSLATIONS.en;
    const meta = LANGUAGES_META.find(m => m.code === this.lang) || LANGUAGES_META[0];

    // Update triggers & flags
    const langBtnText = document.getElementById('currentLangLabel');
    if (langBtnText) langBtnText.textContent = `${meta.icon} ${meta.native}`;

    // Update data-i18n elements
    document.querySelectorAll('[data-i18n]').forEach(el => {
      const key = el.getAttribute('data-i18n');
      if (t[key]) {
        el.textContent = t[key];
      }
    });

    // Update specific dynamic labels
    const locEl = document.getElementById('weatherCity');
    if (locEl && t.location) locEl.textContent = t.location;

    const weatherEl = document.getElementById('weatherTemp');
    if (weatherEl && t.weather_desc) weatherEl.textContent = t.weather_desc;
  }

  // ── Medications Management ──────────────────────────────────────────────
  renderMedications() {
    const list = document.getElementById('medicationList');
    const badge = document.getElementById('medsBadge');
    if (!list) return;

    const pendingCount = this.medications.filter(m => m.status === 'pending').length;
    if (badge) {
      badge.textContent = `${pendingCount} pending today`;
    }

    list.innerHTML = this.medications.map((m, idx) => `
      <div class="med-row">
        <div class="med-info">
          <span class="med-icon">${m.icon}</span>
          <div>
            <div class="med-name">${m.name}</div>
            <div class="med-time">⏰ ${m.time} • ${m.note || ''}</div>
          </div>
        </div>
        <div class="med-status-controls">
          <span class="status-badge status-${m.status}">
            ${m.status === 'taken' ? '✓ Taken' : m.status === 'missed' ? '✗ Missed' : '⏳ Pending'}
          </span>
          <button class="btn-status-toggle" data-idx="${idx}" data-action="taken" title="Mark as Taken">
            ✓ Take
          </button>
          <button class="btn-status-toggle" data-idx="${idx}" data-action="missed" title="Mark as Missed">
            ✗
          </button>
        </div>
      </div>
    `).join('');

    // Bind toggle buttons
    list.querySelectorAll('.btn-status-toggle').forEach(btn => {
      btn.addEventListener('click', () => {
        const idx = parseInt(btn.dataset.idx, 10);
        const action = btn.dataset.action;
        this.updateMedStatus(idx, action);
      });
    });
  }

  updateMedStatus(idx, status) {
    this.medications[idx].status = status;
    localStorage.setItem('ner_meds', JSON.stringify(this.medications));
    this.renderMedications();

    if (status === 'taken') {
      this.sound.playChime();
      this.showToast(`Great job! Marked ${this.medications[idx].name} as Taken.`);
    } else {
      this.sound.playClick();
    }
  }

  addMedication(name, time, note) {
    if (!name || !time) return;
    this.medications.push({
      id: Date.now(),
      name,
      time,
      note,
      status: 'pending',
      icon: '💊'
    });
    localStorage.setItem('ner_meds', JSON.stringify(this.medications));
    this.renderMedications();
    this.sound.playChime();
    this.showToast('New medication added successfully.');
  }

  // ── Cognitive Score SVG Chart ────────────────────────────────────────────
  renderCognitiveChart() {
    const svg = document.getElementById('cognitiveSvg');
    if (!svg) return;

    const width = 360;
    const height = 150;
    const padX = 25;
    const padY = 25;

    const minScore = 50;
    const maxScore = 100;

    const points = this.cognitiveScores.map((score, i) => {
      const x = padX + (i * ((width - 2 * padX) / (this.cognitiveScores.length - 1)));
      const y = height - padY - ((score - minScore) / (maxScore - minScore)) * (height - 2 * padY);
      return { x, y, score, day: this.cognitiveDays[i] };
    });

    const pathD = points.reduce((acc, p, i) => `${acc} ${i === 0 ? 'M' : 'L'} ${p.x.toFixed(1)} ${p.y.toFixed(1)}`, '');
    const areaD = `${pathD} L ${points[points.length - 1].x} ${height - padY} L ${points[0].x} ${height - padY} Z`;

    svg.innerHTML = `
      <defs>
        <linearGradient id="tealGradient" x1="0" y1="0" x2="0" y2="1">
          <stop offset="0%" stop-color="#2E7D6E" stop-opacity="0.5"/>
          <stop offset="100%" stop-color="#2E7D6E" stop-opacity="0.0"/>
        </linearGradient>
      </defs>
      <path class="chart-area" d="${areaD}" />
      <path class="chart-line" d="${pathD}" />
      ${points.map(p => `
        <circle class="chart-dot" cx="${p.x.toFixed(1)}" cy="${p.y.toFixed(1)}">
          <title>${p.day}: ${p.score} / 100</title>
        </circle>
      `).join('')}
    `;

    const labelsContainer = document.getElementById('chartDays');
    if (labelsContainer) {
      labelsContainer.innerHTML = this.cognitiveDays.map((d, i) => `
        <span style="${i === this.cognitiveDays.length - 1 ? 'color: var(--primary); font-weight:800;' : ''}">${d}</span>
      `).join('');
    }
  }

  // ── Interactive Memory Game ──────────────────────────────────────────────
  initMemoryGame() {
    const items = [
      { id: 1, emoji: '🦏', title: 'One-Horned Rhino' },
      { id: 2, emoji: '🍵', title: 'Assam Green Tea' },
      { id: 3, emoji: '🦌', title: 'Sangai Deer' },
      { id: 4, emoji: '🌉', title: 'Root Bridge' },
      { id: 5, emoji: '🌸', title: 'Anthurium Flower' },
      { id: 6, emoji: '🥁', title: 'Bihu Dhol' }
    ];

    // Duplicate for pairs and shuffle
    const deck = [...items, ...items].map((item, idx) => ({
      ...item,
      uniqueId: idx
    }));

    // Fisher-Yates shuffle
    for (let i = deck.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [deck[i], deck[j]] = [deck[j], deck[i]];
    }

    this.memoryCards = deck;
    this.flippedCards = [];
    this.matchedPairs = 0;
    this.moves = 0;

    this.renderMemoryGame();
  }

  renderMemoryGame() {
    const grid = document.getElementById('memoryGrid');
    const movesEl = document.getElementById('gameMoves');
    const matchesEl = document.getElementById('gameMatches');
    if (!grid) return;

    if (movesEl) movesEl.textContent = `Moves: ${this.moves}`;
    if (matchesEl) matchesEl.textContent = `Matches: ${this.matchedPairs}/6`;

    grid.innerHTML = this.memoryCards.map((card, idx) => `
      <div class="memory-card" data-idx="${idx}">
        <div class="card-front"></div>
        <div class="card-back">
          <span class="card-emoji">${card.emoji}</span>
          <span class="card-title">${card.title}</span>
        </div>
      </div>
    `).join('');

    grid.querySelectorAll('.memory-card').forEach(el => {
      el.addEventListener('click', () => {
        const idx = parseInt(el.dataset.idx, 10);
        this.flipMemoryCard(idx, el);
      });
    });
  }

  flipMemoryCard(idx, el) {
    if (this.flippedCards.length >= 2 || el.classList.contains('flipped') || el.classList.contains('matched')) {
      return;
    }

    this.sound.playClick();
    el.classList.add('flipped');
    this.flippedCards.push({ idx, card: this.memoryCards[idx], el });

    if (this.flippedCards.length === 2) {
      this.moves++;
      const movesEl = document.getElementById('gameMoves');
      if (movesEl) movesEl.textContent = `Moves: ${this.moves}`;

      const [first, second] = this.flippedCards;
      if (first.card.id === second.card.id) {
        // Match!
        setTimeout(() => {
          first.el.classList.add('matched');
          second.el.classList.add('matched');
          this.matchedPairs++;
          const matchesEl = document.getElementById('gameMatches');
          if (matchesEl) matchesEl.textContent = `Matches: ${this.matchedPairs}/6`;
          this.flippedCards = [];
          this.sound.playChime();

          if (this.matchedPairs === 6) {
            setTimeout(() => {
              this.sound.playFanfare();
              this.showToast('🎉 Wonderful job! Your mind is active and strong!');
              this.speak('Wonderful job! You completed all the memory matches!');
            }, 300);
          }
        }, 400);
      } else {
        // No match - flip back
        setTimeout(() => {
          first.el.classList.remove('flipped');
          second.el.classList.remove('flipped');
          this.flippedCards = [];
        }, 900);
      }
    }
  }

  // ── Family Album ─────────────────────────────────────────────────────────
  renderFamilyAlbum() {
    const grid = document.getElementById('familyAlbumGrid');
    if (!grid) return;

    grid.innerHTML = this.familyMembers.map((member, idx) => `
      <div class="family-card">
        <div class="family-photo" style="background: ${member.bg}">${member.icon}</div>
        <div class="family-info">
          <h4>${member.name}</h4>
          <span class="family-relation">${member.relation}</span>
          <p class="family-note">${member.note}</p>
          <button class="btn-speak-family" data-idx="${idx}">
            🔊 Listen Note
          </button>
        </div>
      </div>
    `).join('');

    grid.querySelectorAll('.btn-speak-family').forEach(btn => {
      btn.addEventListener('click', () => {
        const idx = parseInt(btn.dataset.idx, 10);
        this.speak(this.familyMembers[idx].speech);
      });
    });
  }

  // ── Navigation & Screens ─────────────────────────────────────────────────
  switchScreen(screenName) {
    this.activeScreen = screenName;
    document.querySelectorAll('.screen').forEach(s => s.classList.remove('active'));
    const target = document.getElementById(`${screenName}Screen`);
    if (target) target.classList.add('active');

    // Update active nav button
    document.querySelectorAll('.mode-btn').forEach(btn => {
      btn.classList.toggle('active', btn.dataset.screen === screenName);
    });

    this.sound.playClick();
    window.scrollTo({ top: 0, behavior: 'smooth' });
  }

  // ── Modals & SOS Alert ───────────────────────────────────────────────────
  openModal(modalId) {
    const modal = document.getElementById(modalId);
    if (modal) {
      modal.classList.add('active');
      this.sound.playClick();
    }
  }

  closeModal(modalId) {
    const modal = document.getElementById(modalId);
    if (modal) {
      modal.classList.remove('active');
      if (modalId === 'sosModal') {
        this.sound.stopSiren();
      }
    }
  }

  triggerSOS() {
    this.openModal('sosModal');
    this.sound.startSiren();
    this.speak('Emergency SOS alert activated. Your family and hospital have been notified. Stay calm, help is coming.');
  }

  // ── Toast Notification ───────────────────────────────────────────────────
  showToast(message) {
    let container = document.getElementById('toastContainer');
    if (!container) {
      container = document.createElement('div');
      container.id = 'toastContainer';
      container.className = 'toast-container';
      document.body.appendChild(container);
    }

    const toast = document.createElement('div');
    toast.className = 'toast';
    toast.innerHTML = `<span>✓</span> <span>${message}</span>`;
    container.appendChild(toast);

    setTimeout(() => {
      toast.style.opacity = '0';
      toast.style.transform = 'translateY(-10px)';
      toast.style.transition = 'all 0.3s ease';
      setTimeout(() => toast.remove(), 300);
    }, 2800);
  }

  // ── Event Bindings ───────────────────────────────────────────────────────
  bindEvents() {
    // Mode navigation
    document.querySelectorAll('.mode-btn').forEach(btn => {
      btn.addEventListener('click', () => {
        this.switchScreen(btn.dataset.screen);
      });
    });

    // Language modal open/close
    document.getElementById('btnLangSelect')?.addEventListener('click', () => {
      this.openModal('langModal');
    });
    document.getElementById('btnCloseLang')?.addEventListener('click', () => {
      this.closeModal('langModal');
    });

    // Device View switch (Mobile vs Desktop)
    const frame = document.getElementById('deviceFrame');
    document.querySelectorAll('.view-btn').forEach(btn => {
      btn.addEventListener('click', () => {
        document.querySelectorAll('.view-btn').forEach(b => b.classList.remove('active'));
        btn.classList.add('active');
        const view = btn.dataset.view;
        this.viewMode = view;
        frame.className = `device-frame mode-${view}`;
        this.sound.playClick();
      });
    });

    // Sound mute toggle
    const btnMute = document.getElementById('btnMuteToggle');
    btnMute?.addEventListener('click', () => {
      this.sound.isMuted = !this.sound.isMuted;
      btnMute.textContent = this.sound.isMuted ? '🔇' : '🔊';
      this.showToast(this.sound.isMuted ? 'Sound muted' : 'Sound unmuted');
    });

    // Speak Greeting Button
    document.getElementById('btnSpeakGreeting')?.addEventListener('click', () => {
      const t = TRANSLATIONS[this.lang] || TRANSLATIONS.en;
      this.speak(t.speech_greeting);
    });

    // Trigger SOS
    document.getElementById('btnSosTrigger')?.addEventListener('click', () => {
      this.triggerSOS();
    });
    document.getElementById('btnSosCancel')?.addEventListener('click', () => {
      this.closeModal('sosModal');
    });

    // Patient Screen quick links
    document.getElementById('cardDailyMeds')?.addEventListener('click', () => {
      this.switchScreen('caregiver');
    });
    document.getElementById('cardBrainGames')?.addEventListener('click', () => {
      this.switchScreen('games');
    });
    document.getElementById('cardFamilyAlbum')?.addEventListener('click', () => {
      this.switchScreen('album');
    });
    document.getElementById('btnSwitchCaregiver')?.addEventListener('click', () => {
      this.switchScreen('caregiver');
    });

    // Restart Memory Game
    document.getElementById('btnRestartGame')?.addEventListener('click', () => {
      this.initMemoryGame();
      this.sound.playClick();
      this.showToast('Memory game restarted!');
    });

    // Add Medication Modal
    document.getElementById('btnAddMedModalOpen')?.addEventListener('click', () => {
      this.openModal('addMedModal');
    });
    document.getElementById('btnCloseAddMed')?.addEventListener('click', () => {
      this.closeModal('addMedModal');
    });
    document.getElementById('formAddMed')?.addEventListener('submit', (e) => {
      e.preventDefault();
      const name = document.getElementById('inputMedName').value.trim();
      const time = document.getElementById('inputMedTime').value.trim();
      const note = document.getElementById('inputMedNote').value.trim();
      if (name && time) {
        this.addMedication(name, time, note);
        e.target.reset();
        this.closeModal('addMedModal');
      }
    });

    // Close modals on clicking overlay background
    document.querySelectorAll('.modal-overlay').forEach(modal => {
      modal.addEventListener('click', (e) => {
        if (e.target === modal) {
          this.closeModal(modal.id);
        }
      });
    });
  }
}

// ── 4. App Bootstrap ───────────────────────────────────────────────────────
document.addEventListener('DOMContentLoaded', () => {
  window.app = new DementiaCareApp();
});
