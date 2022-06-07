function love.load()
  require "libs.xyEngine"
  myMeshes()
end

function myMeshes()
  box = xyEngine:NewMesh("mesh/box")
end

function love.update(dt)
end

function love.draw()
  love.graphics.setColor(255, 0, 0)
  xyEngine:Render(box)
end
