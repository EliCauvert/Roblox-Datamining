local Parent = script:FindFirstAncestor("SduiFoundation").Parent
local ReactModule = require(Parent.React)
local FloatingBanner = require(Parent.Foundation).FloatingBanner

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), FloatingBanner (copy)
	local config = {
		isOpen = p1.isOpen == nil or p1.isOpen,
		title = p1.title,
		description = p1.description,
		actions = if p1.primaryAction then { primary = { onActivated = p1.primaryAction } } else nil,
		onClose = p1.onClose,
		onCloseComplete = p1.onCloseComplete,
		testId = p1.testId
	}
	
	if p1.thumbnailComponent then
		config.thumbnail = { type = "Slot", children = p1.thumbnailComponent }
	elseif p1.thumbnailIcon then
		config.thumbnail = { type = "Icon", icon = p1.thumbnailIcon }
	elseif p1.thumbnailImage then
		config.thumbnail = { type = "Image", image = p1.thumbnailImage }
	elseif p1.thumbnailUserId then
		config.thumbnail = {
			type = "Avatar",
			userId = p1.thumbnailUserId,
			userPresence = p1.thumbnailUserPresence
		}
	end
	return ReactModule.createElement(FloatingBanner, config)
end)