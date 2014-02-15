## Coffeebot Wars

Write bots in coffeescript, have them battle.

To run:

    npm install
    coffee app.coffee


### Coffeebot API
general:
`energy()` returns the current energy level
`turret()` returns the current angle of the turret
`turret(angle)` sets the current angle of the turret
`regenerate(energy)` uses _energy_ amount to restore hitpoints (must be stationary)

movement:
`positionX()` returns the position along the x-axis
`positionY()` returns the position along the y-axis
`position()` returns the current position [x,y]
`speedX()` returns the x-axis speed
`speedX(speed)` set the x-axis speed (can be positive or negative)
`speedY()` returns the y-axis speed
`speedY(speed)` set the y-axis speed (can be positive of negative)

damage detection:
`hitpoints()` returns current hitpoint amount
`collisionWall()` returns true if currently colliding with the wall
`collisionBot()` returns true if currently colliding with another bot

opponent detection:
`look()` returns the position of the closest bot along the turret's sight line (or null if none)
`ping()` returns the speed of the closest bot along the turret's sight line (or null if none)
`radar(distance)` returns the position of all entities within radius _distance_

attack:
`fire(speed, payload)` fire a projectile at _speed_ doing _payload_ damage if it hits
`burst(distance, payload)` sends out a damaging wave of radius _distance_ doing _payload_ damage if it hits
