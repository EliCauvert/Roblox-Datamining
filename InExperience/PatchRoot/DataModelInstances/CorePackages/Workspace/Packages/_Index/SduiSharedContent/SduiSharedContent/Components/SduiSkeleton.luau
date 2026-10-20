local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.SduiCompat)
local Skeleton = require(Parent.Foundation).Skeleton

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), Skeleton (copy)
	return ReactModule.createElement(Skeleton, {
		radius = p1.radius,
		Size = p1.size,
		LayoutOrder = p1.layoutOrder,
		AnchorPoint = p1.anchorPoint,
		Position = p1.position,
		Visible = p1.visible,
		ZIndex = p1.zIndex,
		testId = p1.testId
	})
end)