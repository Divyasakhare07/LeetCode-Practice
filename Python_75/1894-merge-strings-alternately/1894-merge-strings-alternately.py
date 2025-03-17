class Solution:
    def mergeAlternately(self, word1: str, word2: str) -> str:
        merged = []
        length = min(len(word1),len(word2))
        for i in range(0 , length , 1):
                merged.append(word1[i])
                merged.append(word2[i])
        merged.extend(word1[length:])
        merged.extend(word2[length:])
        return "".join(merged)
        