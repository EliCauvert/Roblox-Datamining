local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.SduiCompat)
local BannerContext = require(Parent.Foundation).BannerContext

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), BannerContext (copy)
	return ReactModule.createElement(BannerContext, {
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