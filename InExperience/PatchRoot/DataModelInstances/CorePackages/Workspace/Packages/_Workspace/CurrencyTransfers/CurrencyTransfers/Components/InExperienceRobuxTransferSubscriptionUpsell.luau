local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local parent = currencyTransfers.Parent
local reactModule = require(parent.React)
local transferLocalizationKeysModule = require(currencyTransfers.Localization.TransferLocalizationKeys)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local ampWizardTransferConstantsModule = require(currencyTransfers.Constants.AmpWizardTransferConstants)
local inExpAmpWizardController = require(parent.AmpUpsell).InExpAmpWizardController
local robloxSubscriptionPurchaseAppModule = require(parent.RobloxSubscriptionPurchaseApp)
local surfaceName = robloxSubscriptionPurchaseAppModule.SurfaceName
local surfaceContext = robloxSubscriptionPurchaseAppModule.SurfaceContext

return function(p0) --[[ line: 32 | named "InExperienceRobuxTransferSubscriptionUpsell" ]]
	-- upvalues: useLocalization (ref), transferLocalizationKeysModule (ref), reactModule (ref), surfaceName (ref), surfaceContext (ref), inExpAmpWizardController (ref), ampWizardTransferConstantsModule (ref)
	local onClose = p0.onClose
	local upsellSubscriptionTitle = useLocalization(transferLocalizationKeysModule.Presets.SubscriptionUpsellContainer).UpsellSubscriptionTitle or ""
	reactModule.useEffect(function() --[[ line: 43 ]]
		-- upvalues: upsellSubscriptionTitle (ref), surfaceName (copy), surfaceContext (copy), inExpAmpWizardController (copy), onClose (ref), ampWizardTransferConstantsModule (copy)
		inExpAmpWizardController.OpenAmpWizardContainerInExp("CanInitiateRobuxTransfer", function() --[[ line: 57 ]]
			-- upvalues: onClose (copy)
			onClose()
		end, {
			purchaseUIOptions = { title = upsellSubscriptionTitle },
			surfaceName = surfaceName.RobuxTransferUpsell,
			surfaceContext = surfaceContext.InGame
		}, ampWizardTransferConstantsModule.ENTRY_POINT_EVENT_CTX, nil, ampWizardTransferConstantsModule.NAMESPACE_NAME)
	end, {})
	
	return reactModule.createElement(reactModule.Fragment, {})
end