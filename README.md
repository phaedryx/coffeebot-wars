## Coffeebot Wars

Write bots in coffeescript, have them battle.

To run:

    npm install
    coffee app.coffee


### Coffeebot API
**general:**

`energy()` returns the current energy level

`turret()` returns the current angle of the turret (in degrees)

`turret(angle)` sets the current _angle_ of the turret. Returns true if successful
or false if unsuccessful (not enough energy)

`regenerate(energy)` uses _energy_ amount to restore hitpoints (must be stationary).
Returns true if successful or false if unsuccessful (not enough energy or bot is
moving)


**movement:**

`positionX()` returns the position along the x-axis (0 - 640)

`positionY()` returns the position along the y-axis (0 - 640)

`position()` returns the current position [x,y]

`speedX()` returns the x-axis speed (positive moving right, negative moving left
and 0 if stationary)

`speedX(speed)` set the x-axis speed (can be positive or negative). Returns true
if successful and false if unsuccessful (not enough energy)

`speedY()` returns the y-axis speed (positive moving down, negative moving up
and 0 if stationary)

`speedY(speed)` set the y-axis speed (can be positive or negative). Returns true
if successful or false if unsuccessful (not enough energy)


**damage detection:**

`hitpoints()` returns current hitpoint amount

`collisionWall()` returns true if currently colliding with the wall or false
otherwise

`collisionBot()` returns true if currently colliding with another bot or false
otherwise


**opponent detection:**

`look()` returns the position of the closest bot along the turret's sight line
(or null if none)

`ping()` returns the speed of the closest bot along the turret's sight line (or
 null if none)

`radar(distance)` returns the position of all entities within radius _distance_


**attack:**

`fire(speed, payload)` fire a projectile at _speed_ doing _payload_ damage if it hits.
Returns true if fired successfully or false if unsuccessful (not enough energy)

`burst(distance, payload)` sends out a damaging wave of radius _distance_ doing
_payload_ damage if it hits. Returns true if burst is successful or false if
unsuccessful (not enough energy)
