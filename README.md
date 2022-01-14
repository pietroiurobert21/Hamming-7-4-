# Hamming-7-4-
Hamming code for 4 given bits

.............................

;bitii cititi sunt {A1 A2 A3 A4}

;matricea noastra va avea 4 linii, 7 coloane si ar trebui sa arate astfel:
		
		; 0   0   0   0   0   0   0
		; 0   0   0   1   1   1   1
		; 0   1   1   0   0   1   1
		; 1   0   1   0   1   0   1
		;____________________________
		; p1  p2  A1  p3  A2  A3  A4
		
		; "teorema" ne spune ca va trebui sa inmultim matricea cu vectorul coloana v={p1,p2,A1,p3,A2,A3,A4}
		
		; practic va rezulta un alt vector coloana de forma 
		; k:{
		; 		0 
		; 		p3*1 + A2*1 + A3*1 + A4*1
		;	 	p2*1 + A1*1 + A3*1 + A4*1
		; 		p1*1 + A1*1 + A2*1 + A4*1
		;	}
		
		; ACUM urmeaza sa fac toate sumele prezentate mai sus si sa verific paritatile acestora, pentru a afla fiecare bit de paritate P
