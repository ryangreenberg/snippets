// This could be done without .zip if I could think of a way to use the
// takeWhile iterator with an index to access str2.
//
// There may also be a way to make zip lazy, in which case it's fine
def longestCommonPrefix(str1: String, str2: String): String =
  str1.zip(str2).takeWhile { case (c1, c2) => c1 == c2 }.map { case (c1, c2) => c1 }.mkString
