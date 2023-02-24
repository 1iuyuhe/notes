#!/bin/bash
function rand() {
        min=$1
        max=$(($2-$min+1))
        num=$(date +%s%N)
        echo $(($num%$max+$min))
}

function get_emoji() {
	emoji_list=("😘" "🎉" "🎂" "🥳" "🎈" "🎊" "🎁" "🧁" "🥂" "🍰" "🪅" "🎆" "🤩" "🌼" "🌷" "🍨" "💗")
	i=$(rand 0 len-1)
	echo ${emoji_list[$i]}
}
emoji=$(get_emoji)
echo "--------"
git add .
git commit -m "$emoji: $(date '+%Y-%m-%d %T')"
git push
echo "--------"
