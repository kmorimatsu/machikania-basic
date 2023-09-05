useclass JSON,WGET
usevar Min0,Max0,Fnum0,Fstr0
usevar Min1,Max1,Fnum1,Fstr1

out 6,1

if val(strftime$("%Y"))<2023 then ntp

j$=WGET::FORSTRING$("http://www.recfor.net/projects/weather/tokyo.php")
o=new(JSON,j$)

Min0=int(o.FQUERY#(".DailyForecasts[0].Temperature.Minimum.Value")+0.5)
Max0=int(o.FQUERY#(".DailyForecasts[0].Temperature.Maximum.Value")+0.5)
Fnum0=o.IQUERY(".DailyForecasts[0].Day.Icon")
Fstr0$=o.SQUERY$(".DailyForecasts[0].Day.IconPhrase")
Min1=int(o.FQUERY#(".DailyForecasts[1].Temperature.Minimum.Value")+0.5)
Max1=int(o.FQUERY#(".DailyForecasts[1].Temperature.Maximum.Value")+0.5)
Fnum1=o.IQUERY(".DailyForecasts[1].Day.Icon")
Fstr1$=o.SQUERY$(".DailyForecasts[1].Day.IconPhrase")

do
  c=coretimer()
  
  setdir "/wavjp"
  out 6,0
  gosub pwaveb,"phrase1.wav"
  gosub pwaveb,"month"+dec$(val(strftime$("%m")))+".wav"
  gosub pwaveb,"day"+dec$(val(strftime$("%d")))+".wav"
  gosub pwaveb,"week"+strftime$("%a")+".wav"
  gosub pwaveb,"phrase2.wav"
  gosub pwaveb,"weath"+dec$(Fnum0)+".wav"
  gosub pwaveb,"phrase3.wav"
  gosub pwaveb,"phrase5.wav"
  gosub pwaveb,dec$(Max0)+"deg.wav"
  gosub pwaveb,"phrase4.wav"
  gosub pwaveb,"weath"+dec$(Fnum1)+".wav"
  gosub pwaveb,"phrase3.wav"
  gosub pwaveb,"phrase6.wav"
  gosub pwaveb,dec$(Min1)+"deg.wav"
  gosub pwaveb,"phrase7.wav"
  gosub pwaveb,dec$(Max1)+"deg.wav"
  out 6,1
  
  do until 60000000<coretimer()-c : idle :loop
loop

label pwaveb
  print args$(1);
  PLAYWAVE args$(1)
  print " ... ";
  do while playwave(0)
    idle
  loop
  print "done"
return
