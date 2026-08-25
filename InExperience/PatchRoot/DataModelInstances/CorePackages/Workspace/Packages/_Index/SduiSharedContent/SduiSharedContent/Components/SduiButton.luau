local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(parent.SduiCompat)

return function(p0)
	-- upvalues: reactModule (ref), foundationModule (ref)
	return reactModule.createElement(foundationModule.Button, {
		AnchorPoint = p0.anchorPoint,
		LayoutOrder = p0.layoutOrder,
		Position = p0.position,
		Selectable = p0.selectable,
		Visible = p0.visible,
		ZIndex = p0.zIndex,
		cursor = p0.cursorType,
		fillBehavior = p0.fillBehavior,
		icon = p0.icon,
		inputDelay = p0.inputDelay,
		isDisabled = p0.isDisabled,
		isLoading = p0.isLoading,
		onActivated = p0.onActivated,
		size = p0.size,
		tag = p0.tag,
		testId = p0.testId,
		text = p0.text,
		variant = p0.variant,
		width = p0.width
	})
end