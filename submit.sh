#!/bin/bash
function get_emoji() {
	emoji_list=("😘" "🎉" "🎂" "🥳" "🎈" "🎊" "🎁" "🧁" "🥂" "🍰" "🪅" "🎆" "🤩" "🌼" "🌷" "🍨" "💗")
	num=$(date '+%S')
	len=${#emoji_list[@]}
	index=$((num % len))
	echo ${emoji_list[$index]}
}
emoji=$(get_emoji)
#echo "$emoji"
echo "--------"
git add .
git commit -m "$emoji: $(date '+%Y-%m-%d %T')"
git push
echo "--------"
