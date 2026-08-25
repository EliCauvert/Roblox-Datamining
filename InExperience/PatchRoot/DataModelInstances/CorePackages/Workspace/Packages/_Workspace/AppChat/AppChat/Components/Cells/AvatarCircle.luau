local parent = script:FindFirstAncestor("AppChat").Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local avatarOneToOneModule = require(script.AvatarOneToOne)
local avatarGroupModule = require(script.AvatarGroup)
local t = { presenceIndicatorSize = 14 }

return function(p0)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), avatarOneToOneModule (ref), avatarGroupModule (ref)
	local var5 = cryoModule.Dictionary.union(p0, t)
	
	return if #var5.thumbnails == 1 then reactModule.createElement(avatarOneToOneModule, {
		circleColor3 = var5.circleColor3,
		circleDividerColor3 = var5.circleDividerColor3,
		circleDividerTransparency = var5.circleDividerTransparency,
		circleInteriorBackgroundColor3 = var5.circleInteriorBackgroundColor3,
		circleInteriorBackgroundTransparency = var5.circleInteriorBackgroundTransparency,
		circleTransparency = var5.circleTransparency,
		onActivated = var5.onActivated,
		overlaySize = var5.overlaySize,
		presenceImage = var5.presenceImage,
		presenceImageColor3 = var5.presenceImageColor3,
		presenceImageTransparency = var5.presenceImageTransparency,
		presenceIndicatorSize = var5.presenceIndicatorSize,
		selectable = var5.selectable,
		showNewPresenceImage = var5.showNewPresenceImage,
		thumbnail = var5.thumbnails[1]
	}) else reactModule.createElement(avatarGroupModule, {
		circleColor3 = var5.circleColor3,
		circleDividerColor3 = var5.circleDividerColor3,
		circleDividerTransparency = var5.circleDividerTransparency,
		circleInteriorBackgroundColor3 = var5.circleInteriorBackgroundColor3,
		circleInteriorBackgroundTransparency = var5.circleInteriorBackgroundTransparency,
		circleTransparency = var5.circleTransparency,
		onActivated = var5.onActivated,
		overlaySize = var5.overlaySize,
		selectable = var5.selectable,
		thumbnails = var5.thumbnails
	})
end