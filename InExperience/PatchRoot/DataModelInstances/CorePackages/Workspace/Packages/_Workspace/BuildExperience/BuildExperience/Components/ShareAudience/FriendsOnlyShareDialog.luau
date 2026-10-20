local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local Dialog = FoundationModule.Dialog
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local DialogSize = FoundationModule.Enums.DialogSize

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), ButtonVariant (copy), ReactModule (copy), Dialog (copy), DialogSize (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		cancel = LocalizationStringsModule.SHARE_AUDIENCE_CANCEL,
		description = LocalizationStringsModule.SHARE_AUDIENCE_FRIENDS_ONLY_DESCRIPTION,
		share = LocalizationStringsModule.SHARE_AUDIENCE_SHARE,
		title = LocalizationStringsModule.SHARE_AUDIENCE_FRIENDS_ONLY_TITLE
	})
	
	return ReactModule.createElement(Dialog.Root, {
		testId = "build-friends-only-share-dialog",
		disablePortal = p1.disablePortal == true,
		hasBackdrop = p1.hasBackdrop == nil or p1.hasBackdrop,
		onClose = p1.onCancel,
		size = DialogSize.Small
	}, {
		Title = ReactModule.createElement(Dialog.Title, { LayoutOrder = 1, text = UseLocalizationResult.title }),
		Content = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			Description = ReactModule.createElement(Dialog.Text, { Text = UseLocalizationResult.description })
		}),
		Actions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = UseLocalizationResult.share,
					variant = ButtonVariant.Emphasis,
					onActivated = p1.onShare
				},
				{
					text = UseLocalizationResult.cancel,
					variant = ButtonVariant.Standard,
					onActivated = p1.onCancel
				}
			}
		})
	})
end