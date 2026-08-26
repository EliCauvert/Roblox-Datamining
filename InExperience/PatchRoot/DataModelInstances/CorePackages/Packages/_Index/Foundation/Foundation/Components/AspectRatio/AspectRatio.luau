local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local getTestIdTagModule = require(foundation.Utility.getTestIdTag)
local _ = require(foundation.Components.Types)

local function getAspectRatio(p1)
	-- upvalues: reactIsModule (ref)
	return if reactIsModule.isBinding(p1) or typeof(p1) == "number" then { AspectType = nil, DominantAxis = nil, AspectRatio = p1 } else {
		AspectRatio = p1.AspectRatio,
		AspectType = p1.AspectType,
		DominantAxis = p1.DominantAxis
	}
end

return reactModule.memo(function(p1)
	-- upvalues: getAspectRatio (ref), reactModule (ref), getTestIdTagModule (ref)
	local var1 = getAspectRatio(p1.value)
	
	return reactModule.createElement("UIAspectRatioConstraint", {
		AspectRatio = var1.AspectRatio,
		AspectType = var1.AspectType,
		DominantAxis = var1.DominantAxis,
		[reactModule.Tag] = getTestIdTagModule(p1.testId)
	})
end)