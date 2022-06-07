function love.load()
  require "libs.xyEngine"
  myMeshes()
end

function myMeshes()
  box1 = xyEngine:NewMesh("mesh/box")
  box2 = xyEngine:NewMesh("mesh/box")
  box3 = xyEngine:NewMesh("mesh/box")
  xyEngine:Transform(box1, -100, 150)
  xyEngine:Transform(box2, 250, 150)
  xyEngine:Transform(box3, 600, 150)
end

function love.update(dt)
end

function love.draw()
  love.graphics.setColor(255, 0, 0)
  xyEngine:Render(box1)
  love.graphics.setColor(0, 255, 0)
  xyEngine:Render(box2)
  love.graphics.setColor(0, 0, 255)
  xyEngine:Render(box3)
end
