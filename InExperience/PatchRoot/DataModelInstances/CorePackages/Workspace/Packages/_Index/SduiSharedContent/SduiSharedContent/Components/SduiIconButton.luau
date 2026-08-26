local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local _ = require(parent.SduiCompat)
local iconButton = require(parent.Foundation).IconButton

local var1 = function() end

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), iconButton (ref), var1 (ref)
	return if p1.icon and p1.icon.name then reactModule.createElement(iconButton, {
		icon = p1.icon,
		isCircular = p1.isCircular,
		width = p1.width,
		size = p1.size,
		variant = p1.variant,
		onActivated = p1.onActivated or var1,
		LayoutOrder = p1.layoutOrder,
		AnchorPoint = p1.anchorPoint,
		Position = p1.position,
		Visible = p1.visible,
		ZIndex = p1.zIndex,
		isDisabled = p1.isDisabled,
		testId = p1.testId
	}) else nil
end)