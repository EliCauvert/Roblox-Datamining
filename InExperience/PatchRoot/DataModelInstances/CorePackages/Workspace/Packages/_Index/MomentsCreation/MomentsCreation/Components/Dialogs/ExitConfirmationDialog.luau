local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local dialog = foundationModule.Dialog
local useCreationFlowStringsModule = require(momentsCreation.Hooks.useCreationFlowStrings)

return function(p1)
	-- upvalues: useCreationFlowStringsModule (ref), reactModule (ref), dialog (ref), foundationModule (ref)
	local var1 = useCreationFlowStringsModule()
	
	return reactModule.createElement(dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		size = foundationModule.Enums.DialogSize.Medium
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = var1.LeaveMomentCreationTitle }),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			DialogText = reactModule.createElement(dialog.Text, { Text = var1.LeaveMomentCreationBody })
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = var1.GeneralCtaLeave,
					variant = foundationModule.Enums.ButtonVariant.Emphasis,
					onActivated = p1.onConfirm
				},
				{
					text = var1.GeneralCtaCancel,
					variant = foundationModule.Enums.ButtonVariant.Standard,
					onActivated = p1.onCancel
				}
			}
		})
	})
end