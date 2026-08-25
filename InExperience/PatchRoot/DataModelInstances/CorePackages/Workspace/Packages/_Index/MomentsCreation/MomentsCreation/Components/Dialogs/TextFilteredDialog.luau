local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local dialog = foundationModule.Dialog
local useCreationFlowStringsModule = require(momentsCreation.Hooks.useCreationFlowStrings)

return function(p0)
	-- upvalues: useCreationFlowStringsModule (ref), reactModule (ref), dialog (ref), foundationModule (ref)
	local var4 = useCreationFlowStringsModule()
	
	return reactModule.createElement(dialog.Root, {
		hasBackdrop = true,
		size = foundationModule.Enums.DialogSize.Medium
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = var4.StayFriendlyModeration }),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			DialogText = reactModule.createElement(dialog.Text, { Text = var4.CommunityStandardsText })
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = var4.GeneralCtaOk,
					variant = foundationModule.Enums.ButtonVariant.Emphasis,
					onActivated = p0.onConfirm
				}
			}
		})
	})
end