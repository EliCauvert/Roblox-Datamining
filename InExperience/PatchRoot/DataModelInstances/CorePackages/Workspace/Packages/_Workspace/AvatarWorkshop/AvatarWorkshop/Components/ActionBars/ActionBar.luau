local Parent = script:FindFirstAncestor("AvatarWorkshop").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local _ = FoundationModule.Enums.ButtonVariant

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), FoundationModule (copy)
	local UseTokensResult = UseTokensFunction()
	local CountActions = #p1.actions
	local SmallRatio = if CountActions > 0 then UseTokensResult.Gap.Small * (CountActions - 1) / CountActions else 0
	local Elements = {}
	
	for LayoutOrder, action in p1.actions do
		Elements[action.key] = ReactModule.createElement(FoundationModule.View, {
			tag = "row auto-y",
			Size = UDim2.new(1 / CountActions, -SmallRatio, 0, 0),
			LayoutOrder = LayoutOrder
		}, {
			Button = ReactModule.createElement(FoundationModule.Button, {
				text = action.text,
				onActivated = action.onActivated,
				variant = action.variant,
				size = FoundationModule.Enums.ButtonSize.Medium,
				fillBehavior = FoundationModule.Enums.FillBehavior.Fill,
				testId = action.testId
			})
		})
	end
	return ReactModule.createElement(FoundationModule.View, { tag = "row gap-small size-full-0 auto-y" }, Elements)
end