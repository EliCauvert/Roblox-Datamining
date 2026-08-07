local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local _ = require(parent.SduiCompat)
local iconButton = require(parent.Foundation).IconButton

local var1 = function() --[[ line: 10 ]] end

return reactModule.memo(function(p0) --[[ line: 31 | named "SduiIconButton" ]]
	-- upvalues: reactModule (ref), iconButton (ref), var1 (ref)
	return if p0.icon and p0.icon.name then reactModule.createElement(iconButton, {
		icon = p0.icon,
		isCircular = p0.isCircular,
		width = p0.width,
		size = p0.size,
		variant = p0.variant,
		onActivated = p0.onActivated or var1,
		LayoutOrder = p0.layoutOrder,
		AnchorPoint = p0.anchorPoint,
		Position = p0.position,
		Visible = p0.visible,
		ZIndex = p0.zIndex,
		isDisabled = p0.isDisabled,
		testId = p0.testId
	}) else nil
end)