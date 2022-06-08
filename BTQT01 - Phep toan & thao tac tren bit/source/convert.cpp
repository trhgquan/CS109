/**
 * W02 Homework - CS109.
 *
 * Code by Tran Hoang Quan - 19120338.
 * https://github.com/trhgquan
 */

#include"convert.h"

/**
 * This function calculate x^k wewy fast.
 * @param  T
 * @param  T
 * @return T
 */
template<class T>
T quickPow(T x, T k) {
  if (k == 0) return 1;
  if (k == 1) return x;

  if (k % 2 == 0) return quickPow(x * x, k / 2);
  return x * quickPow(x * x, (k - 1) / 2);
}

// =================================================================================
/**
 * Convert a binary string to a decimal integer.
 * @param  std::string
 * @return int
 */
int binaryToDecimal(std::string binary) {
  int res = 0;
  for (int i = 0; i < (int)binary.size(); ++i)
    res += (binary[i] == '1') ? (int)quickPow(2, (int)binary.size() - i - 1) : 0;
  return res;
}

/**
 * Convert a decimal integer to binary string.
 * @param  int
 * @return std::string
 */
std::string decimalToBinary(int decimal) {
  std::stack<char>binary;
  while (decimal > 0) {
    binary.push((decimal % 2));
    decimal /= 2;
  }

  std::string binaryResult;
  while (!binary.empty()) {
    binaryResult += binary.top() + '0'; binary.pop();
  }

  return binaryResult;
}

/**
 * Convert a binary string to hexadecimal string.
 * @param  std::string
 * @return std::string
 */
std::string binaryToHex(std::string binary) {
  return decimalToHex(binaryToDecimal(binary));
}

// =================================================================================
/**
 * Convert a hexadecimal character to integer.
 * @param  char
 * @return int
 */
int hexToIntValue(char hexCharacter) {
  if (hexCharacter >= '0' && hexCharacter <= '9') return hexCharacter - '0';
  return hexCharacter - 'A' + 10;
}

/**
 * Convert an integer to a hexadecimal character.
 * @param  int
 * @return char
 */
char intToHexValue(int intCharacter) {
  if (intCharacter >= 0 && intCharacter <= 9) return intCharacter + '0';
  return intCharacter + 'A' - 10;
}

/**
 * Convert a hexadecimal string to decimal integer.
 * @param  std::string
 * @return int
 */
int hexToDecimal(std::string hex) {
  int res = 0;
  for (int i = 0; i < (int)hex.size(); ++i)
    res += hexToIntValue(hex[i]) * (int)quickPow(16, (int)hex.size() - i - 1);
  return res;
}

/**
 * Convert a decimal integer to hexadecimal string.
 * @param  int
 * @return std::string
 */
std::string decimalToHex(int decimal) {
  std::stack<char>hex;
  while (decimal > 0) {
    hex.push(intToHexValue(decimal % 16));
    decimal /= 16;
  }

  std::string hexResult;
  while (!hex.empty()) {
    hexResult += hex.top(); hex.pop();
  }

  return hexResult;
}

// =================================================================================
int main(int argc, const char* argv[]) {
  std::cout << "convert.cpp" << std::endl;
  if (argc - 1 < 2) {
    std::cout << "Arguments error." << std::endl;
    return 0;
  }

  switch (std::stoi(argv[1])) {
    // Convert Binary to decimal/
    case 3:
      std::cout << "Convert " << argv[2] << " from Binary to Decimal: " << std::endl;
      std::cout << binaryToDecimal(argv[2]) << std::endl;
      break;

    // Convert Decimal to Binary/
    case 1:
      std::cout << "Convert " << argv[2] << " from Decimal to Binary: " << std::endl;
      std::cout << decimalToBinary(std::stoi(argv[2])) << std::endl;
      break;

    // Convert Hex to Decimal/
    case 4:
      std::cout << "Convert " << argv[2] << " from Hex to Decimal: " << std::endl;
      std::cout << hexToDecimal(argv[2]) << std::endl;
      break;

    // Convert Decimal to Hex/
    case 2:
      std::cout << "Convert " << argv[2] << " from Decimal to Hex: " << std::endl;
      std::cout << decimalToHex(std::stoi(argv[2])) << std::endl;
      break;

    // Convert Binary to Hex/
    case 5:
      std::cout << "Convert " << argv[2] << " from Binary to Hex: " << std::endl;
      std::cout << binaryToHex(argv[2]) << std::endl;
  }

  return 0;
} 
