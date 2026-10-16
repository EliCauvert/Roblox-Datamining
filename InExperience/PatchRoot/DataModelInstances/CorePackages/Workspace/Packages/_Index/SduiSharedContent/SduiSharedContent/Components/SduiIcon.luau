local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.SduiCompat)

return ReactModule.memo(function(p1) --[[ Line: 32 | Named "SduiIcon" ]]
	-- upvalues: ReactModule (copy), FoundationModule (copy)
	return ReactModule.createElement(FoundationModule.Icon, {
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