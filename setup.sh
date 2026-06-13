#!/bin/bash
echo "============================================"
echo "  AI Interview System - Setup"
echo "============================================"
echo ""
echo "Step 1: Creating virtual environment..."
python3 -m venv venv

echo "Step 2: Activating virtual environment..."
source venv/bin/activate

echo "Step 3: Installing dependencies..."
pip install flask

echo ""
echo "============================================"
echo "  Setup complete! Run: ./start.sh"
echo "============================================"
