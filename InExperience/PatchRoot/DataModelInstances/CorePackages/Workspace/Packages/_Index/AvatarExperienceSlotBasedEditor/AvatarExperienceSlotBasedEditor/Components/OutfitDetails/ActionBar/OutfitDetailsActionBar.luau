local avatarExperienceSlotBasedEditor = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor")
local parent = avatarExperienceSlotBasedEditor.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local constantsModule = require(avatarExperienceSlotBasedEditor.Constants)

return function(p0)
	-- upvalues: reactModule (ref), foundationModule (ref), constantsModule (ref)
	return reactModule.createElement(foundationModule.View, {
		tag = "col bg-surface-0",
		Size = UDim2.new(1, 0, 0, constantsModule.ActionBarHeight),
		LayoutOrder = p0.LayoutOrder
	}, {
		Divider = reactModule.createElement(foundationModule.Divider, { LayoutOrder = 1 }),
		Buttons = reactModule.createElement(foundationModule.View, {
			tag = "row align-x-right align-y-center fill gap-small size-full-0 padding-x-medium",
			LayoutOrder = 2
		}, {
			RenameButton = reactModule.createElement(foundationModule.Button, {
				LayoutOrder = 1,
				text = p0.renameText,
				variant = foundationModule.Enums.ButtonVariant.Standard,
				size = foundationModule.Enums.ButtonSize.Medium,
				onActivated = p0.onRenameOutfit
			}),
			DeleteButton = reactModule.createElement(foundationModule.Button, {
				LayoutOrder = 2,
				text = p0.deleteText,
				variant = foundationModule.Enums.ButtonVariant.Standard,
				size = foundationModule.Enums.ButtonSize.Medium,
				onActivated = p0.onDeleteOutfit
			})
		})
	})
end