local AvatarExperienceSlotBasedEditor = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor")
local Parent = AvatarExperienceSlotBasedEditor.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ConstantsModule = require(AvatarExperienceSlotBasedEditor.Constants)

return function(Frame) --[[ Line: 17 | Named "OutfitDetailsActionBar" ]]
	-- upvalues: ReactModule (copy), FoundationModule (copy), ConstantsModule (copy)
	return ReactModule.createElement(FoundationModule.View, {
		tag = "col bg-surface-0",
		Size = UDim2.new(1, 0, 0, ConstantsModule.ActionBarHeight),
		LayoutOrder = Frame.LayoutOrder
	}, {
		Divider = ReactModule.createElement(FoundationModule.Divider, { LayoutOrder = 1 }),
		Buttons = ReactModule.createElement(FoundationModule.View, {
			tag = "row align-x-right align-y-center fill gap-small size-full-0 padding-x-medium",
			LayoutOrder = 2
		}, {
			RenameButton = ReactModule.createElement(FoundationModule.Button, {
				LayoutOrder = 1,
				text = Frame.renameText,
				variant = FoundationModule.Enums.ButtonVariant.Standard,
				size = FoundationModule.Enums.ButtonSize.Medium,
				onActivated = Frame.onRenameOutfit
			}),
			DeleteButton = ReactModule.createElement(FoundationModule.Button, {
				LayoutOrder = 2,
				text = Frame.deleteText,
				variant = FoundationModule.Enums.ButtonVariant.Standard,
				size = FoundationModule.Enums.ButtonSize.Medium,
				onActivated = Frame.onDeleteOutfit
			})
		})
	})
end