import parseutils,strutils,tables
const
        input = slurp("./input/03").strip().splitLines()

type
        Claim = tuple
                id: int
                x: int
                y:int
                width: int
                height: int

        data = array[0..999, array[0..999, int]]
        #data = array[0..10, array[0..10, int]]

var claimInfo: data


proc parseclaim(line:string):Claim =
        var id, x, y, width, height = 0
        let parts = line.split()

        discard parseutils.parseInt(parts[0], id, 1)

        let pos = parts[2].split(",")
        discard parseutils.parseInt(pos[0],x)
        discard parseutils.parseInt(pos[1],y)

        let size = parts[3].split("x")
        discard parseutils.parseInt(size[0],width)
        discard parseutils.parseInt(size[1],height)

        let c: Claim = (id: id, x:x, y:y, width:width, height:height) 
        return c

proc insertClaim(c:Claim) =
        for x in c.x .. c.x+c.width-1:
                for y in c.y .. c.y+c.height-1:
                        inc claimInfo[x][y]
proc overlaps(c:Claim):bool =
        for x in c.x .. c.x+c.width-1:
                for y in c.y .. c.y+c.height-1:
                        if claimInfo[x][y] > 1:
                                return true 
        return false
        

proc countMultiClaims():int =
        for line in claimInfo:
                for cell in line:
                        if cell > 1:
                                inc result


#echo parseclaim(input[0])

for inputLine in input:
        insertClaim(parseclaim(inputline))

#for line in claimInfo:
        #echo line

echo countMultiClaims()

for line in input:
        var c = line.parseclaim()
        if not c.overlaps():
                echo c
