echo "HEALTH_STATUS: $HEALTH_STATUS"
echo "GITHUB_TOKEN: $GH_TOKEN"
 
if [[ $HEALTH_STATUS == *"failed"* ]]; then
  curl \
    -X POST \
    -H "authorization: Bearer $GH_TOKEN" \
    -H "Accept: application/vnd.github.v3+json" \
    https://api.github.com/repos/xyzuan/status/issues \
    -d '{"title":"Website is down","body":"'$HEALTH_STATUS'","labels":["failed"]}'
fi

