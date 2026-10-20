local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local SystemBanner = require(Parent.Foundation).SystemBanner

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), SystemBanner (copy)
	return ReactModule.createElement(SystemBanner, {
		severity = p1.severity,
		variant = p1.variant,
		title = p1.title,
		description = p1.description,
		actions = p1.actions,
		onClose = p1.onClose,
		AnchorPoint = p1.anchorPoint,
		LayoutOrder = p1.layoutOrder,
		Position = p1.position,
		Visible = p1.visible,
		ZIndex = p1.zIndex,
		testId = p1.testId
	})
end)