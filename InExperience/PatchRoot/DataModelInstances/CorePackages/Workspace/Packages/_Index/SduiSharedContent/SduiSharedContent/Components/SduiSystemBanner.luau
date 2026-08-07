local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local systemBanner = require(parent.Foundation).SystemBanner

return reactModule.memo(function(p0) --[[ line: 35 | named "SduiSystemBanner" ]]
	-- upvalues: reactModule (ref), systemBanner (ref)
	return reactModule.createElement(systemBanner, {
		severity = p0.severity,
		variant = p0.variant,
		title = p0.title,
		description = p0.description,
		actions = p0.actions,
		onClose = p0.onClose,
		AnchorPoint = p0.anchorPoint,
		LayoutOrder = p0.layoutOrder,
		Position = p0.position,
		Visible = p0.visible,
		ZIndex = p0.zIndex,
		testId = p0.testId
	})
end)