local parent = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize

return function(p0) --[[ line: 15 | named "OutfitDetailsTopBar" ]]
	-- upvalues: reactModule (ref), foundationModule (ref), inputSize (ref), buttonVariant (ref)
	return reactModule.createElement(foundationModule.View, {
		tag = "col size-full-0 auto-y bg-surface-0",
		LayoutOrder = p0.LayoutOrder
	}, {
		StatusBarSpacer = reactModule.createElement(foundationModule.View, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, p0.statusBarHeight)
		}),
		ButtonRow = reactModule.createElement(foundationModule.View, {
			tag = "row align-y-center size-full-0 auto-y padding-medium",
			LayoutOrder = 2
		}, {
			CloseButton = reactModule.createElement(foundationModule.IconButton, {
				testId = "OutfitDetailsExitButton",
				LayoutOrder = 1,
				isCircular = true,
				size = inputSize.Small,
				icon = foundationModule.Enums.IconName.X,
				variant = buttonVariant.Standard,
				onActivated = p0.onClose
			})
		})
	})
end