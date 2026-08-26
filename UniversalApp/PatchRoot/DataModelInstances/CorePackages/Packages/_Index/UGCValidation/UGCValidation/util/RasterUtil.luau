local assetService = game:GetService("AssetService")
local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local tryYieldModule = require(parent.util.tryYield)
local t = {
	shouldRenderTriangle_UNIT_TEST = function(vectorA, vectorB)
		return vectorA:Dot(vectorB) < 0
	end
}

local function _(p1, p2, p3)
	return Vector2.new(p1:Dot(p3), p2:Dot(p3))
end

local _ = function(vectorA, vectorB)
	return vectorA:Dot(vectorB) < 0
end

local function getScreenCoordinatesForTriangle(vectorA, vectorB, p1, p2, p3)
	local var1 = vectorA[1]
	local var2 = vectorA[2]
	local var3 = vectorA[3]
	local var4 = CFrame.new(p2):Inverse() * var1
	local var5 = CFrame.new(p2):Inverse() * var2
	local var6 = CFrame.new(p2):Inverse() * var3
	local var7 = p3 / 2
	local var8 = (var4 + var7) / p3
	local var9 = (var5 + var7) / p3
	local var10 = (var6 + var7) / p3
	
	return Vector2.new(p1.axis1:Dot(var8), p1.axis2:Dot(var8)) * (vectorB - Vector2.new(1, 1)), Vector2.new(p1.axis1:Dot(var9), p1.axis2:Dot(var9)) * (vectorB - Vector2.new(1, 1)), Vector2.new(p1.axis1:Dot(var10), p1.axis2:Dot(var10)) * (vectorB - Vector2.new(1, 1))
end

function t.rasterMesh(p1, p2, p3, p4, p5, p6)
	-- upvalues: assetService (ref), getScreenCoordinatesForTriangle (ref), tryYieldModule (ref)
	local var1 = assetService:CreateEditableImage({ Size = p2 })
	
	for i, v in p1 do
		if v.normal:Dot(p3.normal) < 0 then
			local var2, var3, var4 = getScreenCoordinatesForTriangle(v.orderedVerts, var1.Size, p3, p4, p5)
			var1:DrawTriangle(var2, var3, var4, Color3.new(1, 1, 1), 0)
			tryYieldModule(p6)
		end
	end
	return var1
end

return t