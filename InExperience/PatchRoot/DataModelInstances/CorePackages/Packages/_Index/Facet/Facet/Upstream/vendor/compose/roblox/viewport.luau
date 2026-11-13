local CoreModule = require("../core")
local EngineModule = require("./engine")
local config = { width = 1280, height = 720 }

local function _(Vector)
	return { width = Vector.X, height = Vector.Y }
end

local _ = function(p1: number, p2): boolean
	return type(p1) == "number" and (p1 == p1 and p2 <= p1) and p1 < 1e999
end

return {
	createViewport = function(p1, p2, p3)
		-- upvalues: EngineModule (copy), config (copy), CoreModule (copy)
		local AmbientResult = if p2 == nil then EngineModule.ambient() else p2
		local T = if p3 == nil then {} else p3
		local MinimumSide = if T.minimumSide == nil then 100 else T.minimumSide
		local Config = if T.fallback == nil then config else T.fallback
		
		local function sizeOf()
			-- upvalues: EngineModule (upval), p1 (copy)
			local ViewportSize = EngineModule.readMember(p1, "ViewportSize")
			local X = EngineModule.readMember(ViewportSize, "X")
			local Y = EngineModule.readMember(ViewportSize, "Y")
			assert(type(X) == "number" and type(Y) == "number", "Camera viewport must have numeric dimensions")
			
			return { X = X, Y = Y }
		end
		
		local SizeOfResult = sizeOf()
		local MinimumSide1 = if MinimumSide == nil then 100 else MinimumSide
		local v1 = false
		
		if SizeOfResult ~= nil then
			local X: number = SizeOfResult.X
			v1 = type(X) == "number" and (X == X and (MinimumSide1 <= X and X < 1e999))
			
			if v1 then
				local Y: number = SizeOfResult.Y
				v1 = type(Y) == "number" and (Y == Y and MinimumSide1 <= Y) and Y < 1e999
			end
		end
		local CellResult = CoreModule.cell(if v1 then { width = SizeOfResult.X, height = SizeOfResult.Y } else Config)
		local CellResult1 = CoreModule.cell(v1)
		local Connection = AmbientResult.propertyChanged(p1, "ViewportSize"):Connect(function()
			-- upvalues: sizeOf (copy), MinimumSide (copy), CellResult (copy), CellResult1 (copy)
			local SizeOfResult = sizeOf()
			local MinimumSide1 = if MinimumSide == nil then 100 else MinimumSide
			local v2 = false
			
			if SizeOfResult ~= nil then
				local X: number = SizeOfResult.X
				v2 = type(X) == "number" and (X == X and (MinimumSide1 <= X and X < 1e999))
				
				if v2 then
					local Y: number = SizeOfResult.Y
					v2 = type(Y) == "number" and (Y == Y and (MinimumSide1 <= Y and Y < 1e999))
				end
			end
			if v2 then
				CellResult:set({ width = SizeOfResult.X, height = SizeOfResult.Y })
				CellResult1:set(true)
				
				return
			end
		end)
		CoreModule.cleanup(function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end)
		
		return CellResult, CellResult1
	end,
	usableViewportSize = function(Vector, p1): boolean
		local v1 = if p1 == nil then 100 else p1
		local v2 = false
		
		if Vector ~= nil then
			local X: number = Vector.X
			v2 = type(X) == "number" and (X == X and (v1 <= X and X < 1e999))
			
			if v2 then
				local Y: number = Vector.Y
				v2 = type(Y) == "number" and (Y == Y and v1 <= Y) and Y < 1e999
			end
		end
		return v2
	end
}