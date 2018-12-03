import strutils,tables
const
        input = slurp("./input/02").strip().splitLines()
var 
        twos = 0
        threes = 0


proc diff(x,y:string): int =
        result=0
        for i in 0..len(x)-1:
                if x[i]!=y[i]:
                        result=result+1

proc diffpos(x,y:string): int =
        for i in 0..len(x)-1:
                if x[i]!=y[i]:
                        result=i
                        break


for line in input:
        var data = initCountTable[char]()
        for c in line:
                data.inc(c)

        for k,v in data:
                if v == 2:
                        twos=twos+1
                        break

        for k,v in data:
                if v == 3:
                        threes=threes+1
                        break
echo twos*threes


for i in 0..len(input)-2:
        for j in i+1..len(input)-1:
                if diff(input[i],input[j]) == 1:
                        let p = diffpos(input[i],input[j])
                        var solution=input[i]
                        strutils.delete(solution, p, p)
                        echo solution
                        quit()
quit()
