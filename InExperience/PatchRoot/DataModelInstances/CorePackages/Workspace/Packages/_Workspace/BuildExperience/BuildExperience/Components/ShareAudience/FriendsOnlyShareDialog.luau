local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local dialog = foundationModule.Dialog
local buttonVariant = foundationModule.Enums.ButtonVariant
local dialogSize = foundationModule.Enums.DialogSize

return function(p1)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), buttonVariant (ref), reactModule (ref), dialog (ref), dialogSize (ref)
	local var1 = useLocalization({
		cancel = localizationStringsModule.SHARE_AUDIENCE_CANCEL,
		description = localizationStringsModule.SHARE_AUDIENCE_FRIENDS_ONLY_DESCRIPTION,
		share = localizationStringsModule.SHARE_AUDIENCE_SHARE,
		title = localizationStringsModule.SHARE_AUDIENCE_FRIENDS_ONLY_TITLE
	})
	
	return reactModule.createElement(dialog.Root, {
		testId = "build-friends-only-share-dialog",
		disablePortal = p1.disablePortal == true,
		hasBackdrop = p1.hasBackdrop == nil or p1.hasBackdrop,
		onClose = p1.onCancel,
		size = dialogSize.Small
	}, {
		Title = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = var1.title }),
		Content = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			Description = reactModule.createElement(dialog.Text, { Text = var1.description })
		}),
		Actions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = var1.share,
					variant = buttonVariant.Emphasis,
					onActivated = p1.onShare
				},
				{
					text = var1.cancel,
					variant = buttonVariant.Standard,
					onActivated = p1.onCancel
				}
			}
		})
	})
end