local Parent = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize

return function(Frame) --[[ Line: 15 | Named "OutfitDetailsTopBar" ]]
	-- upvalues: ReactModule (copy), FoundationModule (copy), InputSize (copy), ButtonVariant (copy)
	return ReactModule.createElement(FoundationModule.View, {
		tag = "col size-full-0 auto-y bg-surface-0",
		LayoutOrder = Frame.LayoutOrder
	}, {
		StatusBarSpacer = ReactModule.createElement(FoundationModule.View, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, Frame.statusBarHeight)
		}),
		ButtonRow = ReactModule.createElement(FoundationModule.View, {
			tag = "row align-y-center size-full-0 auto-y padding-medium",
			LayoutOrder = 2
		}, {
			CloseButton = ReactModule.createElement(FoundationModule.IconButton, {
				testId = "OutfitDetailsExitButton",
				LayoutOrder = 1,
				isCircular = true,
				size = InputSize.Small,
				icon = FoundationModule.Enums.IconName.X,
				variant = ButtonVariant.Standard,
				onActivated = Frame.onClose
			})
		})
	})
end