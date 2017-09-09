#!/bin/bash

partfrom=${PART_FROM:-1}
partto=${PART_TO:-30}

if [ $partfrom -eq 1 ]; then
  page=0
else
  page=$[(partfrom-1)*20+1]
fi

function pageout() {
  pg=$1
  pt=$2
  cat page.tex | sed "s/PAGE/$pg/" | sed "s/PART/$pt/"
}

function partout() {
  pt=$1
  cat partheader.tex | sed "s/PART/$pt/"
}

echo "\\setcounter{page}{$[page+1]}"

for part in `seq $partfrom $partto`; do
  partout $part
  [ $part -eq 1 ] && pageout 1 $part && page=1

  # gen 20 pages
  for i in `seq 1 20`; do
    pageout $[page+i] $part
  done

  page=$[page+20]
done

if [ $part -eq 30 ]; then
  # finally gen 3 pages
  for page in 602 603 604; do
    pageout $page $part
  done
fi

