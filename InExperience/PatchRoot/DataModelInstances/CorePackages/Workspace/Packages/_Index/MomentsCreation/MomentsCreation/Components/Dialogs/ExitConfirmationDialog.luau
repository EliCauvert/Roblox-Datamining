local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Dialog = FoundationModule.Dialog
local UseCreationFlowStringsModule = require(MomentsCreation.Hooks.useCreationFlowStrings)

return function(p1) --[[ Line: 19 ]]
	-- upvalues: UseCreationFlowStringsModule (copy), ReactModule (copy), Dialog (copy), FoundationModule (copy)
	local UseCreationFlowStringsModuleResult = UseCreationFlowStringsModule()
	
	return ReactModule.createElement(Dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		size = FoundationModule.Enums.DialogSize.Medium
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, {
			LayoutOrder = 1,
			text = UseCreationFlowStringsModuleResult.LeaveMomentCreationTitle
		}),
		DialogContent = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			DialogText = ReactModule.createElement(Dialog.Text, {
				Text = UseCreationFlowStringsModuleResult.LeaveMomentCreationBody
			})
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = UseCreationFlowStringsModuleResult.GeneralCtaLeave,
					variant = FoundationModule.Enums.ButtonVariant.Emphasis,
					onActivated = p1.onConfirm
				},
				{
					text = UseCreationFlowStringsModuleResult.GeneralCtaCancel,
					variant = FoundationModule.Enums.ButtonVariant.Standard,
					onActivated = p1.onCancel
				}
			}
		})
	})
end