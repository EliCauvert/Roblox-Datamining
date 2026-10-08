local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local messageInlineItemMetricsModule = require(script.Parent.MessageInlineItemMetrics)

return function(p1)
	-- upvalues: reactModule (ref), foundationModule (ref), messageInlineItemMetricsModule (ref)
	return reactModule.createElement(foundationModule.View, {
		tag = "col size-full-0 auto-y",
		sizeConstraint = {
			MinSize = Vector2.new(0, messageInlineItemMetricsModule.MIN_HEIGHT)
		}
	}, p1.children)
end