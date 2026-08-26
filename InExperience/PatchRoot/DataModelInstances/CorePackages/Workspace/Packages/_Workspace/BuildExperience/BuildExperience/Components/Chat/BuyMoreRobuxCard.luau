local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local button = foundationModule.Button
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local inputSize = foundationModule.Enums.InputSize

return function(p1)
	-- upvalues: reactModule (ref), view (ref), text (ref), button (ref), inputSize (ref), buttonVariant (ref), fillBehavior (ref)
	return reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y padding-large stroke-standard stroke-default radius-large",
		testId = "BuyMoreRobuxCard",
		LayoutOrder = p1.LayoutOrder
	}, {
		Title = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
			Text = p1.title
		}),
		Description = reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-emphasis",
			Text = p1.description
		}),
		Actions = reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = "row gap-small size-full-0 auto-y"
		}, {
			PrimaryAction = reactModule.createElement(button, {
				LayoutOrder = 1,
				testId = "BuyMoreRobuxCard.PrimaryAction",
				text = p1.primaryActionText,
				size = inputSize.Small,
				variant = buttonVariant.Emphasis,
				fillBehavior = fillBehavior.Fill,
				onActivated = p1.onPrimaryAction
			}),
			SecondaryAction = reactModule.createElement(button, {
				LayoutOrder = 2,
				testId = "BuyMoreRobuxCard.SecondaryAction",
				text = p1.secondaryActionText,
				size = inputSize.Small,
				variant = buttonVariant.Standard,
				fillBehavior = fillBehavior.Fill,
				onActivated = p1.onSecondaryAction
			})
		})
	})
end