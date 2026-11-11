local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local Parent = CurrencyTransfers.Parent
local ReactModule = require(Parent.React)
local TransferLocalizationKeysModule = require(CurrencyTransfers.Localization.TransferLocalizationKeys)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local AmpWizardTransferConstantsModule = require(CurrencyTransfers.Constants.AmpWizardTransferConstants)
local InExpAmpWizardController = require(Parent.AmpUpsell).InExpAmpWizardController
local RobloxSubscriptionPurchaseAppModule = require(Parent.RobloxSubscriptionPurchaseApp)
local SurfaceName = RobloxSubscriptionPurchaseAppModule.SurfaceName
local SurfaceContext = RobloxSubscriptionPurchaseAppModule.SurfaceContext

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), TransferLocalizationKeysModule (copy), ReactModule (copy), SurfaceName (copy), SurfaceContext (copy), InExpAmpWizardController (copy), AmpWizardTransferConstantsModule (copy)
	local OnCloseFunction = p1.onClose
	local UpsellSubscriptionTitle = UseLocalizationFunction(TransferLocalizationKeysModule.Presets.SubscriptionUpsellContainer).UpsellSubscriptionTitle or ""
	ReactModule.useEffect(function()
		-- upvalues: UpsellSubscriptionTitle (copy), SurfaceName (upval), SurfaceContext (upval), InExpAmpWizardController (upval), OnCloseFunction (copy), AmpWizardTransferConstantsModule (upval)
		InExpAmpWizardController.OpenAmpWizardContainerInExp("CanInitiateRobuxTransfer", function()
			-- upvalues: OnCloseFunction (upval)
			OnCloseFunction()
		end, {
			purchaseUIOptions = { title = UpsellSubscriptionTitle },
			surfaceName = SurfaceName.RobuxTransferUpsell,
			surfaceContext = SurfaceContext.InGame
		}, AmpWizardTransferConstantsModule.ENTRY_POINT_EVENT_CTX, nil, AmpWizardTransferConstantsModule.NAMESPACE_NAME)
	end, {})
	
	return ReactModule.createElement(ReactModule.Fragment, {})
end