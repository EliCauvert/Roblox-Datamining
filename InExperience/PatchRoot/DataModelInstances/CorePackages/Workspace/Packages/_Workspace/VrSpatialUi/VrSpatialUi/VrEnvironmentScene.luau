local GetSceneOverridesStoreFunction = require(script:FindFirstAncestor("VrSpatialUi").Parent.Style).getSceneOverridesStore
local SubscribeResult = nil

local function applyColorToBaseParts(CorePlatform, LargerShapes)
	for _, Part in CorePlatform:GetDescendants() do
		if Part:IsA("BasePart") then
			Part.Color = LargerShapes
		end
	end
end

local function applySceneOverrides(SceneOverrides)
	-- upvalues: applyColorToBaseParts (copy)
	if not SceneOverrides then return end
	local VREnvironment = workspace:FindFirstChild("VR Environment")
	
	if not VREnvironment then return end
	local CorePlatform = VREnvironment:FindFirstChild("Core_Platform")
	
	if CorePlatform then
		applyColorToBaseParts(CorePlatform, SceneOverrides.LargerShapes)
	end
	local MidGroundCubeFloor = VREnvironment:FindFirstChild("MidGround_CubeFloor")
	
	if MidGroundCubeFloor then
		applyColorToBaseParts(MidGroundCubeFloor, SceneOverrides.LargerShapes)
	end
end

return {
	initialize = function()
		-- upvalues: SubscribeResult (ref), GetSceneOverridesStoreFunction (copy), applySceneOverrides (copy)
		if SubscribeResult then
			SubscribeResult()
			SubscribeResult = nil
		end
		local SceneOverridesStore = GetSceneOverridesStoreFunction()
		applySceneOverrides(SceneOverridesStore.getSceneOverrides())
		SubscribeResult = SceneOverridesStore.subscribe(function(p1)
			-- upvalues: applySceneOverrides (upval)
			applySceneOverrides(p1)
		end)
	end,
	deinitialize = function()
		-- upvalues: SubscribeResult (ref)
		if SubscribeResult then
			SubscribeResult()
			SubscribeResult = nil
		end
	end,
	getVrEnvironment = function()
		return workspace:FindFirstChild("VR Environment")
	end
}