#!/bin/bash

n=$2
w=1000
h=1000
u=$((w / n))
folderName="${1%.*}_tiles"
mkdir -p $folderName

echo "Cropping $1 into tiles..."

vpype \
   begin \
    repeat %$n*$n% \
    read -l new $1 \
    scaleto 1000 1000 \
    layout 1000x1000 \
    crop %_i%%$n*$u% "%floor(_i/$n)*$u%" $u $u \
    rect --layer "%_i+1%" %_i%%$n*$u% "%floor(_i/$n)*$u%" $u $u \
    end \
    forlayer layout "$u"x"$u" write "$folderName/%_lid%.svg" \
    end \

echo "Number of tiles created: $(find "$folderName" -type f | wc -l)" 
echo "Shuffling the list of files..."
files=($(shuf -e "$folderName"/*.svg))

for i in "${!files[@]}"; do
   mv "${files[$i]}" "$folderName/a$(printf '%02d' $i).svg"
done

vpype \
   eval "files=glob('$folderName/*.svg')" \
   grid -o $u $u $n $n \
   read --no-fail "%files[_i] if _i < len(files) else ''%" \
   rotate %_i*90% \
   rect 0 0 $u $u \
   scaleto %$u*.9% %$u*.9% \
   end \
   layout -m %$u*.1% 1000x1000 \
   write ${1%.*}_shuffled.svg

rm -r $folderName   
echo "Shuffled SVG file created: ${1%.*}_shuffled.svg"