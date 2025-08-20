10 INPUT "NOTA 1"; np1
20 INPUT "NOTA 2"; np2
30 media1 = (VAL(np1)+ VAL(np2))/2
40 IF media1 >= 60 THEN GOTO 250 
50 IF media1 <= 30 THEN GOTO 270 

60 PRINT "fazer a np3"
70 INPUT "NOTA 3"; np3
80 media2 = (VAL(media1) + VAL(np3))/2
90 IF media2 >= 50 THEN GOTO 300 
100 IF media1 < 50 THEN GOTO 320
  
  
250 PRINT "Aprovado direto" 
260 GOTO 400 
270 PRINT "Reprovado direto" 
280 GOTO 400 

300 PRINT "Aprovado pela NP3"
310 GOTO 400
320 PRINT "Reprovado na NP3"
330 GOTO 400
  
400 END
