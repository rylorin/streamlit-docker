#!/bin/bash
#set -x

if [ -n "${GIT_URL-}" ]; then
	echo "fetching ${GIT_URL}"
	git clone ${GIT_URL} streamlit_app
fi

cd streamlit_app

echo "installing packages"
pip3 install -r requirements.txt >/dev/null

echo "running app"
streamlit run streamlit_app.py
