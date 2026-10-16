local VerifiedParentalConsentDialog = script:FindFirstAncestor("VerifiedParentalConsentDialog")
local Parent = VerifiedParentalConsentDialog.Parent
local ReactModule = require(Parent.React)
local Images = require(Parent.UIBlox).App.ImageSet.Images
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local AlertPromptModule = require(VerifiedParentalConsentDialog.Components.AlertPrompt)
local _ = require(VerifiedParentalConsentDialog.VPCModalType)

return function(p1) --[[ Line: 22 | Named "VPCModalPrompt" ]]
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), AlertPromptModule (copy), Images (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		title = "Common.VerifiedParentalConsent.Label.AskParent",
		message = ({
			EnablePurchase = {
				if p1.isActionable then "Common.VerifiedParentalConsent.Description.SpendingRestrictionWithSettings" else "Common.VerifiedParentalConsent.Description.SpendingRestrictionWithoutSettings"
			}
		})[p1.modalType]
	})
	
	return ReactModule.createElement(AlertPromptModule, {
		title = UseLocalizationResult.title,
		titleIcon = Images["icons/graphic/lock_xxlarge"],
		bodyText = UseLocalizationResult.message,
		onDismiss = p1.onDismiss,
		isActionable = p1.isActionable,
		screenSize = p1.screenSize,
		onAction = p1.onAction
	})
end