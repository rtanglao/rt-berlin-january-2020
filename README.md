# rt-berlin-january-2020
swag from berlin photos from berlin all hands january 2020

## 09february2020

* 1\. how to crop an image to 75x75
  * 2000, 2000 is the offset from top left (gleaned from [How to crop an image using imagemagick from the command line?](https://superuser.com/questions/1161340/how-to-crop-an-image-using-imagemagick-from-the-command-line))
  * ```magick``` replaces ```convert -crop``` in imagemagick 7


```bash
magick dsc_3671_49469147273_o.jpg -crop 75x75+2000+2000 +repage croptest.jpg
```

* 2\. use pixel_x_dimension and pixel_y_dimension from https://github.com/tonytonyjan/exif get width and height
