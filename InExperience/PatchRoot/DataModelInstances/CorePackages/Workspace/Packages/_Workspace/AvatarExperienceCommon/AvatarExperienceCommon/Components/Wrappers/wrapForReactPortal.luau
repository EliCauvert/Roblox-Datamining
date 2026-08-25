local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local foundationModule = require(parent.Foundation)

local var3 = function(p0, p1)
	-- upvalues: reactModule (ref), foundationModule (ref)
	return reactModule.createElement(foundationModule.View, {
		BackgroundTransparency = 1,
		ZIndex = 5,
		Size = UDim2.new(1, 0, 1, 0),
		ref = p1,
		selectionGroup = {
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
			SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop
		}
	}, p0)
end

return function(p2, p3, p4)
	-- upvalues: reactRobloxModule (ref), var3 (ref)
	return reactRobloxModule.createPortal(var3(p2, p4), p3)
end