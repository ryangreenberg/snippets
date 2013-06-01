def longestCommonPrefix(str1: String, str2: String): String = {
  str1.zip(str2).takeWhile { case (c1, c2) => c1 == c2 }.map { case (c1, c2) => c1 }.mkString
}