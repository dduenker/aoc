import strutils,sets,sequtils,math
const
        input = slurp("./input/01").strip().splitLines().map(parseInt)
var 
        result = 0
        results=initSet[int]()

echo input.sum()

while true:
        for i in 0..len(input)-1:
                result+=input[i]
                if result in results:
                        echo result
                        quit()
                else:
                        incl(results, result)

