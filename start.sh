tracker_list=$(curl -Ns https://raw.githubusercontent.com/XIU2/TrackersListCollection/master/all.txt https://ngosang.github.io/trackerslist/trackers_all_http.txt https://newtrackon.com/api/all https://raw.githubusercontent.com/DeSireFire/animeTrackerList/master/AT_all.txt https://raw.githubusercontent.com/hezhijie0327/Trackerslist/main/trackerslist_tracker.txt https://raw.githubusercontent.com/hezhijie0327/Trackerslist/main/trackerslist_exclude.txt | awk '$0' | tr '\n\n' ',')
export tracker="[$tracker_list]"
if [[ -n $TOKEN_PICKLE_URL ]]; then
	wget -q $TOKEN_PICKLE_URL -O /usr/src/app/token.pickle
fi

if [[ -n $ACCOUNTS_ZIP_URL ]]; then
	wget -q $ACCOUNTS_ZIP_URL -O /usr/src/app/accounts.zip
	unzip accounts.zip -d /usr/src/app/accounts
	rm accounts.zip
fi

./aria.sh; python3 -m bot
