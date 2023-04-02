# Inception

**docker VS virtual machine**
- **VM** donnot share kernal system.
- **docker** dose.


## Images

- **Images** Are like blueprints for containers
    or **Classes** for objects in `OOP`

| Docker Images|
|--------------|
| Runtime environment |
| Application code |
| Any dependencies |
| Extra configuration (e.g. env variables) |
| Commands |

**Images are read only**
- once you create an image you cannot modify it,
- if you want to modify the image then you must create a brand new one.

**Images are made up from several "layers"**
- **Parent image:**
    - Includes the OS & sometimes the runtime environment.
- **The second layer:**
    - Could contain the source code
- **The third layer:**
    - Could contain depen   dencies.
- And so on ...

| Container |
|-----------|
| Running instance of the image |
| runs our application |

**Isolated Pocess**
- means our application is not depend on any other system processes