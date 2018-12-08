.model small
include 'emu8086.inc'
.stack 100h
.data
   count dw ?
password db 'password'
exam dw ?
len equ ($-password)
arr dw 01,02,03
msg11 db 10,13,'enter your password: $'
msg12 db 10,13,'Welcome to Online Examination!!$'
msg2 db 10,13,'NOTE : $'
msg3 db '*. For Every Correct answer you will get 1 mark.$'
msg4 db '*. For Every Wrong answer 2 mark will cut from your total mark.$' 
msg14 db 10,13,'ur total exam duration is 30 minutes: $' 
msg52 db 10,13,'Logged in Successfully$'
msg16 db 10,13,'1.MATHS 2.ENGLISH $'
msg15 db 10,13,'please choose ur subject: $'
msg5 db 'Press Enter to start the exam : $'
msg22 db 'No of questions you have attended is :$'
msg8 db 'You have successfully completed your exam.$'
msg9 db 'Your Total obtained mark is : $'
msg10 db 'Press 1 to Re-attempt test or 0 to Exit.$' 
msg111 db '                    ***Thank you.! ***$'

en1 db '1. palindrome word in the following option$' 
qae1 db '   a) malayalam    b) sir    c) apple$'
en2 db '2.people who work together$'
qae2 db ' a>worker b>superhuman c>colleagues$'
en3 db '3.people who goes on foot$'
qae3 db ' a>machination b>eccentric c>pedestrian$'
en4 db '4.one who can speak two languages$'
qae4 db ' a>bilingual b>polylingual c>polygamy$'
en5 db '5.words with same meaning$'
qae5 db ' a>synonym b>antonym c>noun$'
en6 db '6.the person who works for free$'
qae6 db ' a>volunteer b>servant c>organiser$'
en7 db '7.one who speaks less$'
qae7 db ' a>reticent b>hypocrite c>obsolete$'
en8 db '8.one who knows everything$'
qae8 db ' a>vandal b>egoist c>omniscient$' 
en9 db '9.life written by oneself$'
qae9 db ' a>biography b>autobiography c>story$'
en10 db '10.words with opposite meaning$'
qae10 db ' a>synonym b>antonym c>noun$'   

q1 db '1. which one of this is not a prime number$'
qa1 db '   a) 91    b) 61    c) 81$'
q2 db '2. which one of the following is a prime number$'
qa2 db '   a) 33    b) 97    c) 93$'
q3 db '3. (112 x 54) = ?$'
qa3 db '   a) 70000    b) 35718    c) 31257$'
q4 db '4. the largest 4 digit number exactly divisible by 88 is$'
qa4 db '   a) 9944    b) 9768    c) 9988$'
q5 db '5. the sum of first five prime numbers is$'
qa5 db '   a) 28    b) 26    c) 11$'
q6 db '6. the smallest 3 digit prime number is$'
qa6 db '   a) 103    b) 105    c) 101$'
q7 db '7. the sum of first 45 natural numbers is$'
qa7 db '   a) 1280    b) 1035    c) 2104$'
q8 db '8. 8597 - ? = 7429 - 4358$'
qa8 db '   a) 4320    b) 5476    c) 5526$'
q9 db '9. -84 x 29 + 365 = ?   $'
qa9 db '   a) -2071    b) -2471    c) -1096$'
q10 db '10. the smallest prime number is$'
qa10 db '   a) 2    b) 1    c) 3$'
msg13 db 10,13,'incorrect password!$'
new db 10,13,'$'
inst db 10 dup(0) 
name dw 0
a dw ?
b dw ?
.code 
start1:
mov ax,data
mov ds,ax

a3:
lea si,arr
call pthis
db 10,13,"Enter your roll no",0
call scan_num
mov ax,cx
mov cx,5
a2:
mov bx,[si]   
mov a,ax
mov b,bx
cmp ax,bx   

je a1
inc si
dec cx
jnz a2
call pthis
db 10,13,"Invalid rollno",0 
jmp a3

a1:
lea dx,msg11
mov ah,09h
int 21h
mov si,00
up1:
mov ah,08h
int 21h
cmp al,0dh
je down
mov [inst+si],al
mov dl,'*'
mov ah,02h
int 21h
inc si
jmp up1
down:
mov bx,00
mov cx,len
check:
mov al,[inst+bx]
mov dl,[password+bx]
cmp al,dl
jne fail
inc bx
loop check
lea dx,msg52
mov ah,009h
int 21h
call clear_screen
lea dx,msg12
mov ah,009h
int 21h
jmp finish
fail:
lea dx,msg13
mov ah,009h
int 21h
hlt                                                                                               
finish:
mov ah,009h
int 21h


    mov ax,@data
	mov ds,ax
	
	lea dx,msg14
	mov ah,9
	int 21h
    
	call nl
       
	lea dx,msg2
	mov ah,9
	int 21h
    
	call nl
    
	lea dx,msg3
	mov ah,9
	int 21h
    
    call nl
    
	lea dx,msg4
	mov ah,9
	int 21h
	 
	call nl
	call clear_screen
	
	lea dx,msg16
	mov ah,9
	int 21h
	
	call nl
	
	
	start2:
	mov bl, 0
	call nl
	
	lea dx,msg15
	mov ah,9
	int 21h
    
	
	
	
	mov ah,1
	int 21h
      
      
	cmp al, 31h
	je qsn1
	cmp al, 2
	jnz qen1 
	jne start2
	
	qen1:
	call nl
	lea dx,en1
	mov ah,9
	int 21h 
	
	call nl
	inc count
	
	lea dx,qae1
	mov ah,9
	int 21h
	
	call nl
	call count2
	call nl 

    
	mov ah, 1
	int 21h 
	cmp al,41h
	je  invalid
	cmp al,42h
	je invalid
	cmp al,43h
	je invalid 
	
	cmp al, 'a' 
	je qen2 
    jne qenw2
    invalid:
    call pthis
    db 10,13,"Ivalid option",0
    dec count
	jmp qen1
	qsn1:
	call nl
    
	lea dx,q1
	mov ah,9
	int 21h
	
	call nl 
	inc count
    
	lea dx,qa1
	mov ah,9
	int 21h
	
	call nl
	call count2
	call nl 
	
    
	mov ah, 1
	int 21h
	cmp al,41h
	je  invalid1
	cmp al,42h
	je invalid1
	cmp al,43h
	je invalid1
	

	
	cmp al, 'a'
	je qsn2
	jne qsnw2 
	invalid1:
    call pthis
    db 10,13,"Ivalid option",0 
    dec count
	jmp qsn1
	
	qen2:
      call nl
    inc bl
	call nl

	call quen2
	call input
	cmp al,41h
	je  invalid12
	cmp al,42h
	je invalid12
	cmp al,43h
	je invalid12
	
	
	cmp al, 0dh
	call pthis
	db 10,13,"U DIDNT ANSWER THE QUESTION",0
	dec bl
	jmp qen3 
	

	cmp al, 'c'
	je qen3
	jne qsnw3
	invalid12:
    call pthis
    db 10,13,"Ivalid option",0 
    dec count
	jmp qen2
	
	qsn2:
	call nl 
	
    inc bl
	call nl
    
	call qn2 
	
	call input
	cmp al,41h
	je  invalid11
	cmp al,42h
	je invalid11
	cmp al,43h
	je invalid11 
	
	cmp al, 0dh
	call pthis
	db 10,13,"U DIDNT ANSWER THE QUESTION",0
	dec bl
	jmp qsn3
	
	
	cmp al, 62h
	je qsn3
	jne qsnw3 
	invalid11:
    call pthis
    db 10,13,"Ivalid option",0 
    dec count
	jmp qsn2
	
	
	
	qenw2:
	 call nl  
	 
     dec bl
	 call nl
    
	call quen2 
	call input
	
	cmp al, 'c'
	je qen3 
	jne qenw3 
	
	qsnw2:
	call nl
	
    dec bl
	call nl
    
	call qn2 
	call input
	
	cmp al, 'b'
	je qsn3 
	jne qsnw3  
	qen3:
	call nl
    

	
	inc bl
	call nl    

    
	call quen3 
	call input
	
	cmp al, 'c'
	je qen4
	jne qenw4  
	
	
	qsn3:
	call nl
 
	
	inc bl
	call nl    

    
	call qn3 
	call input
	
	cmp al, 'a'
	je qsn4
	jne qsnw4 
	
	qenw3:
	call nl
    

	
	dec bl
	call nl
    
	call quen3
	call input
	
	cmp al, 'c'
	je qen4 
	jne qenw4
	
	qsnw3:
	call nl
    
	
	dec bl
	call nl
    
	call qn3
	call input
	
	cmp al, 'a'
	je qsn4 
	jne qsnw4 
	
	qen4:
	call nl
  
	inc bl
	call nl
    
	call quen4 
	call input
	
	cmp al, 'a'
	je qen5
	jne qenw5
	

	
	qsn4:
	call nl
    
	
	inc bl
	call nl
    
	call qn4 
	call input
	
	cmp al, 'a'
	je qsn5
	jne qsnw5 
	qenw4:
	call nl
    
	dec bl
	call nl
    
	call quen4 
	call input
	
	cmp al, 'a'
	je qen5 
	jne qenw5

	qsnw4:
	call nl
   
	dec bl
	call nl
    
	call qn4 
	call input
	
	cmp al, 'b'
	je qsn5 
	jne qsnw5 
	
	qen5:
	call nl
 
	inc bl
	call nl
    
	call quen5 
	
	call input
	
	cmp al, 'a'
	je qen6
	jne qenw6
	
	qsn5:
	call nl
 
	inc bl
	call nl
    
	call qn5 
	
	call input
	
	cmp al, 'a'
	je qsn6
	jne qsnw6

	qenw5:
	call nl
    
	
	dec bl
	call nl
    
	call quen5
	call input
	
	cmp al, 'a'
	je qen6 
	jne qenw6 
	
	qsnw5:
	call nl
    
	
	dec bl
	call nl
    
	call qn5 
	call input
	
	cmp al, 'a'
	je qsn6 
	jne qsnw6 

	qen6:
	call nl

	
	inc bl
	call nl
    
	call quen6 
	
	call input
	
	cmp al, 'a'
	je qen7
	jne qenw7
	
	qsn6:
	call nl
 
	inc bl
	call nl
    
	call qn6 
	
	call input
	
	cmp al, 'c'
	je qsn7
	jne qsnw7 

	qenw6:
	call nl
  
	dec bl
	call nl
    
	call quen6 
	call input
	
	cmp al, 'a'
	je qen7
	jne qenw7
	
	qsnw6:
	call nl
  
	
	dec bl
	call nl
    
	call qn6 
	call input
	
	cmp al, 'c'
	je qsn7 
	jne qsnw7

	qen7:
	call nl
    
	
	
	inc bl
	call nl
    
	call quen7
	call input
	
	cmp al, 'a'
	je qen8
	jne qenw8
	
	qsn7:
	call nl
    

	inc bl
	call nl
    
	call qn7
	call input
	
	cmp al, 'b'
	je qsn8
	jne qsnw8 

	qenw7:
	call nl
    
	
	
	dec bl
	call nl
    
	call quen7 
	call input
	
	cmp al, 'a'
	je qen8 
	jne qenw8
	
	qsnw7:
	call nl
    
	
	
	dec bl
	call nl
    
	call qn7 
	call input
	
	cmp al, 'b'
	je qsn8 
	jne qsnw8

	qen8:
		call nl
    
	
	
	inc bl
	call nl
    
	call quen8 
	call input
	
	cmp al, 'c'
	je qen9
	jne qenw9
	
	qsn8:
	call nl
    
	
	
	inc bl
	call nl
    
	call qn8 
	call input
	
	cmp al, 'c'
	je qsn9
	jne qsnw9
	
	
	qenw8:
	call nl
    

	
	dec bl
	call nl
    
	call quen8 
	call input
	
	cmp al, 'c'
	je qen9 
	jne qenw9  
	qsnw8:
	
	call nl
    
	
	dec bl
	call nl
    
	call qn8 
	call input
	
	cmp al, 'c'
	je qsn9 
	jne qsnw9  

	qen9:
		call nl
    
	
	
	inc bl
	call nl
    
	call quen9 
	call input
	
	cmp al, 'b'
	je qen10
	jne qenw10
	
	qsn9:
	call nl
    

	
	inc bl
	call nl
    
	call qn9 
	call input
	
	cmp al, 'a'
	je qsn10
	jne qsnw10  
	 
	qenw9:
	call nl
    
	
	
	dec bl
	call nl
    
	call quen9 
	call input
	
	cmp al, 'b'
	je qen10 
	jne qenw10
	
	qsnw9:
	call nl
    
	
	dec bl
	call nl
    
	call qn9 
	call input
	
	cmp al, 'a'
	je qsn10 
	jne qsnw10

	qen10:
	call nl
    

	inc bl
	call nl
    
	call quen10 
	call input
	
	cmp al, 'b'
	je exit
	jne exitw
	
	qsn10:
	call nl
    
	inc bl
	call nl
    
	call qn10 
	call input
	 
	
	
	cmp al, 'a'
	
	je exit
	jne exitw
	
	qenw10:
	call nl

	dec bl
	call nl
    
	call quen10 
	call input
	
	cmp al, 'b'
	je exit
	jne exitw 
	
	qsnw10:
	call nl
    

	dec bl
	call nl
    
	call qn10 
	call input
	
	cmp al, 'a'
	je exit 
	jne exitw 
	 
	
	exit:
	call nl 
    

	inc bl
	call nl
	call nl
    
	lea dx,msg8
	mov ah,9
	int 21h
	
	call nl
    
	lea dx,msg9
	mov ah,9
	int 21h
	
	add bl, 48
	
	cmp bl,57
	jg ten
	mov ah, 2
	mov dl, bl
	int 21h
	jmp exit1
	
	exitw:
	call nl
   
	
	dec bl
	call nl
	call nl  

    
	lea dx,msg8
	mov ah,9
	int 21h 
	
	call nl
    call nl
    
	lea dx,msg9
	mov ah,9
	int 21h
	
	add bl,48
	mov ah,2
	mov dl, bl
	int 21h
	
	jmp exit1
	
	ten:
	mov ah,2
	mov dl,"1"
	int 21h  
	mov dl,"0"
	int 21h
	jmp exit1
	
	nl: 
	mov ah,2
	mov dl, 0ah
	int 21h   
    mov dl, 0dh
    int 21h
    ret
    
 
	quen2:
	lea dx,en2
	mov ah,9
	int 21h
	call nl
	inc count
	lea dx,qae2
	mov ah,9
	int 21h
	call count2
	ret 
    
    qn2:
    lea dx,q2
	mov ah,9
	int 21h
	call nl
    inc count
	lea dx,qa2
	mov ah,9
	int 21h
	call count2
	ret
	 
	quen3:
	lea dx,en3
	mov ah,9
	int 21h
	
	call nl
    inc count
	lea dx,qae3
	mov ah,9
	int 21h 
	call count2
	ret  
	
	qn3:
    lea dx,q3
	mov ah,9
	int 21h
	call nl
	inc count
    lea dx,qa3
	mov ah,9
	int 21h
	call count2
	ret      

	quen4:
	lea dx,en4
	mov ah,9
	int 21h
	
	call nl
	inc count
    
	lea dx,qae4
	mov ah,9
	int 21h
	call count2
	ret  
	
	qn4:
    lea dx,q4
	mov ah,9
	int 21h
	
	call nl    
	inc count
    
	lea dx,qa4
	mov ah,9
	int 21h  
	call count2
	ret

	quen5:
	lea dx,en5
	mov ah,9
	int 21h
	
	call nl 
	inc count
    
	lea dx,qae5
	mov ah,9
	int 21h
	call count2
	ret 
	
	qn5:
    lea dx,q5
	mov ah,9
	int 21h
	
	call nl    
	inc count
    
	lea dx,qa5
	mov ah,9
	int 21h
	call count2
	ret 
	
	quen6:
	lea dx,en6
	mov ah,9
	int 21h
	
	call nl   
	inc count
    
	lea dx,qae6
	mov ah,9
	int 21h
	call count2
	ret 
	qn6:
    lea dx,q6
	mov ah,9
	int 21h
	
	call nl    
	inc count
    
	lea dx,qa6
	mov ah,9
	int 21h
	call count2
	ret 

	quen7:
	lea dx,en7
	mov ah,9
	int 21h
	
	call nl 
	inc count
    
	lea dx,qae7
	mov ah,9
	int 21h
	call count2
	ret 
	
	qn7:
    lea dx,q7
	mov ah,9
	int 21h
	
	call nl
	inc count
    
	lea dx,qa7
	mov ah,9
	int 21h  
	call count2
	ret

	quen8:
	lea dx,en8
	mov ah,9
	int 21h
	
	call nl  
	inc count
    
	lea dx,qae8
	mov ah,9
	int 21h  
	call count2
	ret  
	
	qn8:
    lea dx,q8
	mov ah,9
	int 21h
	
	call nl    
	inc count
    
	lea dx,qa8
	mov ah,9
	int 21h  
	call count2
	ret 
 
	quen9:
	lea dx,en9
	mov ah,9
	int 21h
	
	call nl 
	inc count
    
	lea dx,qae9
	mov ah,9
	int 21h  
	call count2
	ret  
	
	qn9:
    lea dx,q9
	mov ah,9
	int 21h
	
	call nl    
	inc count
    
	lea dx,qa9
	mov ah,9
	int 21h  
	call count2
	ret
	
	quen10:
	lea dx,en10
	mov ah,9
	int 21h
	
	call nl
	inc count
    
	lea dx,qae10
	mov ah,9
	int 21h
	call pthis
	db 10,13,"no of questions you have attended is :10",0
	ret  
	
	qn10: 
	inc count
    lea dx,q10
	mov ah,9
	int 21h
	
	call nl
	lea dx,qa10
	mov ah,9
	int 21h
	call pthis
	db 10,13,"no of questions you have attended is :10",0
	ret
	
	
	
	input:
	call nl
    
	mov ah, 1
	int 21h
	ret
	count2: 
	call nl
	lea dx,msg22
	mov ah,9
	int 21h
    mov ax,count
	add ax,48
	mov dx,ax
	mov ah,02
	int 21h
	ret  
	
	 
	exit1: 
	call nl 
	call nl 
   
	
	lea dx,msg10
	mov ah,9
	int 21h
	
	mov ah,1
	int 21h
	
	cmp al,'1'
	je start2 
	inc exam
	cmp exam,3
	hlt
	
	call nl
	call nl
	
	lea dx,msg111
	mov ah,9
	int 21h
	
	mov ah, 4ch
	int 21h 
	
define_pthis
define_scan_num
define_clear_screen
DEFINE_GET_STRING
	
end start1	
	
end main
   end