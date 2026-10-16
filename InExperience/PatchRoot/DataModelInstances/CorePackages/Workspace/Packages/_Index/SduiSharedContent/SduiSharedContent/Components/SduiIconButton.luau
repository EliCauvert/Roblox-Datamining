local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.SduiCompat)
local IconButton = require(Parent.Foundation).IconButton

local function v4() --[[ Line: 10 ]] end

return ReactModule.memo(function(p1) --[[ Line: 31 | Named "SduiIconButton" ]]
	-- upvalues: ReactModule (copy), IconButton (copy), v4 (copy)
	return if p1.icon and p1.icon.name then ReactModule.createElement(IconButton, {
		icon = p1.icon,
		isCircular = p1.isCircular,
		width = p1.width,
		size = p1.size,
		variant = p1.variant,
		onActivated = p1.onActivated or v4,
		LayoutOrder = p1.layoutOrder,
		AnchorPoint = p1.anchorPoint,
		Position = p1.position,
		Visible = p1.visible,
		ZIndex = p1.zIndex,
		isDisabled = p1.isDisabled,
		testId = p1.testId
	}) else nil
end)