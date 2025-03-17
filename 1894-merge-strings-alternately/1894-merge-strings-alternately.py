class Solution:
    def mergeAlternately(self, word1: str, word2: str) -> str:
        merged = ""
        length = min(len(word1),len(word2))
        for i in range(0 , length , 1):
                merged = merged + word1[i] + word2[i]
        merged = merged + word1[length:] + word2[length:]
        return merged
        