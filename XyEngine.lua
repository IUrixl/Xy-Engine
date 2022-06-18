xyEngine = {}
xyEngine.Core = {}
xyEngine.Core.Trigger = {}

Meshs = {}
ActualVertices = {}


function xyEngine.Core:ApplyModifications(id)
	local tx = Meshs[id]["tx"] 
	local ty = Meshs[id]["ty"]
	local sx = Meshs[id]["sx"]
	local sy = Meshs[id]["sy"]
	if tx ~= 0 then
		local a = 1
		for i,v in ipairs(ActualVertices) do
			if a == 1 then
				ActualVertices[i] = v+tx
				a = 2
			else a = 1 end
		end
	end
	if ty ~= 0 then
		local a = 1 
		for i,v in ipairs(ActualVertices) do
			if a == 1 then a = 2
			else
				ActualVertices[i] = v+ty
				a=1
			end
		end
	end
	if sx ~= 0 then
		local a = 1
		for i,v in ipairs(ActualVertices) do
			if a == 1 then
				ActualVertices[i] = v*math.sqrt(sx)
				a = 2
			else a = 1 end
		end 
	end
	if sy ~= 0 then
		local a = 1
		for i,v in ipairs(ActualVertices) do
			if a == 1 then a = 2
			else 
				ActualVertices[i] = v*math.sqrt(sy)
				a = 1
			end
		end
	end
end

function xyEngine.Core:CheckForFile(src)
	local f = io.open(src..".xymesh", "r")
	if f ~= nil then io.close(f) return true else return false end
end

function xyEngine.Core:ReadFile(src)
	local f = io.open(src..".xymesh", "r")
	local content = f:read("*all")
	io.close(f)
	return content
end

function xyEngine.Core:Parse(data)
	for i,v in ipairs(ActualVertices) do
		ActualVertices[i] = nil
	end
    for match in (data..','):gmatch("(.-)"..',') do
        table.insert(ActualVertices, match);
    end
end

function xyEngine.Core:Render()
	love.graphics.polygon("fill", ActualVertices)
end

function xyEngine:NewMesh(source)
	local len = 0
	for i,v in ipairs(Meshs) do
		len = len +1
	end
	local id = len +1
	table.insert(Meshs, {id=id, src=source, tx=0, ty=0, sx=0, sy=0})
	return id
end

function xyEngine:RemoveMesh(id)
	table.remove(Meshs, id)
end

function xyEngine:Transform(id, x, y)
	Meshs[id]["tx"]=x
	Meshs[id]["ty"]=y
end

function xyEngine:TransformX(id, x)
	Meshs[id]["tx"]=x
end

function xyEngine:TransformY(id, y)
	Meshs[id]["ty"]=y
end

function xyEngine:Scale(id, x, y)
	Meshs[id]["sx"]=x
	Meshs[id]["sy"]=y
end

function xyEngine:ScaleX(id, x)
	Meshs[id]["sx"]=x
end

function xyEngine:ScaleY(id, y)
	Meshs[id]["sy"]=y
end

function xyEngine:GetMeshes()
	local len = 0
	for i,v in ipairs(Meshs) do
		len = len + 1
	end
	return len
end

function xyEngine:GetVertices(id)
	local src = Meshs[id]["src"]
	local exist = xyEngine.Core:CheckForFile(src)
	local len = 0
	if exist == true then
		local content = xyEngine.Core:ReadFile(src)
		xyEngine.Core:Parse(content)
		local a = 1
		for i,v in ipairs(ActualVertices) do
			if a == 1 then a = 2
			else len = len +1 a = 1 end 
		end
	else
		love.graphics.setColor(255, 255, 255)
		love.graphics.print("File : "..src..".xymesh".." doesn't exist")
	end
	return len
end

function xyEngine:Render(id)
	local src = Meshs[id]["src"]
	local exist = xyEngine.Core:CheckForFile(src)
	if exist == true then 
		local content = xyEngine.Core:ReadFile(src)
		xyEngine.Core:Parse(content)
		xyEngine.Core:ApplyModifications(id)
		xyEngine.Core:Render()
	else 
		love.graphics.setColor(255, 255, 255)
		love.graphics.print("File : "..src..".xymesh".." doesn't exist")
	end
end
