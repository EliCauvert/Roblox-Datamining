local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local _ = require(parent.SduiCompat)
local skeleton = require(parent.Foundation).Skeleton

return reactModule.memo(function(p0)
	-- upvalues: reactModule (ref), skeleton (ref)
	return reactModule.createElement(skeleton, {
		radius = p0.radius,
		Size = p0.size,
		LayoutOrder = p0.layoutOrder,
		AnchorPoint = p0.anchorPoint,
		Position = p0.position,
		Visible = p0.visible,
		ZIndex = p0.zIndex,
		testId = p0.testId
	})
end)