local Parent = script:FindFirstAncestor("DictationCore").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)

return ReactModule.memo(function(Frame)
	-- upvalues: ReactModule (copy), FoundationModule (copy)
	local CountdownProgress = Frame.countdownProgress
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "auto-xy radius-circle",
		Visible = Frame.Visible,
		LayoutOrder = Frame.LayoutOrder,
		GroupTransparency = Frame.transparencyValue
	}, {
		Progress = if CountdownProgress == nil then nil else ReactModule.createElement(FoundationModule.Progress, {
			tag = "position-center-center anchor-center-center",
			ZIndex = 2,
			shape = FoundationModule.Enums.ProgressShape.Circle,
			size = FoundationModule.Enums.ProgressSize.Medium,
			value = CountdownProgress:map(function(Value: number): number
				return math.clamp(Value, 0, 1) * 100
			end)
		}),
		Icon = ReactModule.createElement(FoundationModule.IconButton, {
			isCircular = true,
			icon = FoundationModule.Enums.IconName.StopSmall,
			size = FoundationModule.Enums.InputSize.Small,
			variant = FoundationModule.Enums.ButtonVariant.Utility,
			onActivated = Frame.onActivated
		})
	})
end)