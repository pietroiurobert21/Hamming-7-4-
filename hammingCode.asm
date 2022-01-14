.model small

.stack 200h

.data
	suma   db   0		; variabila suma o folosesc ca sa vad ce valoare va avea bitul de paritate (adica daca suma este para, va afisa 0 si 1 in caz contrar)
	doi    db   2		; variabila doi o folosesc pentru verificarea paritatii fiecarei sume de biti (adica impart suma la 2 si verific restul)
	
	mesaj db 'Codul Hamming este: $'
	
	;cei 4 biti cititi
	A1 db 0	
	A2 db 0
	A3 db 0 
	A4 db 0
	
.code
	start:
		mov ax, @data
		mov ds, ax
		
			xor bl, bl
			mov cl, 10
			xor dx, dx
	
				citireNr:
					mov ah,01h
					int 21h
					cmp al,13
					je amTerminat
					mov ah, 0
					sub al, 48
					push ax
					mov bl, al
					mov al, dl
					mul cl
					add ax, bx
					mov dx, ax
					jmp citireNr
				
				amTerminat:

				pop ax
				mov A4, al

				pop ax
				mov A3, al

				pop ax
				mov A2, al
		
				pop ax
				mov A1, al		
		
		mov dx, offset mesaj
		mov ah, 09h
		int 21h
		
		;bitParitate1
		
				mov bl, A1
				add suma, bl
				mov bl, A2
				add suma, bl
				mov bl, A4
				add suma, bl
		
				mov al, suma
				mov ah, 0		
				div doi			
				
				call paritate		
		;bitParitate2
				mov suma, 0
				
				mov bl, A1
				add suma, bl
				mov bl, A3
				add suma, bl
				mov bl, A4
				add suma, bl
		
				mov al, suma
				mov ah, 0		
				div doi			
				
				call paritate
		;bit1
			mov dl, A1
			call usefulBit

		;bitParitate3
				mov suma, 0
		
				mov bl, A2
				add suma, bl
				mov bl, A3
				add suma, bl
				mov bl, A4
				add suma, bl
		
				mov al, suma
				mov ah, 0		
				div doi			
				
				call paritate
		
		;bit2
			mov dl, A2
			call usefulBit
		;bit3
			mov dl, A3	
			call usefulBit
		;bit4
			mov dl, A4
			call usefulBit

		jmp Fin
			
		usefulBit proc
			add dl, 48
			mov ah, 02h
			int 21h
		endp
		ret
		
			paritate proc		
				cmp ah, 0		;vedem daca (suma%2==0)
				je estePar
				jmp nuEstePar

				estePar:
					mov dl, '0'
					mov ah, 02h
					int 21h
					jmp stop
				nuEstePar:
					mov dl, '1'
					mov ah, 02h
					int 21h
					jmp stop
					stop:
				endp
				ret	
		Fin:
		mov ah, 4ch
		int 21h
	end
