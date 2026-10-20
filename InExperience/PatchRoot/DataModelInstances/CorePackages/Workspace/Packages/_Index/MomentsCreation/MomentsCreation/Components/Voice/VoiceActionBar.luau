local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Button = FoundationModule.Button
local IconButton = FoundationModule.IconButton
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize
local Medium = if require(MomentsCreation.Flags.FFlagMomentsTTSCompactActionBar) then InputSize.Medium else InputSize.Large

return function(p1)
	-- upvalues: ReactModule (copy), View (copy), Button (copy), FillBehavior (copy), Medium (copy), IconButton (copy), IconName (copy), ButtonVariant (copy)
	return ReactModule.createElement(View, {
		tag = "row align-y-center gap-small size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder
	}, {
		Primary = ReactModule.createElement(View, { LayoutOrder = 1, tag = "fill auto-y" }, {
			ButtonBounds = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0),
				ref = p1.primaryRef
			}, {
				Button = ReactModule.createElement(Button, {
					fillBehavior = FillBehavior.Fill,
					isDisabled = p1.primaryIsDisabled,
					isLoading = p1.primaryIsLoading,
					onActivated = p1.primaryOnActivated,
					size = Medium,
					text = p1.primaryText,
					variant = p1.primaryVariant,
					width = UDim.new(1, 0)
				})
			})
		}),
		Delete = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			AutomaticSize = Enum.AutomaticSize.XY,
			ref = p1.deleteRef
		}, {
			IconButton = ReactModule.createElement(IconButton, {
				icon = IconName.TrashCan,
				onActivated = p1.onDelete,
				size = Medium,
				variant = ButtonVariant.Standard
			})
		})
	})
end