local getSceneOverridesStore = require(script:FindFirstAncestor("VrSpatialUi").Parent.Style).getSceneOverridesStore
local var1 = nil

local function getVrEnvironment()
	return workspace:FindFirstChild("VR Environment")
end

local function applyColorToBaseParts(p1, p2)
	for i, v in p1:GetDescendants() do
		if v:IsA("BasePart") then
			v.Color = p2
		end
	end
end

local function applySceneOverrides(p3)
	-- upvalues: applyColorToBaseParts (ref)
	if not p3 then return end
	local var2 = workspace:FindFirstChild("VR Environment")
	
	if not var2 then return end
	local corePlatform = var2:FindFirstChild("Core_Platform")
	
	if corePlatform then
		applyColorToBaseParts(corePlatform, p3.LargerShapes)
	end
	local midGroundCubeFloor = var2:FindFirstChild("MidGround_CubeFloor")
	
	if midGroundCubeFloor then
		applyColorToBaseParts(midGroundCubeFloor, p3.LargerShapes)
	end
end

return {
	initialize = function()
		-- upvalues: var1 (write), getSceneOverridesStore (ref), applySceneOverrides (ref)
		if var1 then
			var1()
			var1 = nil
		end
		local var2 = getSceneOverridesStore()
		applySceneOverrides(var2.getSceneOverrides())
		var1 = var2.subscribe(function(p3)
			-- upvalues: applySceneOverrides (copy)
			applySceneOverrides(p3)
		end)
	end,
	deinitialize = function()
		-- upvalues: var1 (write)
		if var1 then
			var1()
			var1 = nil
		end
	end,
	getVrEnvironment = getVrEnvironment
}