local Parent = script:FindFirstAncestor("PasskeyUpsell").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local ButtonSize = FoundationModule.Enums.ButtonSize
local View = FoundationModule.View
local Button = FoundationModule.Button
local PasskeyUpsellDisableButtonTimer = game:DefineFastInt("PasskeyUpsellDisableButtonTimer", 1)

return function(p1)
	-- upvalues: ReactModule (copy), View (copy), Button (copy), ButtonVariant (copy), ButtonSize (copy), FillBehavior (copy), PasskeyUpsellDisableButtonTimer (copy)
	local Tag = "gap-small align-y-center align-x-center col"
	local YOffset = 88
	local OnCancelButtonPressed = p1.localizedCancelText and p1.onCancelButtonPressed
	
	if not OnCancelButtonPressed then
		Tag = "align-y-center align-x-center col"
		YOffset = 40
	end
	return ReactModule.createElement(View, {
		tag = Tag,
		Size = UDim2.new(1, 0, 0, YOffset),
		Position = UDim2.new(0, 0, 1, -YOffset),
		LayoutOrder = p1.layoutOrder
	}, {
		ContinueButton = ReactModule.createElement(Button, {
			variant = ButtonVariant.Emphasis,
			text = p1.localizedContinueText,
			size = ButtonSize.Large,
			fillBehavior = FillBehavior.Fill,
			width = UDim.new(1, 0),
			onActivated = p1.onContinueButtonPressed,
			isDisabled = p1.isDisabled
		}),
		CancelButton = OnCancelButtonPressed and ReactModule.createElement(Button, {
			variant = ButtonVariant.Standard,
			size = ButtonSize.Large,
			fillBehavior = FillBehavior.Fill,
			width = UDim.new(1, 0),
			text = p1.localizedCancelText,
			onActivated = p1.onCancelButtonPressed,
			inputDelay = PasskeyUpsellDisableButtonTimer,
			isDisabled = p1.isDisabled
		})
	})
end