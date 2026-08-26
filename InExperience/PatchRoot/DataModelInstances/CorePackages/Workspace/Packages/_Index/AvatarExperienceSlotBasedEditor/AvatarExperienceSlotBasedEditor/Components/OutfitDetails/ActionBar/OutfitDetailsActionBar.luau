local avatarExperienceSlotBasedEditor = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor")
local parent = avatarExperienceSlotBasedEditor.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local constantsModule = require(avatarExperienceSlotBasedEditor.Constants)

return function(p1)
	-- upvalues: reactModule (ref), foundationModule (ref), constantsModule (ref)
	return reactModule.createElement(foundationModule.View, {
		tag = "col bg-surface-0",
		Size = UDim2.new(1, 0, 0, constantsModule.ActionBarHeight),
		LayoutOrder = p1.LayoutOrder
	}, {
		Divider = reactModule.createElement(foundationModule.Divider, { LayoutOrder = 1 }),
		Buttons = reactModule.createElement(foundationModule.View, {
			tag = "row align-x-right align-y-center fill gap-small size-full-0 padding-x-medium",
			LayoutOrder = 2
		}, {
			RenameButton = reactModule.createElement(foundationModule.Button, {
				LayoutOrder = 1,
				text = p1.renameText,
				variant = foundationModule.Enums.ButtonVariant.Standard,
				size = foundationModule.Enums.ButtonSize.Medium,
				onActivated = p1.onRenameOutfit
			}),
			DeleteButton = reactModule.createElement(foundationModule.Button, {
				LayoutOrder = 2,
				text = p1.deleteText,
				variant = foundationModule.Enums.ButtonVariant.Standard,
				size = foundationModule.Enums.ButtonSize.Medium,
				onActivated = p1.onDeleteOutfit
			})
		})
	})
end