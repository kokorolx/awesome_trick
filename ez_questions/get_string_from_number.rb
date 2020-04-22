# Viết 1 hàm nhận vào 1 số nguyên, in ra chữ "Hello" nếu là số chẵn và "Good bye" nếu là số lẻ.

def printText(number:)
  array = ["Hello", "Goodbye"]
  index = number % 2
  print(array[index])
end


def printText2(number:)
  (number.even? && 'Hello') || 'Goodbye'
end
