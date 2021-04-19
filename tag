#!/bin/bash

# install this script in $HOME/.local/bin/ or /usr/bin/

MESSAGE=$1
MAJOR_VERSION=(0 0 0)
NEW_TAG=""
RED='\033[0;31m'
NC='\033[0m'

echo "Tagging repo"

if [[ -z "$MESSAGE" ]]
then
	echo -e "${RED}Please provide tag message${NC}"
	exit
fi

if [[ -n $2 ]]
then
	echo -e "${RED}Unknown parameter $2${NC}"
	exit
fi

# Check if working directory is clean to prevent conflicts
if [[ $(git status) != *"working tree clean"* ]]
then
	echo -e "${RED}Your working directory is not clean please stash your changes before tagging${NC}"
	exit
fi

git checkout master &> /dev/null
echo "Checked out master branch"
git pull origin &> /dev/null
echo "Pulled origin"
TAGS=`git tag`

while read -r TAG; do
	if [[ $TAG =~ v([0-9]+)\.([0-9]+)\.([0-9]+) ]]
	then
		if [[ ${BASH_REMATCH[1]} -ge ${MAJOR_VERSION[0]} ]]
		then
			if [[ ${BASH_REMATCH[1]} -gt ${MAJOR_VERSION[0]} ]]
			then
				MAJOR_VERSION[1]=0
				MAJOR_VERSION[2]=0
			fi
			MAJOR_VERSION[0]=${BASH_REMATCH[1]}
			if [[ ${BASH_REMATCH[2]} -ge ${MAJOR_VERSION[1]} ]]
			then
				if [[ ${BASH_REMATCH[2]} -gt ${MAJOR_VERSION[1]} ]]
				then
					MAJOR_VERSION[2]=0
				fi
				MAJOR_VERSION[1]=${BASH_REMATCH[2]}
				if [[ ${BASH_REMATCH[3]} -ge ${MAJOR_VERSION[2]} ]]
				then
					MAJOR_VERSION[2]=${BASH_REMATCH[3]}
				fi
			fi
		fi
	fi
done <<< "$TAGS"

echo "Last version is ${MAJOR_VERSION[@]}"
NEW_TAG="v${MAJOR_VERSION[0]}.${MAJOR_VERSION[1]}.$((MAJOR_VERSION[2]+1))"
echo "Tagging version $NEW_TAG"
git tag -a -m "$MESSAGE" $NEW_TAG &> /dev/null
git push origin $NEW_TAG

