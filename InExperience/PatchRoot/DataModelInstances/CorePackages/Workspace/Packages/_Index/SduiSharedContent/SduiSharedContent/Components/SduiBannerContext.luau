local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local _ = require(parent.SduiCompat)
local bannerContext = require(parent.Foundation).BannerContext

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), bannerContext (ref)
	return reactModule.createElement(bannerContext, {
		text = p1.text,
		variant = p1.variant,
		presentation = p1.presentation,
		icon = p1.icon,
		link = p1.link,
		onClose = p1.onClose,
		AnchorPoint = p1.anchorPoint,
		LayoutOrder = p1.layoutOrder,
		Position = p1.position,
		Visible = p1.visible,
		ZIndex = p1.zIndex,
		testId = p1.testId
	})
end)