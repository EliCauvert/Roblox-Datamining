local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local _ = require(parent.SduiCompat)
local skeleton = require(parent.Foundation).Skeleton

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), skeleton (ref)
	return reactModule.createElement(skeleton, {
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