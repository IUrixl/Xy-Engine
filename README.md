# Release
***Xy Engine Out now!***

[***XyMeshEditor Out now!***](https://github.com/IUrixl/XyMeshTool "Direct link to XyMeshEditor")

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

## Errors and how to fix it
### File "x.xymesh.xymesh" doesn't exist
Solution
```lua
  function myMeshes()
    myMesh = xyEngine:NewMesh("mesh/box") -- Do not add .xymesh extension, xyEngine adds it for you
  end
```

### Attempt to index a nil value
To fix it do that
```lua
  function love.load()
    require "lib.xyEngine"
    myMeshes()
  end
  
  function myMeshes()
    myMesh = xyEngine:NewMesh(path)
  end
```

## Resources
### Mesh
#### Creating a new mesh
```lua
  myMesh = xyEngine:NewMesh(path) -- It will create the mesh and return you the id of the mesh
```
#### Removing a mesh
```lua
  xyEngine:RemoveMesh(id)
```

#### Transforming X/Y of a mesh
```lua
  xyEngine:TransformX(id, x) -- The second argument is a vector value
  xyEngine:TransformY(id, y) -- The second argument is a vector value
```
#### Scaling X/Y of a mesh
```lua
  xyEngine:ScaleX(id, x) -- The second argument is a vector value
  xyEngine:ScaleY(id, y) -- The second argument is a vector value
```
#### Scaling mesh
```lua
  xyEngine:Scale(id, x, y) -- 1. How much you want to scale X. 2. How much you want to scale Y.
```

#### Transforming mesh
```lua
  xyEngine:Transform(id, x, y) -- 1. How much you want to transform X. 2. How much you want to transform Y.
```

#### Rendering a mesh
```lua
  function love.draw()
    xyEngine:Render(id)
  end
```

### Getting info
#### Getting vertices from a mesh
```lua
  local vertices = xyEngine:GetVertices(id)
```

#### Getting active meshes
```lua
  local meshes = xyEngine:GetMeshes()
```
