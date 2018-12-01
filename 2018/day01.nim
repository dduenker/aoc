import system,strutils,sets,os
const input = splitLines(slurp("./input/01"))
var 
        result = 0
        results=initSet[int]()


for i in 0..len(input)-1:
        try:
                result+=parseInt(input[i])
        except ValueError:
                break
echo result

result = 0
while true:
        for i in 0..len(input)-1:
                try:
                        result+=parseInt(input[i])
                        if result in results:
                                echo result
                                quit()
                        else:
                                incl(results, result)

                except ValueError:
                        break

