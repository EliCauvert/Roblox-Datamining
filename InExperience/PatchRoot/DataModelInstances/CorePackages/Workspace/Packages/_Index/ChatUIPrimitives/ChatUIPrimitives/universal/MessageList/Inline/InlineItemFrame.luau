local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local MessageInlineItemMetricsModule = require(script.Parent.MessageInlineItemMetrics)

return function(p1) --[[ Line: 15 | Named "InlineItemFrame" ]]
	-- upvalues: ReactModule (copy), FoundationModule (copy), MessageInlineItemMetricsModule (copy)
	return ReactModule.createElement(FoundationModule.View, {
		tag = "col size-full-0 auto-y",
		sizeConstraint = {
			MinSize = Vector2.new(0, MessageInlineItemMetricsModule.MIN_HEIGHT)
		}
	}, p1.children)
end