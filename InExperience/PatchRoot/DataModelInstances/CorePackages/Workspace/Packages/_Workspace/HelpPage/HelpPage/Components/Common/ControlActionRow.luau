local Parent = script.Parent.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ActionTextModule = require(script.Parent.ActionText)

return ReactModule.memo(function(p1) --[[ Line: 17 | Named "ControlActionRow" ]]
	-- upvalues: FoundationModule (copy), ReactModule (copy), ActionTextModule (copy)
	return ReactModule.createElement(FoundationModule.View, {
		tag = "row align-y-center gap-small size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder
	}, {
		ActionTextContainer = ReactModule.createElement(FoundationModule.View, {
			tag = "auto-y",
			Size = UDim2.new(1, -p1.iconWidth - FoundationModule.Hooks.useTokens().Gap.Small, 0, 0),
			LayoutOrder = if p1.layoutOrderReversed then 2 else 1,
			testId = p1.testId .. "Container"
		}, {
			ActionText = ReactModule.createElement(ActionTextModule, {
				actionLabels = p1.actionLabels,
				textXAlignment = if p1.layoutOrderReversed then Enum.TextXAlignment.Left else Enum.TextXAlignment.Right,
				testId = p1.testId
			})
		}),
		IconRow = p1.icon
	})
end)