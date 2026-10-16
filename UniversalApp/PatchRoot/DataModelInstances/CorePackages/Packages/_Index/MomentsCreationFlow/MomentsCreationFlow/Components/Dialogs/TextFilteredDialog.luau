local MomentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local Parent = MomentsCreationFlow.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Dialog = FoundationModule.Dialog
local CreationFlowContextModule = require(MomentsCreationFlow.Context.CreationFlowContext)
local CreationFlowLocalizationModule = require(MomentsCreationFlow.Enums.CreationFlowLocalization)

return function(p1) --[[ Line: 16 ]]
	-- upvalues: ReactModule (copy), CreationFlowContextModule (copy), Dialog (copy), FoundationModule (copy), CreationFlowLocalizationModule (copy)
	local UseContextResult = ReactModule.useContext(CreationFlowContextModule)
	
	return ReactModule.createElement(Dialog.Root, {
		hasBackdrop = true,
		size = FoundationModule.Enums.DialogSize.Medium
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, {
			LayoutOrder = 1,
			text = UseContextResult.getLocalization(CreationFlowLocalizationModule.StayFriendlyModeration)
		}),
		DialogContent = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			DialogText = ReactModule.createElement(Dialog.Text, {
				Text = UseContextResult.getLocalization(CreationFlowLocalizationModule.CommunityStandardsText)
			})
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = UseContextResult.getLocalization(CreationFlowLocalizationModule.GeneralCtaOk),
					variant = FoundationModule.Enums.ButtonVariant.Emphasis,
					onActivated = p1.onConfirm
				}
			}
		})
	})
end