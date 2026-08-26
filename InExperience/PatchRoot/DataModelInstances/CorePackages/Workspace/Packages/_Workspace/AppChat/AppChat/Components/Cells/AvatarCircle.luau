local parent = script:FindFirstAncestor("AppChat").Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local avatarOneToOneModule = require(script.AvatarOneToOne)
local avatarGroupModule = require(script.AvatarGroup)
local t = { presenceIndicatorSize = 14 }

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), avatarOneToOneModule (ref), avatarGroupModule (ref)
	local var1 = cryoModule.Dictionary.union(p1, t)
	
	return if #var1.thumbnails == 1 then reactModule.createElement(avatarOneToOneModule, {
		circleColor3 = var1.circleColor3,
		circleDividerColor3 = var1.circleDividerColor3,
		circleDividerTransparency = var1.circleDividerTransparency,
		circleInteriorBackgroundColor3 = var1.circleInteriorBackgroundColor3,
		circleInteriorBackgroundTransparency = var1.circleInteriorBackgroundTransparency,
		circleTransparency = var1.circleTransparency,
		onActivated = var1.onActivated,
		overlaySize = var1.overlaySize,
		presenceImage = var1.presenceImage,
		presenceImageColor3 = var1.presenceImageColor3,
		presenceImageTransparency = var1.presenceImageTransparency,
		presenceIndicatorSize = var1.presenceIndicatorSize,
		selectable = var1.selectable,
		showNewPresenceImage = var1.showNewPresenceImage,
		thumbnail = var1.thumbnails[1]
	}) else reactModule.createElement(avatarGroupModule, {
		circleColor3 = var1.circleColor3,
		circleDividerColor3 = var1.circleDividerColor3,
		circleDividerTransparency = var1.circleDividerTransparency,
		circleInteriorBackgroundColor3 = var1.circleInteriorBackgroundColor3,
		circleInteriorBackgroundTransparency = var1.circleInteriorBackgroundTransparency,
		circleTransparency = var1.circleTransparency,
		onActivated = var1.onActivated,
		overlaySize = var1.overlaySize,
		selectable = var1.selectable,
		thumbnails = var1.thumbnails
	})
end