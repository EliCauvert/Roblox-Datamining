local verifiedParentalConsentDialog = script:FindFirstAncestor("VerifiedParentalConsentDialog")
local parent = verifiedParentalConsentDialog.Parent
local reactModule = require(parent.React)
local images = require(parent.UIBlox).App.ImageSet.Images
local useLocalization = require(parent.Localization).Hooks.useLocalization
local alertPromptModule = require(verifiedParentalConsentDialog.Components.AlertPrompt)
local _ = require(verifiedParentalConsentDialog.VPCModalType)

return function(p1)
	-- upvalues: useLocalization (ref), reactModule (ref), alertPromptModule (ref), images (ref)
	local var1 = useLocalization({
		title = "Common.VerifiedParentalConsent.Label.AskParent",
		message = ({
			EnablePurchase = {
				if p1.isActionable then "Common.VerifiedParentalConsent.Description.SpendingRestrictionWithSettings" else "Common.VerifiedParentalConsent.Description.SpendingRestrictionWithoutSettings"
			}
		})[p1.modalType]
	})
	
	return reactModule.createElement(alertPromptModule, {
		title = var1.title,
		titleIcon = images["icons/graphic/lock_xxlarge"],
		bodyText = var1.message,
		onDismiss = p1.onDismiss,
		isActionable = p1.isActionable,
		screenSize = p1.screenSize,
		onAction = p1.onAction
	})
end