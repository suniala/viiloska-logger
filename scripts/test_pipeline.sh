#!/bin/bash

echo "Device 18448 should pass, location should be as 6 eteiskomero"
curl -d "key=asdf&type=1&id=18448&value=34.56" http://localhost:8080
echo

echo "Device 54321 should not pass"
curl -d "key=asdf&type=1&id=54321&value=1234.56" http://localhost:8080
echo

echo "Device 11002 should pass, location should be lämminvesivaraaja"
curl -d "key=asdf&type=1&id=11002&value=12" http://localhost:8080
echo

echo "Device 11002 should not pass due to invalid key"
curl -d "key=qwer&type=1&id=11002&value=12" http://localhost:8080
echo
