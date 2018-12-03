import strutils,tables
const
        input = slurp("./input/02").strip().splitLines()
var 
        twos = 0
        threes = 0
        
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
quit()
