class ShortCode
  ALPHABET = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".freeze
  BASE = ALPHABET.length

  class << self

    # 999_999 -> "4c91"
    # 999_999 -> 999_999 % 62 = 1 -> index of 1 = "1"  -> 999_999/62 = 16129 -> result = "1"
    # 16129   -> 16129 % 62 = 9   -> index of 9 = "9"  -> 16129/62 = 260     -> result = "91"
    # 260     -> 260 % 62 = 12    -> index of 12 = "c" -> 260/62 = 4         -> result = "c91"
    # 4       -> 4 % 62 = 4       -> index of 4 = "4"  -> 4/62 = 0           -> result = "4c91"
    def encode(number)
      return ALPHABET.first if number.zero? || number.nil?

      result = ""

      while number > 0 do
        index = number % BASE
        char = ALPHABET[index]
        result.prepend char
        number = number / 62
      end

      result
    end

    # "4c91" -> 999_999
    # number = 0
    # 1 = 62^0 -> index of "1" -> 1  -> number += 1 * 1 = 1
    # 9 = 62^1 -> index of "9" -> 9  -> number += 9 * 62 = 558 + 1
    # c = 62^2 -> index of "c" -> 12 -> number += 12 * 3844 = 46687
    # 4 = 62^3 -> index of "4" -> 4  -> number += 4 * 238328 + 46687 = 999_999
    def decode(string)
      number = 0

      string.reverse.each_char.with_index do |char, index|
        power = BASE**index
        index = ALPHABET.index(char)
        number += index * power
      end

      number
    end
  end
end
