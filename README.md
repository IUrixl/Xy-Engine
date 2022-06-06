# Release
Xy-Engine and Xy Mesh Editor aren't released by the moment, stay tunned.

# Xy-Engine
Xy Engine tool is the library made to help you with rendering your .xymesh meshes.

## Xy-Series
Xy Series is the group of devtools to improve your game optimization. It can also be used to model your own 2d mesh and render it in-game if u want.
  - Xy Mesh Tool - Mesh editor
  - Xy Engine - Library


## Envirioment settings and adjustments
### While editing
 We recomend to strucure your folder like this.
 
- Mesh folder
  - Mesh.xymesh
- Game folder
  - Main.lua
  - Love.exe

### While building into .love/.exe
We recomend to structure your folder like this.

- Game folder
  - Mesh folder
    - Mesh.xymesh
  - Anything else you want
    - Main.lua
      
And then make a .zip only with the content inside of Game folder, change te extension to .love

## Resources
### Mesh
#### Creating a new mesh
```lua
  local myMesh = xyEngine:NewMesh(path) -- It will create the mesh and return you the id of the mesh
```
#### Transform X/Y of a mesh
```lua
  xyEngine:TransformX(id, x) -- The second argument is a vector value
  xyEngine:TransformY(id, y) -- The second argument is a vector value
```
#### Scaling X/Y of a mesh
```lua
  xyEngine:ScaleX(id, x) -- The second argument is a vector value
  xyEngine:ScaleY(id, y) -- The second argument is a vector value
```
#### Rendering a mesh
```lua
  function love.draw()
    xyEngine:Render(id)
  end
```
