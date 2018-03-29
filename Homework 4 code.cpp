
//Homework #4		(Homework 4 code.cpp)
//Russell Richardson
//This program encrypts and decrypts user input

//Visual Studio 2015

#include <iostream>


using namespace std;

int main() {

	char inputBuffer[80];
	char encryptedBuffer[80];
	char clearBuffer[80];

	cout << "Input phrase to encrypt:";
	cin.getline(inputBuffer, sizeof(inputBuffer));
	int bufferSize = cin.gcount();
	bufferSize--;

	__asm {
		mov		esi, 0
		mov		eax, 0
		mov		ecx, bufferSize

		L1:
			mov		al, inputBuffer[esi]
			xor		al, 0ACh
			mov		encryptedBuffer[esi], al
			inc		esi
			loop L1

			mov		al, inputBuffer[esi]		; this is the terminating char
			mov		encryptedBuffer[esi], al
	}

	__asm {
		mov		esi, 0
		mov		eax, 0
		mov		ecx, bufferSize

		L2:
		mov		al, encryptedBuffer[esi]
			xor al, 0ACh
			mov		clearBuffer[esi], al
			inc		esi
			loop L2

			mov		al, encryptedBuffer[esi]	; this is the terminating char
			mov		clearBuffer[esi], al 
	}

	cout << "Original input: " << inputBuffer << endl;
	cout << "Encrypted output: " << encryptedBuffer << endl;
	cout << "Decrypted output: " << clearBuffer << endl;
	

	system("pause");
	return 0;
}