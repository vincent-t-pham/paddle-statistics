
from random import shuffle
from practicescrape import scrape_attendance
from enum import Enum

class side(Enum):
  left  = 'left'
  right = 'right'
  both  = 'both'

class role(Enum):
  strokes   = 'strokes'
  timing    = 'timing'
  engine    = 'engine'
  rocket    = 'rocket'

# [    stroke , stroke    ] 1
# [ timingBox , timingBox ] 2
# [ timingBox , timingBox ] 3
# [    engine , engine    ] 4
# [    engine , engine    ] 5
# [    engine , engine    ] 6
# [    engine , engine    ] 7
# [    engine , engine    ] 8 
# [    rocket , rocket    ] 9
# [    rocket , rocket    ] 10


class Paddler:
   def __init__(self, name, weight, side, role):
    self.name   = name
    self.weight = weight
    self.role   = role
    self.side   = side

def adjustRoles(attendance):
    strokes = []
    timingBox = []
    engine = []
    rocket = []

    # make count of how many of each roles
    # if too many, pop from one list and move to another
    for person in attendance:
      match person.role:
        case role.strokes:
          strokes.append(person)
        case role.timing:
          timingBox.append(person)
        case role.engine:
          engine.append(person)
        case role.rocket:
          rocket.append(person)
    
    if(len(attendance) > 20):
        print("Too many paddlers")
        return 0
        
    while(len(strokes) > 2):
        movingPaddler = strokes.pop()
        timingBox.append(movingPaddler)
    while(len(timingBox) > 4):
        movingPaddler = timingBox.pop()
        engine.append(movingPaddler)
    while(len(engine) > 10):
        movingPaddler = engine.pop()
        rocket.append(movingPaddler)

    print('strokes')
    for name in strokes:
        print(name.name)
    print('timing')
    for name in timingBox:
        print(name.name)
    print('engine')
    for name in engine:
        print(name.name)
    print('rocket')
    for name in rocket:
        print(name.name)

    return strokes, timingBox, engine, rocket
        
def makeBoat(strokes, timingBox, engine, rocket):
   
   
# put people into left and right
# catagorize by role


def makePaddlers():
    vincentPham   = Paddler('Vincent', 172, side.right, role.engine)
    kaylinMa      = Paddler('Kaylin', 140, side.right, role.timing)
    gavinRosario  = Paddler('Gavin', 119, side.both, role.timing)
    royNguyen     = Paddler('Roy', 160, side.both, role.engine)
    nickLiu       = Paddler('Nick', 160, side.both, role.engine)
    melanieWong   = Paddler('Melanie', 125, side.left, role.timing)
    jessicaZhang  = Paddler('Jessica', 120, side.left, role.rocket)
    raydonNguyen  = Paddler('Raydon', 135, side.left, role.strokes)
    tylerWong     = Paddler('Tyler', 165, side.right, role.strokes)

    paddlers = [vincentPham, kaylinMa, gavinRosario, royNguyen, nickLiu, melanieWong, jessicaZhang, raydonNguyen, tylerWong]

    if(len(paddlers) > 20):
       print("Too many members")
       return 0

    return paddlers

def main():
   attendance = makePaddlers()
   strokes, timingBox, engine, rocket = adjustRoles(attendance)




if __name__ == '__main__':
    main()



