local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local button = foundationModule.Button
local iconButton = foundationModule.IconButton
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local var1 = if require(momentsCreation.Flags.FFlagMomentsTTSCompactActionBar) then inputSize.Medium else inputSize.Large

return function(p1)
	-- upvalues: reactModule (ref), view (ref), button (ref), fillBehavior (ref), var1 (ref), iconButton (ref), iconName (ref), buttonVariant (ref)
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-small size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder
	}, {
		Primary = reactModule.createElement(view, { LayoutOrder = 1, tag = "fill auto-y" }, {
			ButtonBounds = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0),
				ref = p1.primaryRef
			}, {
				Button = reactModule.createElement(button, {
					fillBehavior = fillBehavior.Fill,
					isDisabled = p1.primaryIsDisabled,
					isLoading = p1.primaryIsLoading,
					onActivated = p1.primaryOnActivated,
					size = var1,
					text = p1.primaryText,
					variant = p1.primaryVariant,
					width = UDim.new(1, 0)
				})
			})
		}),
		Delete = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			AutomaticSize = Enum.AutomaticSize.XY,
			ref = p1.deleteRef
		}, {
			IconButton = reactModule.createElement(iconButton, {
				icon = iconName.TrashCan,
				onActivated = p1.onDelete,
				size = var1,
				variant = buttonVariant.Standard
			})
		})
	})
end