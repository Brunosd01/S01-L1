10 INPUT "valor do numero: "; a
20 IF a < 78 THEN GOTO 400
30 IF a > 78 THEN GOTO 440
40 IF a = 78 THEN GOTO 490


400 PRINT "o número e maior!"
410 INPUT "valor do numero: ";a
420 GOTO 20

440 PRINT "o número e menor!"
450 INPUT "valor do numero: ";a
460 GOTO 20

490 PRINT "muito bom, o número correto é o 78!" 
500 END
