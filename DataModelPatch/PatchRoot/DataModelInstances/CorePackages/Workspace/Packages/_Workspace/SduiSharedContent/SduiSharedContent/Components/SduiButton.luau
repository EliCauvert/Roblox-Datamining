local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.SduiCompat)

return function(p1)
	-- upvalues: ReactModule (copy), FoundationModule (copy)
	return ReactModule.createElement(FoundationModule.Button, {
		AnchorPoint = p1.anchorPoint,
		LayoutOrder = p1.layoutOrder,
		Position = p1.position,
		Selectable = p1.selectable,
		Visible = p1.visible,
		ZIndex = p1.zIndex,
		cursor = p1.cursorType,
		fillBehavior = p1.fillBehavior,
		icon = p1.icon,
		inputDelay = p1.inputDelay,
		isDisabled = p1.isDisabled,
		isLoading = p1.isLoading,
		onActivated = p1.onActivated,
		size = p1.size,
		tag = p1.tag,
		testId = p1.testId,
		text = p1.text,
		variant = p1.variant,
		width = p1.width
	})
end