local parent = script:FindFirstAncestor("MomentsCreation").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local button = foundationModule.Button
local iconButton = foundationModule.IconButton
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize

return function(p1)
	-- upvalues: reactModule (ref), view (ref), button (ref), fillBehavior (ref), inputSize (ref), iconButton (ref), iconName (ref), buttonVariant (ref)
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-small size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder
	}, {
		Primary = reactModule.createElement(view, { LayoutOrder = 1, tag = "fill auto-y" }, {
			Button = reactModule.createElement(button, {
				fillBehavior = fillBehavior.Fill,
				isDisabled = p1.primaryIsDisabled,
				isLoading = p1.primaryIsLoading,
				onActivated = p1.primaryOnActivated,
				size = inputSize.Large,
				text = p1.primaryText,
				variant = p1.primaryVariant,
				width = UDim.new(1, 0)
			})
		}),
		Delete = reactModule.createElement(iconButton, {
			LayoutOrder = 2,
			icon = iconName.TrashCan,
			onActivated = p1.onDelete,
			size = inputSize.Large,
			variant = buttonVariant.Standard
		})
	})
end