#!/bin/bash
#set -x
set -e  # Exit immediately if a command exits with a non-zero status

if [ -n "${GIT_URL-}" ]; then
	echo "Fetching ${GIT_URL}..."
	git clone --depth=1 ${GIT_URL} streamlit_app
fi

cd streamlit_app || { echo "Directory 'streamlit_app' not found!"; exit 1; }

echo "Installing dependencies..."
pip3 --root-user-action install -r requirements.txt >/dev/null

echo "Starting..."
exec streamlit run streamlit_app.py
