-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:40 2026 Pacific Standard Time.

local assetService = game:GetService("AssetService")
local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local tryYieldModule = require(parent.util.tryYield)
local t = {
	shouldRenderTriangle_UNIT_TEST = function(vectorA, vectorB) --[[ line: 40 ]]
		return vectorA:Dot(vectorB) < 0
	end
}

local function _(p0, p1, p2) --[[ line: 29 | named "orthoProjectCoordinate" ]]
	return Vector2.new(p0:Dot(p2), p1:Dot(p2))
end

local _ = function(vectorA, vectorB) --[[ line: 36 | named "shouldRenderTriangle" ]]
	return vectorA:Dot(vectorB) < 0
end

local function getScreenCoordinatesForTriangle(vectorA, vectorB, p3, p4, p5) --[[ line: 44 ]]
	local var4 = vectorA[1]
	local var5 = vectorA[2]
	local var6 = vectorA[3]
	local var7 = CFrame.new(p4):Inverse() * var4
	local var8 = CFrame.new(p4):Inverse() * var5
	local var9 = CFrame.new(p4):Inverse() * var6
	local var10 = p5 / 2
	local var11 = (var7 + var10) / p5
	local var12 = (var8 + var10) / p5
	local var13 = (var9 + var10) / p5
	
	return Vector2.new(p3.axis1:Dot(var11), p3.axis2:Dot(var11)) * (vectorB - Vector2.new(1, 1)), Vector2.new(p3.axis1:Dot(var12), p3.axis2:Dot(var12)) * (vectorB - Vector2.new(1, 1)), Vector2.new(p3.axis1:Dot(var13), p3.axis2:Dot(var13)) * (vectorB - Vector2.new(1, 1))
end

function t.rasterMesh(p6, p7, p8, p9, p10, p11) --[[ line: 71 ]]
	-- upvalues: assetService (ref), getScreenCoordinatesForTriangle (ref), tryYieldModule (ref)
	local var14 = assetService:CreateEditableImage({ Size = p7 })
	
	for i, v in p6 do
		if v.normal:Dot(p8.normal) < 0 then
			local var15, var16, var17 = getScreenCoordinatesForTriangle(v.orderedVerts, var14.Size, p8, p9, p10)
			var14:DrawTriangle(var15, var16, var17, Color3.new(1, 1, 1), 0)
			tryYieldModule(p11)
		end
	end
	return var14
end

return t