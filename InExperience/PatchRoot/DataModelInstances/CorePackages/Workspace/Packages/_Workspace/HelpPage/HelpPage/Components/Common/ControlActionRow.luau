local parent = script.Parent.Parent.Parent.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local actionTextModule = require(script.Parent.ActionText)

return reactModule.memo(function(p1)
	-- upvalues: foundationModule (ref), reactModule (ref), actionTextModule (ref)
	return reactModule.createElement(foundationModule.View, {
		tag = "row align-y-center gap-small size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder
	}, {
		ActionTextContainer = reactModule.createElement(foundationModule.View, {
			tag = "auto-y",
			Size = UDim2.new(1, (-p1.iconWidth) - foundationModule.Hooks.useTokens().Gap.Small, 0, 0),
			LayoutOrder = if p1.layoutOrderReversed then 2 else 1,
			testId = p1.testId .. "Container"
		}, {
			ActionText = reactModule.createElement(actionTextModule, {
				actionLabels = p1.actionLabels,
				textXAlignment = if p1.layoutOrderReversed then Enum.TextXAlignment.Left else Enum.TextXAlignment.Right,
				testId = p1.testId
			})
		}),
		IconRow = p1.icon
	})
end)