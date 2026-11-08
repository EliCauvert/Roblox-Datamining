local Parent = script:FindFirstAncestor("DictationCore").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local CountdownRingModule = require(script.Parent.CountdownRing)

return ReactModule.memo(function(Frame)
	-- upvalues: ReactModule (copy), FoundationModule (copy), CountdownRingModule (copy)
	local CountdownProgress = Frame.countdownProgress
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "auto-xy radius-circle",
		Visible = Frame.Visible,
		LayoutOrder = Frame.LayoutOrder,
		GroupTransparency = Frame.transparencyValue
	}, {
		Progress = if CountdownProgress == nil then nil else ReactModule.createElement(CountdownRingModule, { countdownProgress = CountdownProgress }),
		Icon = ReactModule.createElement(FoundationModule.IconButton, {
			isCircular = true,
			icon = FoundationModule.Enums.IconName.StopSmall,
			size = FoundationModule.Enums.InputSize.Small,
			variant = FoundationModule.Enums.ButtonVariant.Utility,
			onActivated = Frame.onActivated
		})
	})
end)