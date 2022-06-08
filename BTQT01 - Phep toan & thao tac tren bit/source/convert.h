/**
 * W02 Homework - CS109.
 *
 * Code by Tran Hoang Quan - 19120338.
 * https://github.com/trhgquan
 */

#ifndef CONVERT_H

#define CONVERT_H
#include<iostream>
#include<stack>
#include<string>

template<typename T>
T quickPow(T, T);

int binaryToDecimal(std::string);
char intToHexValue(int);
int hexToIntValue(char);
int hexToDecimal(std::string);
std::string decimalToHex(int);
std::string decimalToBinary(int);
std::string binaryToHex(std::string);

#endif
