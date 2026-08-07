local getSceneOverridesStore = require(script:FindFirstAncestor("VrSpatialUi").Parent.Style).getSceneOverridesStore
local var0 = nil

local function getVrEnvironment() --[[ line: 24 ]]
	return workspace:FindFirstChild("VR Environment")
end

local function applyColorToBaseParts(p0, p1) --[[ line: 28 ]]
	for i, v in p0:GetDescendants() do
		if v:IsA("BasePart") then
			v.Color = p1
		end
	end
end

local function applySceneOverrides(p2) --[[ line: 36 ]]
	-- upvalues: applyColorToBaseParts (ref)
	if not p2 then return end
	local var4 = workspace:FindFirstChild("VR Environment")
	
	if not var4 then return end
	local corePlatform = var4:FindFirstChild("Core_Platform")
	
	if corePlatform then
		applyColorToBaseParts(corePlatform, p2.LargerShapes)
	end
	local midGroundCubeFloor = var4:FindFirstChild("MidGround_CubeFloor")
	
	if midGroundCubeFloor then
		applyColorToBaseParts(midGroundCubeFloor, p2.LargerShapes)
	end
end

return {
	initialize = function() --[[ line: 64 ]]
		-- upvalues: var0 (write), getSceneOverridesStore (ref), applySceneOverrides (ref)
		if var0 then
			var0()
			var0 = nil
		end
		local var7 = getSceneOverridesStore()
		applySceneOverrides(var7.getSceneOverrides())
		var0 = var7.subscribe(function(p3) --[[ line: 69 ]]
			-- upvalues: applySceneOverrides (copy)
			applySceneOverrides(p3)
		end)
	end,
	deinitialize = function() --[[ line: 57 ]]
		-- upvalues: var0 (write)
		if var0 then
			var0()
			var0 = nil
		end
	end,
	getVrEnvironment = getVrEnvironment
}