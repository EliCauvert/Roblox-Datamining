local parent = script:FindFirstAncestor("ExpChat").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)

return reactModule.memo(function(p0)
	-- upvalues: reactModule (ref), foundationModule (ref)
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-xy radius-circle",
		Visible = p0.Visible,
		LayoutOrder = p0.LayoutOrder,
		GroupTransparency = p0.transparencyValue
	}, {
		Progress = reactModule.createElement(foundationModule.Progress, {
			tag = "position-center-center anchor-center-center",
			ZIndex = 2,
			shape = foundationModule.Enums.ProgressShape.Circle,
			size = foundationModule.Enums.ProgressSize.Medium,
			value = p0.countdownProgress:map(function(p1)
				return math.clamp(p1, 0, 1) * 100
			end)
		}),
		Icon = reactModule.createElement(foundationModule.IconButton, {
			isCircular = true,
			icon = foundationModule.Enums.IconName.StopSmall,
			size = foundationModule.Enums.InputSize.Small,
			variant = foundationModule.Enums.ButtonVariant.Utility,
			onActivated = p0.onActivated
		})
	})
end)