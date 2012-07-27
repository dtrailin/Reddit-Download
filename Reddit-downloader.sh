function name {
if [ -a ~/reddit ]
then
mv ~/reddit ~/RedditDownloader
fi
}
function RedditDir {
if [ -d ~/reddit ]
then
cd ~/reddit
else
mkdir ~/reddit
cd ~/reddit
fi
} 
function readReddit {
echo "what subreddit do you want?"
read reddit
}
function GetLinks {
wget -q reddit.com/r/$reddit.rss
grep -o  imgur.com/..... $reddit.rss > links.txt
grep -o  qkme.me/...... $reddit.rss > memes.txt
rm $reddit.rss
}
function subdir {
if [ -d $reddit[`date +%e-%m-%y-%R`]  ]
then 
echo "Woah, slow down there. Wait a minute before you download again"
sleep 1
exit
else
mkdir $reddit"["`date +%e-%m-%y-%R`"]"
cd $reddit[`date +%e-%m-%y-%R`]
fi
}
function  GetImg {
COUNTER=0
cat links.txt | while read line; do 
  let COUNTER=COUNTER+1 
 wget -q  $line.gif
echo "getting image" $COUNTER
done
COUNTERX=0
cat memes.txt | while read line; do 
  let COUNTERX=COUNTERX+1 
 wget -q  i.$line.jpg
echo "getting meme" $COUNTERX
done
rm links.txt
rm memes.txt
}
function main {
name
RedditDir
long=$USERNAME
short=${long:0:1}
echo "Welcome" "${short^^}""${long:1}" "to Denis' Reddit downloading script!"
readReddit
subdir
GetLinks
GetImg
}
main
