class Solution:
    def kidsWithCandies(self, candies: List[int], extraCandies: int) -> List[bool]:
        maxim = max(candies)
        newlist = []
        for i in candies:
            if i+extraCandies >= maxim:
                newlist.append(True)
            else:
                newlist.append(False)
        return newlist