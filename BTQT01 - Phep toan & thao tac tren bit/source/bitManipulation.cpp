/**
 * CS109 Homework - Week 02.
 *
 * Code by Tran Hoang Quan - 19120338.
 * https://github.com/trhgquan
 */

#include"bitManipulation.h"

//=====================================================
/**
 * Get bit representation of an integer.
 * @param  int
 * @return std::vector<int>
 */
std::vector<int> bitRepresentationOfInteger(int x) {
  std::vector<int> bitRepresentation(8, 0);

  bool isNegative = false;
  if (x < 0) {
    isNegative = true;
    x *= -1;
  }

  for (int i = 7; i >= 0; --i) {
    bitRepresentation[i] = (x >> 0) & 1;
    x >>= 1;
  }

  if (isNegative) {
    for (auto& i : bitRepresentation) i = (i == 1) ? 0 : 1;
    for (int i = bitRepresentation.size() - 1; i >= 0; --i) {
      if (bitRepresentation[i] == 0) {
        bitRepresentation[i] = 1; break;
      }

      bitRepresentation[i] = 0;
    }

    bitRepresentation[0] = 1;
  }

  return bitRepresentation;
}

/**
 * Get integer representation of a binary string.
 * @param  std::string
 * @return int
 */
int integerRepresentationOfBit(std::string x) {
  int result = 0;

  bool isNegative = false;

  if (x[0] == '1') {
    isNegative = true;
    for (char& i : x) i = (i == '1') ? '0' : '1';
  }

  int currentBitPosition = 0;
  for (char i : x)
    result = (i == '1') ? ((1 << x.size() - 1 - currentBitPosition++) | result) : (~(1 << x.size() - 1 - currentBitPosition++) & result);

  if (isNegative) {
    result += 1;
    result *= -1;
  }

  return result;
}

//=====================================================
/**
 * Add two binary strings.
 * @param  std::string
 * @param  std::string
 * @return std::string
 */
std::string bitAddition(std::string x, std::string y) {
  int temp = 0;
  std::string result;
  int maxSize = std::max(x.size(), y.size());

  while (x.size() < maxSize) x.insert(x.begin(), '0');
  while (y.size() < maxSize) y.insert(y.begin(), '0');

  for(int i = x.size() - 1; i >= 0; --i) {
    if (x[i] == '1' && y[i] == '1') {
      if (temp) {
        result.insert(result.begin(), '1');
        temp = 1;
      }

      else {
        result.insert(result.begin(), '0');
        temp = 1;
      }
    }

    else if ((x[i] == '0' && y[i] == '1') ||
             (x[i] == '1' && y[i] == '0')) {
      if (temp) {
        result.insert(result.begin(), '0');
        temp = 1;
      }

      else {
        result.insert(result.begin(), '1');
        temp = 0;
      }
    }

    else {
      if (temp) {
        result.insert(result.begin(), '1');
        temp = 0;
      }
      else {
        result.insert(result.begin(), '0');
        temp = 0;
      }
    }
  }

  return result;
}

/**
 * Substract two binary strings.
 * @param  std::string
 * @param  std::string
 * @return std::string
 */
std::string bitSubstract(std::string x, std::string y) {
  int maxSize = std::max(x.size(), y.size());
  while (x.size() < maxSize) x.insert(x.begin(), '0');
  while (y.size() < maxSize) y.insert(y.begin(), '0');

  for (char& i : y) i = (i == '1') ? '0' : '1';

  for (int i = y.size() - 1; i >= 0; --i) {
    if (y[i] == '0') {
      y[i] = '1'; break;
    }

    y[i] = '0';
  }

  return bitAddition(x, y);
}

/**
 * Multiply two binary strings.
 * @param  std::string
 * @param  std::string
 * @return std::string
 */
std::string bitMultiply(std::string m, std::string q) {
  int maxSize = std::max(m.size(), q.size());

  while (m.size() < maxSize) m.insert(m.begin(), '0');
  while (q.size() < maxSize) q.insert(q.begin(), '0');

  std::string multiplicationString;

  for (int i = 0; i < maxSize; ++i) multiplicationString.push_back('0');

  multiplicationString += q;

  multiplicationString.push_back('0');

  int k = maxSize;

  int lastPosition = multiplicationString.size() - 1;

  std::string newA;

  while (k > 0) {
    if (multiplicationString[lastPosition] != multiplicationString[lastPosition - 1]) {

      if (multiplicationString[lastPosition] == '0' && 
          multiplicationString[lastPosition - 1] == '1') {
        // Subtract M from A.
	newA = bitSubstract(multiplicationString.substr(0, maxSize), m);
      }
   
      else if (multiplicationString[lastPosition] == '1' &&
               multiplicationString[lastPosition - 1] == '0') {
        // Add M to A.
        newA = bitAddition(multiplicationString.substr(0, maxSize), m);
      }

      // Erase A.
      multiplicationString.erase(0, maxSize);
    
      // Insert new A into the string.
      multiplicationString.insert(0, newA);
    }

    // Shift right. 
    // If the first bit (a[0] == 1), then insert a 1 since it is a sign.
    //
    multiplicationString.insert(0, multiplicationString[0] == '1' ? "1" : "0");
    multiplicationString.pop_back();

    k--;
  }

  return multiplicationString.substr(0, 2 * maxSize);
}

/**
 * Divide two binary strings.
 * @param  std::string
 * @param  std::string
 * @return std::string
 */
std::vector<std::string> bitDivision(std::string q, std::string m) {
  int maxSize = std::max(q.size(), m.size());

  std::string divisionString = q;

  for (int i = 0; i < maxSize; ++i) divisionString.insert(0, std::string(1, m[0]));

  int k = maxSize;
  int lastPosition = divisionString.size() - 1;

  std::string newA;

  while (k > 0) {
    // <<
    divisionString.erase(0, 1);
    divisionString.push_back('0');

    newA = bitSubstract(divisionString.substr(0, maxSize), m);

    divisionString.erase(0, maxSize);

    divisionString.insert(0, newA);

    if (divisionString[0] == '1') {
      divisionString[lastPosition] = '0';
      newA = bitAddition(divisionString.substr(0, maxSize), m);

      divisionString.erase(0, maxSize);
      divisionString.insert(0, newA);
    } else {
      divisionString[lastPosition] = '1';
    }

    --k;
  }

  std::vector<std::string>res; 

  res.push_back(divisionString.substr(maxSize, maxSize));
  res.push_back(divisionString.substr(0, maxSize));

  return res;
}

int main(int argc, char const* argv[]) {
  std::cout << "bitManipulation.cpp" << std::endl;
  if (argc - 1 < 2) {
    std::cout << "Argument error." << std::endl;
    return 0;
  }

  switch (std::stoi(argv[1])) {
    // Convert decimal to bits, using bit manipulation.
    case 1: {
      std::cout << "Bit representation of " << argv[2] << ": " << std::endl;
      std::vector<int> bitRepresentation = bitRepresentationOfInteger(std::stoi(argv[2]));
      for (auto i : bitRepresentation) std::cout << i << ' ';
      std::cout << std::endl;
      break;
    }

    // Convert bits to decimal, using bit manipulation.
    case 2:
      std::cout << "Integer representation of " << argv[2] << ": " << std::endl;
      std::cout << integerRepresentationOfBit(argv[2]) << std::endl;
      break;;

    // Adding two bits.
    case 3: {
      std::cout << argv[2] << " + " << argv[3] << std::endl;
      std::cout << bitAddition(argv[2], argv[3]) << std::endl;
      break;
    }

    // Substracting two bits.
    case 4:
      std::cout << argv[2] << " - " << argv[3] << std::endl;
      std::cout << bitSubstract(argv[2], argv[3]) << std::endl;
      break;

    // Multiplying two bits.
    case 5:
      std::cout << argv[2] << " * " << argv[3] << std::endl;
      std::cout << bitMultiply(argv[2], argv[3]) << std::endl;     
      break;

    // Dividing two bits.
    case 6: {
      std::cout << argv[2] << " / " << argv[3] << std::endl;

      std::vector<std::string> result = bitDivision(argv[2], argv[3]);
      std::cout << "Result = " << result[0] << std::endl;
      std::cout << "Remainder = " << result[1] << std::endl;

      break;
    }
  }

  return 0;
}
