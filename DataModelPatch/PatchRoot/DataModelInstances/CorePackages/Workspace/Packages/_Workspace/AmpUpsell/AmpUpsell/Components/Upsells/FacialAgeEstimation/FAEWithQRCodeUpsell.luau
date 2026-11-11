local Parent = script:FindFirstAncestor("AmpUpsell").Parent
local ReactModule = require(Parent.React)
local QRDeepLinkDialog = require(Parent.IdentityVerification).QRDeepLinkDialog
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local AuthButtonClickFunction = require(Parent.AuthAnalytics).Events.authButtonClick

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), AuthButtonClickFunction (copy), QRDeepLinkDialog (copy)
	local AppsFlyerLink = p1.appsFlyerLink
	local OnCancelFunction = p1.onCancel
	local SessionId = p1.sessionId
	local EntryPointEventCtx = p1.entryPointEventCtx
	local AmpFAEUpsellModalQRCodeTitle = UseLocalizationFunction({
		title = "Amp.FAEUpsell.Modal.QRCode.Title",
		description = "Amp.FAEUpsell.Modal.QRCode.Description",
		footer = "Amp.FAEUpsell.Modal.QRCode.Footer"
	})
	
	return ReactModule.createElement(QRDeepLinkDialog, {
		deeplink = AppsFlyerLink,
		title = AmpFAEUpsellModalQRCodeTitle.title,
		description = AmpFAEUpsellModalQRCodeTitle.description,
		footer = AmpFAEUpsellModalQRCodeTitle.footer,
		onClose = ReactModule.useCallback(function()
			-- upvalues: AuthButtonClickFunction (upval), EntryPointEventCtx (copy), SessionId (copy), OnCancelFunction (copy)
			AuthButtonClickFunction(EntryPointEventCtx, "closeFaeQR", SessionId)
			OnCancelFunction()
		end, { OnCancelFunction, SessionId, EntryPointEventCtx })
	})
end