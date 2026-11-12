local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local FFlagMomentsCreateAvatarPosts = require(Parent.SharedFlags).FFlagMomentsCreateAvatarPosts
local Dialog = FoundationModule.Dialog
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseCreationFlowStringsModule = require(MomentsCreation.Hooks.useCreationFlowStrings)
local CreationFlowStringsModule = require(MomentsCreation.creationFlowStrings)

return function(p1)
	-- upvalues: UseCreationFlowStringsModule (copy), FFlagMomentsCreateAvatarPosts (copy), UseLocalizationFunction (copy), CreationFlowStringsModule (copy), ReactModule (copy), Dialog (copy), FoundationModule (copy)
	local UseCreationFlowStringsModuleResult = UseCreationFlowStringsModule()
	local UseLocalizationResult = if FFlagMomentsCreateAvatarPosts then UseLocalizationFunction({
		body = p1.bodyLocalizationKey or CreationFlowStringsModule.LeaveMomentCreationBody
	}) else nil
	
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
				Text = if FFlagMomentsCreateAvatarPosts then UseLocalizationResult.body else UseCreationFlowStringsModuleResult.LeaveMomentCreationBody
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