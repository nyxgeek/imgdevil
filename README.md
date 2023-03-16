# imgdevil
quick and dirty proof-of-concept to hide shells in images


## overview

*This code is rough*. It is strictly to demonstrate.*


There are two files:

* imgdevil.ps1 -- contains both encoder and decoder
* imgdevil_decoder.p1 -- just the decoder



To encode an image, there are a few spots you will need to manually update in the script.

```
$originalimagepath = "C:\Users\nyxgeek\Desktop\kilroy500.png"
```
and
```
$inputpowershellpath = "C:\Users\nyxgeek\Desktop\bindshell_one-liner.ps1"
```

The rest of the paths are local, and will write out to the local directory.




See the original blog post for more information: 
