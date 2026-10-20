local Parent = script:FindFirstAncestor("AppChat").Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local AvatarOneToOneModule = require(script.AvatarOneToOne)
local AvatarGroupModule = require(script.AvatarGroup)
local config = { presenceIndicatorSize = 14 }

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), ReactModule (copy), AvatarOneToOneModule (copy), AvatarGroupModule (copy)
	local UnionResult = CryoModule.Dictionary.union(p1, config)
	
	return if #UnionResult.thumbnails == 1 then ReactModule.createElement(AvatarOneToOneModule, {
		circleColor3 = UnionResult.circleColor3,
		circleDividerColor3 = UnionResult.circleDividerColor3,
		circleDividerTransparency = UnionResult.circleDividerTransparency,
		circleInteriorBackgroundColor3 = UnionResult.circleInteriorBackgroundColor3,
		circleInteriorBackgroundTransparency = UnionResult.circleInteriorBackgroundTransparency,
		circleTransparency = UnionResult.circleTransparency,
		onActivated = UnionResult.onActivated,
		overlaySize = UnionResult.overlaySize,
		presenceImage = UnionResult.presenceImage,
		presenceImageColor3 = UnionResult.presenceImageColor3,
		presenceImageTransparency = UnionResult.presenceImageTransparency,
		presenceIndicatorSize = UnionResult.presenceIndicatorSize,
		selectable = UnionResult.selectable,
		showNewPresenceImage = UnionResult.showNewPresenceImage,
		thumbnail = UnionResult.thumbnails[1]
	}) else ReactModule.createElement(AvatarGroupModule, {
		circleColor3 = UnionResult.circleColor3,
		circleDividerColor3 = UnionResult.circleDividerColor3,
		circleDividerTransparency = UnionResult.circleDividerTransparency,
		circleInteriorBackgroundColor3 = UnionResult.circleInteriorBackgroundColor3,
		circleInteriorBackgroundTransparency = UnionResult.circleInteriorBackgroundTransparency,
		circleTransparency = UnionResult.circleTransparency,
		onActivated = UnionResult.onActivated,
		overlaySize = UnionResult.overlaySize,
		selectable = UnionResult.selectable,
		thumbnails = UnionResult.thumbnails
	})
end