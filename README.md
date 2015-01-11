

# UpdateTimer

`UpdateTimer` is a simple `struct` that tracks commonly-needed chronological
variables in the scene loop of a game.  Also includes a lap timer (see `lap()`)
that makes it trivial to track an arbitrary event (i.e., one that isn't
necessarily tied to the `update()` cycle).  During your scene loop's `update()`
method, `timeSinceLastLap` will be set to the number of seconds since the
previous time `lap()` was called (or, if it has never been called, the number of
seconds since the first call to `update()`).  Call `lap()` any time the event
you're monitoring occurs, and `timeSinceLastLap` will reset to 0 and begin
counting up again.

```swift
class MyScene: SKScene
{
    let spawnMonsterInterval: NSTimeInterval = 5
    private var updateTimer = UpdateTimer()

    func update(currentTime:NSTimeInterval) {
        updateTimer.update(currentTime)

        println("seconds since last update() = \(updateTimer.timeSinceLastUpdate)")
        println("seconds since first update() = \(updateTimer.timeSinceFirstUpdate)")
        println("seconds since monster was spawned = \(updateTimer.timeSinceLastLap)")
        
        if updateTimer.timeSinceLastLap >= spawnMonsterInterval {
            spawnMonster()
            updateTimer.lap()           // resets `timeSinceLastLap` to zero
        }
    }
}
```

# authors / contributors

bryn austin bellomy < <bryn.bellomy@gmail.com> >