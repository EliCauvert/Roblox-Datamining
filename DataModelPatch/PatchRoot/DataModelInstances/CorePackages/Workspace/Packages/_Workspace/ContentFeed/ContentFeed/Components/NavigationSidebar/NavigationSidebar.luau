local Parent = script.Parent.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Icon = FoundationModule.Icon
local IconSize = FoundationModule.Enums.IconSize
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Icon (copy), IconSize (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(View, {
		tag = "align-x-center align-y-center anchor-center-left auto-xy bg-action-subtle col gap-medium items-center",
		Position = p1.position
	}, {
		PreviousButton = ReactModule.createElement(View, {
			LayoutOrder = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			isDisabled = p1.isTerminalInitialPost,
			onActivated = p1.onNavigateUp,
			Position = UDim2.fromScale(0.5, 0.5),
			tag = {
				["auto-xy bg-action-standard padding-medium radius-circle"] = true,
				["bg-action-subtle"] = p1.isTerminalInitialPost
			}
		}, {
			CycleUpIcon = ReactModule.createElement(Icon, {
				name = "icons/actions/truncationCollapse",
				ZIndex = 2,
				AnchorPoint = Vector2.new(0.5, 0.5),
				IconSize = IconSize.Small,
				Position = UDim2.fromScale(0.5, 0.5),
				style = if p1.isTerminalInitialPost then UseTokensResult.Color.None else UseTokensResult.Color.ActionEmphasis.Foreground
			})
		}),
		NextButton = ReactModule.createElement(View, {
			LayoutOrder = 2,
			AnchorPoint = Vector2.new(0.5, 0.5),
			isDisabled = p1.isTerminalFinalPost,
			onActivated = p1.onNavigateDown,
			Position = UDim2.fromScale(0.5, 0.5),
			tag = {
				["auto-xy bg-action-standard padding-medium radius-circle"] = true,
				["bg-action-subtle"] = p1.isTerminalFinalPost
			}
		}, {
			CycleDownIcon = ReactModule.createElement(Icon, {
				name = "icons/actions/truncationExpand",
				ZIndex = 2,
				AnchorPoint = Vector2.new(0.5, 0.5),
				IconSize = IconSize.Small,
				Position = UDim2.fromScale(0.5, 0.5),
				style = if p1.isTerminalFinalPost then UseTokensResult.Color.None else UseTokensResult.Color.ActionEmphasis.Foreground
			})
		})
	})
end