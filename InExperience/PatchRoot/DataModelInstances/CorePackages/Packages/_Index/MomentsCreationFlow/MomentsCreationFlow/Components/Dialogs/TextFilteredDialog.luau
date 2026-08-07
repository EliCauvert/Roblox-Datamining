local momentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local parent = momentsCreationFlow.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local dialog = foundationModule.Dialog
local creationFlowContextModule = require(momentsCreationFlow.Context.CreationFlowContext)
local creationFlowLocalizationModule = require(momentsCreationFlow.Enums.CreationFlowLocalization)

return function(p0) --[[ line: 16 ]]
	-- upvalues: reactModule (ref), creationFlowContextModule (ref), dialog (ref), foundationModule (ref), creationFlowLocalizationModule (ref)
	local var5 = reactModule.useContext(creationFlowContextModule)
	
	return reactModule.createElement(dialog.Root, {
		hasBackdrop = true,
		size = foundationModule.Enums.DialogSize.Medium
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, {
			LayoutOrder = 1,
			text = var5.getLocalization(creationFlowLocalizationModule.StayFriendlyModeration)
		}),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			DialogText = reactModule.createElement(dialog.Text, {
				Text = var5.getLocalization(creationFlowLocalizationModule.CommunityStandardsText)
			})
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = var5.getLocalization(creationFlowLocalizationModule.GeneralCtaOk),
					variant = foundationModule.Enums.ButtonVariant.Emphasis,
					onActivated = p0.onConfirm
				}
			}
		})
	})
end