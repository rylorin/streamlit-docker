#!/bin/bash
#set -x

if [ -n "${GIT_URL-}" ]; then
	echo "Fetching ${GIT_URL}"
	git clone ${GIT_URL} streamlit_app
fi

cd streamlit_app

echo "Installing packages"
pip3 install -r requirements.txt >/dev/null

echo "Running app"
streamlit run streamlit_app.py
