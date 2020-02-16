# rt-berlin-january-2020
swag from berlin photos from berlin all hands january 2020

## 15february2020 get average color of patches

* 1\. get average color

a) first get filenames of the patches

```bash
ls -d /home/rtanglao/GIT/rt-berlin-january-2020/75PX_BY_75PX_PATCHES/*.jpg  \
> berlin_jan2020_75x75_jpg_filenames.txt
```

b) then get average color of the patches

```bash
cat berlin_jan2020_75x75_jpg_filenames.txt  | \
../print-file-colorname-hex-color.rb > berlin_jan2020_file_colorname_hexcolor.csv
```

c) to get an idea of the number of each colour, cut out the'file' field which is unique

```bash
mlr --csv cut -x -f 'file' *.csv | more
```

d) create a file with just the red filenames, no colour or hex colour fields

```bash
mlr --csv --implicit-csv-header --headerless-csv-output \
cut -f 1 red-berlin-january2020.txt > just-red-files-berlin-january2020.txt
```

## 09february2020

* 1\. how to crop an image to 75x75
  * 2000, 2000 is the offset from top left (gleaned from [How to crop an image using imagemagick from the command line?](https://superuser.com/questions/1161340/how-to-crop-an-image-using-imagemagick-from-the-command-line))
  * ```magick``` replaces ```convert -crop``` in imagemagick 7


```bash
magick dsc_3671_49469147273_o.jpg -crop 75x75+2000+2000 +repage croptest.jpg
```

* 2\. use pixel_x_dimension and pixel_y_dimension from https://github.com/tonytonyjan/exif get width and height

* 3\. use this file list:

```bash
ls -d /mnt/c/Users/rtang/Pictures/23-31JANUARY2020-BERLIN-ALL_HANDS/*.jpg > berlin_jpg_filenames.txt
```

* 4\. Create CSV file with max x and max y for 75 pixel by 75 pixel

```bash
/print-file-width-length-max75-x-max75-y.rb berlin_jpg_filenames.txt > berlin-75px-75px-max-x-maxy.txt
```

* 5\. Create 1000 75px by 75 px patches. Maybe do 1000 at a time for a total of 10,000

```bash
mkdir 75PX_BY_75PX_PATCHES
cd !$
../create-75px-75px-patches.rb ../berlin-75px-75px-max-x-maxy.txt 1000
../create-75px-75px-patches.rb ../berlin-75px-75px-max-x-maxy.txt 9000
```
