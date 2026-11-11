local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Button = FoundationModule.Button
local IconName = FoundationModule.Enums.IconName
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize

return function(Frame)
	-- upvalues: ReactModule (copy), View (copy), Text (copy), Button (copy), IconName (copy), InputSize (copy), ButtonVariant (copy)
	return ReactModule.createElement(View, {
		tag = "col gap-medium size-full-0 auto-y padding-medium stroke-standard stroke-emphasis radius-medium clip",
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId or "playtest-completed-card"
	}, {
		Title = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
			Text = Frame.title or "Completed game creation"
		}),
		Description = ReactModule.createElement(Text, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
			Text = Frame.description or "I've completed creating and publishing your game. You can open it to playtest."
		}),
		Playtest = ReactModule.createElement(Button, {
			LayoutOrder = 3,
			text = "Playtest",
			testId = "playtest-completed-card-playtest-button",
			icon = IconName.PlaySmall,
			size = InputSize.Small,
			variant = ButtonVariant.SoftEmphasis,
			width = UDim.new(1, 0),
			isLoading = Frame.isLoading == true,
			onActivated = Frame.onPlaytest
		})
	})
end