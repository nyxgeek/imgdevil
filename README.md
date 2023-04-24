# imgdevil
quick and dirty proof-of-concept to hide shells in images


## overview

*This code is rough. It is strictly to demonstrate.*


There are two files:

* imgdevil.ps1 -- contains both encoder and decoder. **DOES NOT EXECUTE ON ITS OWN**
* imgdevil_decoder_only.p1 --  the decoder + invoke-expression to run. **!! THIS WILL CREATE A SHELL !!**



### encoding
To encode an image, there are a few spots you will need to manually update in the script.

```
$originalimagepath = "C:\Users\nyxgeek\Desktop\kilroy500.png"
```
and
```
$inputpowershellpath = "C:\Users\nyxgeek\Desktop\bindshell_one-liner.ps1"
```

The rest of the paths are local, and will write out to the local directory.


&nbsp; 
### decoding
To decode an image, only one line needs to be changed:

```
$webpath = "https://pbs.twimg.com/media/DUUb7yQVQAEGZDp.png"
```

by default, this points to an encoded bind shell on port 443.


&nbsp;

&nbsp;

See the original blog post for more information: 
