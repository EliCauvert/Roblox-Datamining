local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(parent.SduiCompat)

return reactModule.memo(function(p0)
	-- upvalues: reactModule (ref), foundationModule (ref)
	return reactModule.createElement(foundationModule.Icon, {
		name = p0.name,
		style = p0.style,
		size = p0.size,
		variant = p0.variant,
		Rotation = p0.rotation,
		AnchorPoint = p0.anchorPoint,
		LayoutOrder = p0.layoutOrder,
		Position = p0.position,
		Visible = p0.visible,
		ZIndex = p0.zIndex,
		testId = p0.testId
	}, p0.children)
end)