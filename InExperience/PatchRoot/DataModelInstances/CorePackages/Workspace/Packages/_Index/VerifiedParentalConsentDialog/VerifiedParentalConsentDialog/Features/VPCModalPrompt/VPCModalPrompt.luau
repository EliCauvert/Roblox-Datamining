local verifiedParentalConsentDialog = script:FindFirstAncestor("VerifiedParentalConsentDialog")
local parent = verifiedParentalConsentDialog.Parent
local reactModule = require(parent.React)
local images = require(parent.UIBlox).App.ImageSet.Images
local useLocalization = require(parent.Localization).Hooks.useLocalization
local alertPromptModule = require(verifiedParentalConsentDialog.Components.AlertPrompt)
local _ = require(verifiedParentalConsentDialog.VPCModalType)

return function(p0) --[[ line: 22 | named "VPCModalPrompt" ]]
	-- upvalues: useLocalization (ref), reactModule (ref), alertPromptModule (ref), images (ref)
	local var3 = useLocalization({
		title = "Common.VerifiedParentalConsent.Label.AskParent",
		message = ({
			EnablePurchase = {
				if p0.isActionable then "Common.VerifiedParentalConsent.Description.SpendingRestrictionWithSettings" else "Common.VerifiedParentalConsent.Description.SpendingRestrictionWithoutSettings"
			}
		})[p0.modalType]
	})
	
	return reactModule.createElement(alertPromptModule, {
		title = var3.title,
		titleIcon = images["icons/graphic/lock_xxlarge"],
		bodyText = var3.message,
		onDismiss = p0.onDismiss,
		isActionable = p0.isActionable,
		screenSize = p0.screenSize,
		onAction = p0.onAction
	})
end