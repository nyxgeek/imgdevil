# imgdevil
# 2017 - @nyxgeek / YOLO - TrustedSec
# 


function readIMGDevil($Path){

        $tempString = ""

            echo "bitmap is $($bitmap.width) pixels wide"
 
            Foreach($y in (0..($BitMap.Height-1))) 
            { 
                Foreach($x in (1..($BitMap.Width-1))) 
                { 
                    $Pixel = $BitMap.GetPixel($X,$Y)
                    
                    #$Pixel.name
                    #echo "values are: $($pixel.R.tostring()) $($pixel.G.ToString()) $($pixel.b.ToString())" 
                    $pixelValue = "$($pixel.R.tostring())"
                    $alphaValue = "$($pixel.A.toString())"
                    echo "Testing $X, $Y - A: $alphaValue - R: $pixelValue - $([char]([convert]::toint16($pixelValue)))"

                    # LOOK FOR OUR END OF FILE INDICATOR
                    # we will set out terminating char by changing alpha to be 42 and R to be 42
                    if ( ([int]$pixelValue -eq 42) -And ( "$alphaValue"-eq "42" ) ){
                        echo "FOUND OUR TERMINATOR"
                        echo ""
                        #echo "Pixel is $pixelValue"
                        return $tempString
                    }

                    #after we've checked for our terminator, then make the addition
                    $tempstring+="$([char]([convert]::toint16($pixelValue)))"


                }
            } 
	}         



function writeIMGDevil($InputString, $Outputfilepath){

$width=$bitmap.width
echo "width is $width"

echo "Going to encode $inputstring"

$inputlist = $InputString.ToCharArray()
echo "Inputlist is $inputlist"

$colnumber=1
$rownumber=0

foreach ($char in $inputlist){

    [int]$decnumber = $([int][char]$char)
    #echo "inputlist item: $decnumber,  col is $colnumber, rownumber is $rownumber"
    $BitMap.SetPixel($colnumber,$rownumber,[System.Drawing.Color]::FromArgb("$decnumber",128,128))

    if (  $colnumber -eq $($width-1) ){
        #echo "modulus condition triggered for $colnumber"
        $rownumber+=1
        $colnumber = 0
    }
    $colnumber+=1

}

#stamp our terminator key
$BitMap.SetPixel($colnumber,$rownumber,[System.Drawing.Color]::FromArgb(42,42,128,128))

}






$BitMap = $null
[void][reflection.assembly]::loadwithpartialname("system.drawing")
$originalimagepath = "C:\Users\nyxgeek\Desktop\kilroy500.png"
$BitMap = [System.Drawing.Bitmap]::FromFile((Get-Item $originalimagepath).fullname)

echo "Going to encode the following string into a bitmap as the Red value"
echo "Then this will write it to a file"


$inputpowershellpath = "C:\Users\nyxgeek\Desktop\bindshell_one-liner.ps1"
$inputstring = Get-Content -Path $inputpowershellpath | Out-String

writeIMGDevil "$inputstring" "testfile"

echo "---------------------------------------------------"
echo "reading back the first four pixels"

"$($BitMap.GetPixel(0,0))"
"$($BitMap.GetPixel(1,0))"
"$($BitMap.GetPixel(2,0))"
"$($BitMap.GetPixel(3,0))"

echo "---------------------------------------------------"



echo "attempting to save bitmap to outputfile"

$BitMap.Save("imagedevil_output-500.png","PNG")

echo "Done"
echo "---------------------------------------------------"
echo ""
echo "Reading back in the file we just wrote:"
readIMGDevil "imagedevil_output-500.png"


echo ""
echo "DONE"