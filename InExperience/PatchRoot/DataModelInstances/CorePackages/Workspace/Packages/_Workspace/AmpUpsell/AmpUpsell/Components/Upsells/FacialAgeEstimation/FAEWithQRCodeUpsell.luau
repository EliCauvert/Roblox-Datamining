local parent = script:FindFirstAncestor("AmpUpsell").Parent
local reactModule = require(parent.React)
local QRDeepLinkDialog = require(parent.IdentityVerification).QRDeepLinkDialog
local useLocalization = require(parent.Localization).Hooks.useLocalization
local authButtonClick = require(parent.AuthAnalytics).Events.authButtonClick

return function(p0) --[[ line: 19 | named "FAEWithQRCodeUpsell" ]]
	-- upvalues: useLocalization (ref), reactModule (ref), authButtonClick (ref), QRDeepLinkDialog (ref)
	local appsFlyerLink = p0.appsFlyerLink
	local onCancel = p0.onCancel
	local sessionId = p0.sessionId
	local entryPointEventCtx = p0.entryPointEventCtx
	local var1 = useLocalization({
		title = "Amp.FAEUpsell.Modal.QRCode.Title",
		description = "Amp.FAEUpsell.Modal.QRCode.Description",
		footer = "Amp.FAEUpsell.Modal.QRCode.Footer"
	})
	
	return reactModule.createElement(QRDeepLinkDialog, {
		deeplink = appsFlyerLink,
		title = var1.title,
		description = var1.description,
		footer = var1.footer,
		onClose = reactModule.useCallback(function() --[[ line: 31 ]]
			-- upvalues: authButtonClick (copy), entryPointEventCtx (ref), sessionId (ref), onCancel (ref)
			authButtonClick(entryPointEventCtx, "closeFaeQR", sessionId)
			onCancel()
		end, { onCancel, sessionId, entryPointEventCtx })
	})
end