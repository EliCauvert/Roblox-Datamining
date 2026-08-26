local momentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local parent = momentsCreationFlow.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local dialog = foundationModule.Dialog
local creationFlowContextModule = require(momentsCreationFlow.Context.CreationFlowContext)
local creationFlowLocalizationModule = require(momentsCreationFlow.Enums.CreationFlowLocalization)

return function(p1)
	-- upvalues: reactModule (ref), creationFlowContextModule (ref), dialog (ref), foundationModule (ref), creationFlowLocalizationModule (ref)
	local var1 = reactModule.useContext(creationFlowContextModule)
	
	return reactModule.createElement(dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		size = foundationModule.Enums.DialogSize.Medium
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, {
			LayoutOrder = 1,
			text = var1.getLocalization(creationFlowLocalizationModule.LeaveMomentCreationTitle)
		}),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			DialogText = reactModule.createElement(dialog.Text, {
				Text = var1.getLocalization(creationFlowLocalizationModule.LeaveMomentCreationBody)
			})
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = var1.getLocalization(creationFlowLocalizationModule.GeneralCtaLeave),
					variant = foundationModule.Enums.ButtonVariant.Emphasis,
					onActivated = p1.onConfirm
				},
				{
					text = var1.getLocalization(creationFlowLocalizationModule.GeneralCtaCancel),
					variant = foundationModule.Enums.ButtonVariant.Standard,
					onActivated = p1.onCancel
				}
			}
		})
	})
end