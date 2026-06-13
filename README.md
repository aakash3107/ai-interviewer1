# AI-Driven Automated Interviewer
### Fully client-side · No API keys · Runs in your browser

---

## What This Does

A Flask web app that serves a **100% client-side** AI interview system:

| Feature | Technology Used | Where it runs |
|---|---|---|
| Screen capture | Browser `getDisplayMedia` API | Browser |
| OCR (read slides/code) | **Tesseract.js v5** | Browser (WebAssembly) |
| Speech-to-Text | **Web Speech API** | Browser (built-in) |
| AI question generation | **Transformers.js** (DistilGPT2) + rule engine | Browser |
| Scoring & feedback | Heuristic scoring engine | Browser |
| Report export | Blob download | Browser |

**Flask only serves the HTML file.** All intelligence runs locally.

---

## Step-by-Step Setup (Windows)

### Prerequisites
- Python 3.13 installed from https://python.org  
  ✅ During install, tick **"Add Python to PATH"**
- Google Chrome or Microsoft Edge (required for screen share + Web Speech API)

---

### Step 1 — Download / Get the project
Put the `ai_interviewer` folder somewhere easy, like your Desktop.

---

### Step 2 — Open Terminal (Command Prompt)
Press `Win + R`, type `cmd`, press Enter.

Navigate to the project folder:
```
cd Desktop\ai_interviewer
```

---

### Step 3 — Run Setup (one time only)
```
setup.bat
```
This creates a virtual environment and installs Flask (~5 seconds).

---

### Step 4 — Start the App
```
start.bat
```
You'll see:
```
 * Running on http://127.0.0.1:5000
```

---

### Step 5 — Open in Chrome
Go to: **http://localhost:5000**

You'll see a loading screen while the AI model downloads (~30–60 MB, first time only).  
Or click **"Skip model load"** to use the rule-based mode (works great too).

---

## Step-by-Step Setup (Mac / Linux)

```bash
# In Terminal, navigate to the project
cd ~/Desktop/ai_interviewer

# One-time setup
chmod +x setup.sh start.sh
./setup.sh

# Start the server
./start.sh
```

Open **http://localhost:5000** in Chrome.

---

## How to Run an Interview Session

```
1. Open http://localhost:5000 in Chrome
2. Wait for model to load (or click Skip)
3. Click [Share Screen] → select your presentation window
4. Click [Start Mic] → allow microphone access
5. Click [Begin Interview]
6. The AI asks 6 adaptive questions — speak your answers naturally
7. After 4 seconds of silence, the AI moves to the next question
8. Click [Stop & Score] at any time to get your evaluation
9. View scores in the bottom panel
10. Click [Export Report] to download a .txt feedback file
```

---

## Architecture

```
ai_interviewer/
│
├── app.py              ← Flask server (just serves index.html)
├── requirements.txt    ← Only dependency: flask
│
├── templates/
│   └── index.html      ← ENTIRE app: UI + OCR + STT + AI logic
│
├── static/
│   └── js/main.js      ← Placeholder (logic is inline)
│
├── setup.bat / setup.sh
└── start.bat / start.sh
```

### Client-side CDN libraries loaded in browser:
- `tesseract.js@5` — OCR
- `@huggingface/transformers@3` — Local LLM

---

## Scoring Breakdown

| Dimension | How it's measured |
|---|---|
| **Technical Depth** | Count of technical terms in answers (API, database, algorithm, etc.) |
| **Clarity** | Vocabulary diversity + average sentence length |
| **Originality** | Overlap between your answers and your screen content (OCR) |
| **Understanding** | % of questions answered with substantive responses |
| **Overall** | Average of the four dimensions |

---

## Troubleshooting

| Problem | Fix |
|---|---|
| "Screen share not working" | Use Chrome or Edge; Firefox has limited support |
| "Mic not transcribing" | Use Chrome; allow mic in browser permissions |
| "Model stuck loading" | Click "Skip model load" — rule-based mode works fine |
| "Port 5000 in use" | Edit app.py, change `port=5000` to `port=5001` |
| pip not found | Re-install Python and tick "Add to PATH" |

---

## Constraints Met

- ✅ No API keys required
- ✅ Fully client-side OCR (Tesseract.js WebAssembly)
- ✅ Fully client-side STT (Web Speech API)
- ✅ AI model runs in browser (Transformers.js)
- ✅ Adaptive follow-up questions based on previous answers
- ✅ Context-aware questions from OCR screen content
- ✅ Structured feedback report generated locally
- ✅ Export report without server involvement
- ✅ Flask + Python 3.13 compatible
