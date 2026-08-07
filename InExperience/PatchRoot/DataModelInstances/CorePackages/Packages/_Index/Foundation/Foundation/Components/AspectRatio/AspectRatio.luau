local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local getTestIdTagModule = require(foundation.Utility.getTestIdTag)
local _ = require(foundation.Components.Types)

local function getAspectRatio(p0) --[[ line: 14 ]]
	-- upvalues: reactIsModule (ref)
	return if reactIsModule.isBinding(p0) or typeof(p0) == "number" then { AspectType = nil, DominantAxis = nil, AspectRatio = p0 } else {
		AspectRatio = p0.AspectRatio,
		AspectType = p0.AspectType,
		DominantAxis = p0.DominantAxis
	}
end

return reactModule.memo(function(p1) --[[ line: 41 | named "AspectRatio" ]]
	-- upvalues: getAspectRatio (ref), reactModule (ref), getTestIdTagModule (ref)
	local var5 = getAspectRatio(p1.value)
	
	return reactModule.createElement("UIAspectRatioConstraint", {
		AspectRatio = var5.AspectRatio,
		AspectType = var5.AspectType,
		DominantAxis = var5.DominantAxis,
		[reactModule.Tag] = getTestIdTagModule(p1.testId)
	})
end)