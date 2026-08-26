local parent = script:FindFirstAncestor("ExpChat").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), foundationModule (ref)
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-xy radius-circle",
		Visible = p1.Visible,
		LayoutOrder = p1.LayoutOrder,
		GroupTransparency = p1.transparencyValue
	}, {
		Progress = reactModule.createElement(foundationModule.Progress, {
			tag = "position-center-center anchor-center-center",
			ZIndex = 2,
			shape = foundationModule.Enums.ProgressShape.Circle,
			size = foundationModule.Enums.ProgressSize.Medium,
			value = p1.countdownProgress:map(function(p2)
				return math.clamp(p2, 0, 1) * 100
			end)
		}),
		Icon = reactModule.createElement(foundationModule.IconButton, {
			isCircular = true,
			icon = foundationModule.Enums.IconName.StopSmall,
			size = foundationModule.Enums.InputSize.Small,
			variant = foundationModule.Enums.ButtonVariant.Utility,
			onActivated = p1.onActivated
		})
	})
end)