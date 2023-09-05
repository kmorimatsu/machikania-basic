<?php

$filepre='weath';
$filepost='.wav';
$num=1;

$wav=file_get_contents('./weather.wav');
$head=substr($wav,0,0x2c);
$body=substr($wav,0x2c);
$len=strlen($body);

for($i=0;$i<$len;$i++){
	// Skip while silence
	if (0x7f<=ord($body[$i]) && ord($body[$i])<=0x81) continue;
	$wav2=$head;
	$silent=0;
	while($i<$len){
		$wav2.=$body[$i++];
		// End with silence for more than 0.1 second
		if (0x7f<=ord($body[$i]) && ord($body[$i])<=0x81) {
			$silent++;
			if (1600<=$silent) break;
		} else {
			$silent=0;
		}
	}
	$fname="./$filepre$num$filepost";
	if (file_exists($fname)) exit("$fname exists!");
	file_put_contents($fname,$wav2);
	echo "$fname\n";
	$num++;
}
