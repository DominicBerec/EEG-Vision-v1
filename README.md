# EEGVision

A real-time EEG visualization demo that replays PhysioNet motor-imagery
recordings onto an interactive 3D head model and classifies the imagined
movement with an SVM, for brain-computer interface (BCI) research.

![EEGVision Status](https://img.shields.io/badge/Status-Active-brightgreen)

## Features

- **64-Electrode Overlay** - Standard 10-10 EEG montage mapped onto a 3D head model
- **Live Amplitude Streaming** - Real-time electrode amplitude updates via WebSocket (10 Hz)
- **Amplitude Color Mapping** - Blue-to-red color scale for signal amplitude
- **MNE-Powered Backend** - Loads and preprocesses PhysioNet EEG Motor Movement/Imagery data
- **Mental State Classification** - SVM classifier predicts left hand / right hand / both hands / both feet motor imagery
- **Desktop App** - Available as a standalone application for Mac and Windows

## Requirements

### Backend
- Python 3.11+
- FastAPI
- numpy
- mne
- scikit-learn
- uvicorn

### Frontend
- Modern web browser with WebGL support

## Installation

1. Clone the repository:
```bash
git clone https://github.com/DominicBerec/eegvision.git
cd eegvision
```

2. Install Python dependencies:
```bash
pip install -r requirements.txt
```

3. Start the backend server:
```bash
cd backend
python server.py
```

4. Open `http://localhost:8000` in your browser (the viewer loads directly)

## Usage

1. Start the server (runs on `http://localhost:8000`)
2. Open `http://localhost:8000` in your browser
3. Select a subject and a mental state (left hand, right hand, both hands, both feet)
4. Click "Start Stream" to view live electrode amplitudes on the 3D head model
5. Read the predicted mental state and confidence in the classification panel

## Data Source

EEGVision uses the [PhysioNet EEG Motor Movement/Imagery dataset](https://physionet.org/content/eegmmidb/1.0.0/)
(`eegmmidb`), downloaded automatically via MNE on first use.

## Desktop Application

EEGVision can be built as a standalone desktop application for Mac and Windows.

### Build for macOS

```bash
./build_mac.sh
```

This creates `dist/EEGVision.app` - a native macOS application.

### Build for Windows

```batch
build_windows.bat
```

This creates `dist/EEGVision/EEGVision.exe` - a Windows executable.

### Build Requirements

- Python 3.11+
- pywebview
- pyinstaller

## Tech Stack

- **Frontend**: HTML5, CSS3, JavaScript, Three.js
- **Backend**: Python, FastAPI, MNE-Python, scikit-learn
- **3D Rendering**: WebGL via Three.js
- **Desktop**: pywebview, PyInstaller

## License

MIT License
