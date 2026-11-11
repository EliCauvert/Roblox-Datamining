local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local FoundationModule = require(Parent.Foundation)

local function v4(p1, Ref)
	-- upvalues: ReactModule (copy), FoundationModule (copy)
	return ReactModule.createElement(FoundationModule.View, {
		BackgroundTransparency = 1,
		ZIndex = 5,
		Size = UDim2.new(1, 0, 1, 0),
		ref = Ref,
		selectionGroup = {
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
			SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop
		}
	}, p1)
end

return function(p1, p2, Ref)
	-- upvalues: ReactRobloxModule (copy), v4 (copy)
	return ReactRobloxModule.createPortal(v4(p1, Ref), p2)
end