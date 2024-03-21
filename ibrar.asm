INCLUDE Irvine32.inc


.data
testt DWORD ?
STR3 byte "       ==========Profit Pulse========= ", 0

STR1 byte "What's your Name : ", 0

var1 DWORD ?

STR2 byte "Enter the online shopping budget: $", 0
var2 DWORD ?
Rules byte "       =========App Controls========= ", 0
Rules1 byte "       1.  Choose number of items to purchase and then resell between 1 to 10 ", 0
Rules2 byte "       2.  Profit can be upto 5 times more!", 0
Rules3 byte "       3.  But being incorrect will net you a loss", 0
Balance byte "Your current amount is $ ", 0
heyy byte "Amount of money spent on shopping: $", 0
var3 DWORD ?
GuessNum byte "Amount of Items Bought between 1 & 10 : ", 0
RandNum DWORD ?
Check0to10 byte "->Number should be between 1 to 10<- Re-enter number: ", 0
CompRange DWORD 0
Lost byte "Money Lost", 0
WinNum byte "The Correct number of items was : ", 0
Won byte "Profit Gained Rs.", 0
choice byte "Do you want to continue Playing? (0 for yes & 1 for no)", 0
askchoice DWORD 0
endgame byte "Current balance is $ ", 0


.code
main PROC


mov edx, OFFSET STR3
call Writestring
call Crlf
call Crlf

mov edx, OFFSET STR1
call Writestring


mov ecx, 20
call readstring
mov var1, eax


mov edx, OFFSET STR2
call Writestring
call readInt
mov var2, eax



call WaitMsg
call crlf
call clrscr




.WHILE askchoice == 0 && var2 != 0

call ShowRules

call ShowBalance

mov edx, OFFSET heyy
call Writestring
call readInt
mov var3, eax



mov edx, OFFSET GuessNum
call Writestring
call readInt
mov RandNum, eax
call crlf

call GenRandomNum

.IF RandNum > 0 && RandNum < 11
	.IF RandNum == eax
	mov edx, OFFSET WinNum
	call Writestring
	mov eax, CompRange
	call WriteInt
	call crlf
	call crlf
	mov edx, OFFSET Won
	call Writestring
	mov eax, var3
	mov ebx, 5
	mul ebx
	mov var3, eax
	call Writeint
	mov eax, var3
	add var2, eax
	call crlf
	call crlf
	.ELSE
	mov edx, OFFSET WinNum
	call Writestring
	mov eax, CompRange
	call WriteInt
	call crlf
	call crlf
	mov edx, OFFSET Lost
	call Writestring
	mov eax,var3
	push eax
	NOT eax
	INC var2
	ADD var2,eax
	NOT eax
	pop eax
	call Writeint
	call crlf
	call crlf
	.ENDIF

.ENDIF

call ShowChoice

.ENDW
call EndGameP
INVOKE Exitprocess, 0
main ENDP

ShowRules PROC
mov edx, OFFSET Rules
call Writestring
call Crlf
mov edx, OFFSET Rules1
call Writestring
call Crlf
mov edx, OFFSET Rules2
call Writestring
call Crlf
mov edx, OFFSET Rules3
call Writestring
call Crlf
RET
ShowRules ENDP

ShowBalance PROC
mov edx, OFFSET Balance
call Writestring
mov eax, var2
call Writeint
call crlf
RET
ShowBalance ENDP

GenRandomNum PROC
call Randomize
mov eax, 10
call RandomRange
mov CompRange, eax
call crlf
RET
GenRandomNum ENDP

ShowChoice PROC
mov edx, OFFSET choice
call Writestring
call readInt
mov askchoice, eax
call clrscr
RET
ShowChoice ENDP

EndGameP PROC
mov edx, OFFSET endgame
call Writestring
mov eax, var2
call writeint
call crlf
call crlf	
RET
EndGameP ENDP

END main