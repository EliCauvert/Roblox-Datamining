local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Dialog = FoundationModule.Dialog
local UseCreationFlowStringsModule = require(MomentsCreation.Hooks.useCreationFlowStrings)

return function(p1) --[[ Line: 18 ]]
	-- upvalues: UseCreationFlowStringsModule (copy), ReactModule (copy), Dialog (copy), FoundationModule (copy)
	local UseCreationFlowStringsModuleResult = UseCreationFlowStringsModule()
	
	return ReactModule.createElement(Dialog.Root, {
		hasBackdrop = true,
		size = FoundationModule.Enums.DialogSize.Medium
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, {
			LayoutOrder = 1,
			text = UseCreationFlowStringsModuleResult.StayFriendlyModeration
		}),
		DialogContent = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			DialogText = ReactModule.createElement(Dialog.Text, {
				Text = UseCreationFlowStringsModuleResult.CommunityStandardsText
			})
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = UseCreationFlowStringsModuleResult.GeneralCtaOk,
					variant = FoundationModule.Enums.ButtonVariant.Emphasis,
					onActivated = p1.onConfirm
				}
			}
		})
	})
end