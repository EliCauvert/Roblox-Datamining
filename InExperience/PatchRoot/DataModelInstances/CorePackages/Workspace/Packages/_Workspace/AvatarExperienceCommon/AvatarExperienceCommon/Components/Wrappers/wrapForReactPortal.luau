local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local foundationModule = require(parent.Foundation)

local var1 = function(p1, p2)
	-- upvalues: reactModule (ref), foundationModule (ref)
	return reactModule.createElement(foundationModule.View, {
		BackgroundTransparency = 1,
		ZIndex = 5,
		Size = UDim2.new(1, 0, 1, 0),
		ref = p2,
		selectionGroup = {
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
			SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop
		}
	}, p1)
end

return function(p1, p2, p3)
	-- upvalues: reactRobloxModule (ref), var1 (ref)
	return reactRobloxModule.createPortal(var1(p1, p3), p2)
end