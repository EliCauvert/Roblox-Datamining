local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(parent.SduiCompat)

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), foundationModule (ref)
	return reactModule.createElement(foundationModule.Icon, {
		name = p1.name,
		style = p1.style,
		size = p1.size,
		variant = p1.variant,
		Rotation = p1.rotation,
		AnchorPoint = p1.anchorPoint,
		LayoutOrder = p1.layoutOrder,
		Position = p1.position,
		Visible = p1.visible,
		ZIndex = p1.zIndex,
		testId = p1.testId
	}, p1.children)
end)