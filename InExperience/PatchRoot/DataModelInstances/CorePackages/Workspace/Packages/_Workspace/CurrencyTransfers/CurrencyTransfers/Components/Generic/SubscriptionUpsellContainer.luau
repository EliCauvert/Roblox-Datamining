local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local parent = currencyTransfers.Parent
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local transferLocalizationKeysModule = require(currencyTransfers.Localization.TransferLocalizationKeys)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useTransferStoreModule = require(currencyTransfers.Hooks.useTransferStore)
local initiateTransferModule = require(currencyTransfers.Actions.Send.initiateTransfer)
local processTransferModule = require(currencyTransfers.Actions.Send.processTransfer)
local acceptTransferModule = require(currencyTransfers.Actions.Receive.acceptTransfer)
local promptStateModule = require(currencyTransfers.Enums.PromptState)
local transferDirectionModule = require(currencyTransfers.Enums.TransferDirection)
local transferOriginationModule = require(currencyTransfers.Enums.TransferOrigination)
local transferRetryOriginModule = require(currencyTransfers.Enums.TransferRetryOrigin)
local ampWizardTransferConstantsModule = require(currencyTransfers.Constants.AmpWizardTransferConstants)
local getCounterUserIdModule = require(currencyTransfers.Utils.getCounterUserId)
local currencyTransferTelemetryModule = require(currencyTransfers.Events.CurrencyTransferTelemetry)
local robuxTransferFlowEventNameModule = require(currencyTransfers.Enums.RobuxTransferFlowEventName)
local logCurrencyTransferCounterModule = require(currencyTransfers.Utils.logCurrencyTransferCounter)
local logRobuxTransferFlowEventModule = require(currencyTransfers.Utils.logRobuxTransferFlowEvent)
local ampUpsellModule = require(parent.AmpUpsell)
local accessResponseEnum = ampUpsellModule.AmpEnums.AccessResponseEnum
local inExpAmpWizardController = ampUpsellModule.InExpAmpWizardController
local robloxSubscriptionPurchaseAppModule = require(parent.RobloxSubscriptionPurchaseApp)
local surfaceName = robloxSubscriptionPurchaseAppModule.SurfaceName
local surfaceContext = robloxSubscriptionPurchaseAppModule.SurfaceContext

return function(p1)
	-- upvalues: useTransferStoreModule (ref), useLocalization (ref), transferLocalizationKeysModule (ref), transferOriginationModule (ref), surfaceContext (ref), sharedFlagsModule (ref), robloxSubscriptionPurchaseAppModule (ref), surfaceName (ref), reactModule (ref), logCurrencyTransferCounterModule (ref), currencyTransferTelemetryModule (ref), logRobuxTransferFlowEventModule (ref), robuxTransferFlowEventNameModule (ref), promptStateModule (ref), getCounterUserIdModule (ref), inExpAmpWizardController (ref), accessResponseEnum (ref), transferRetryOriginModule (ref), acceptTransferModule (ref), initiateTransferModule (ref), processTransferModule (ref), transferDirectionModule (ref), ampWizardTransferConstantsModule (ref)
	local var1 = useTransferStoreModule()
	local var2 = useLocalization(transferLocalizationKeysModule.Presets.SubscriptionUpsellContainer)
	local direction = p1.direction
	local triggerOnClose = var1.triggerOnClose
	local selectedAmount = var1.getSelectedAmount(false)
	local transferRetryOrigin = var1.getTransferRetryOrigin(false)
	local transferClientSessionId = var1.getTransferClientSessionId(false)
	local t = {
		purchaseUIOptions = { title = var2.UpsellSubscriptionTitle or "" },
		surfaceName = surfaceName.RobuxTransferUpsell,
		surfaceContext = if var1.getTransferOrigination(false) == transferOriginationModule.InExperience then surfaceContext.InGame else surfaceContext.InApp,
		analyticsContext = if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest and transferClientSessionId ~= "" then {
			clientSessionId = {
				clientSessionIdType = robloxSubscriptionPurchaseAppModule.PurchaseClientSessionIdType.CurrencyTransferSessionId,
				clientSessionId = transferClientSessionId
			}
		} else nil
	}
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), triggerOnClose (ref), logCurrencyTransferCounterModule (copy), var1 (ref), currencyTransferTelemetryModule (copy), sharedFlagsModule (copy), logRobuxTransferFlowEventModule (copy), robuxTransferFlowEventNameModule (copy), promptStateModule (copy), getCounterUserIdModule (copy), direction (ref), inExpAmpWizardController (copy), accessResponseEnum (copy), transferRetryOrigin (ref), transferRetryOriginModule (copy), acceptTransferModule (copy), initiateTransferModule (copy), processTransferModule (copy), selectedAmount (ref), transferDirectionModule (copy), t (ref), ampWizardTransferConstantsModule (copy)
		if not p1.ampFeatureCheck then
			triggerOnClose()
			
			return
		end
		logCurrencyTransferCounterModule(var1, currencyTransferTelemetryModule.CurrencyTransferSubscriptionUpsellWizardOpenedCounter, { recourseSurface = "subscription" })
		
		if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
			logRobuxTransferFlowEventModule(var1, robuxTransferFlowEventNameModule.subscription_upsell_wizard_opened)
		end
		var1.setPreviousPromptState(var1.getPromptState(false))
		var1.setPromptState(promptStateModule.Hidden)
		local var3 = getCounterUserIdModule(var1, direction)
		inExpAmpWizardController.OpenAmpWizardContainerInExp(p1.ampFeatureCheck, function(p2, _)
			-- upvalues: accessResponseEnum (copy), logCurrencyTransferCounterModule (copy), var1 (copy), currencyTransferTelemetryModule (copy), sharedFlagsModule (copy), logRobuxTransferFlowEventModule (copy), robuxTransferFlowEventNameModule (copy), transferRetryOrigin (copy), transferRetryOriginModule (copy), acceptTransferModule (copy), initiateTransferModule (copy), processTransferModule (copy), selectedAmount (copy), direction (copy), transferDirectionModule (copy), triggerOnClose (copy)
			if p2 == accessResponseEnum.Granted then
				logCurrencyTransferCounterModule(var1, currencyTransferTelemetryModule.CurrencyTransferSubscriptionUpsellWizardResultGrantedCounter, { recourseSurface = "subscription" })
				
				if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
					logRobuxTransferFlowEventModule(var1, robuxTransferFlowEventNameModule.subscription_upsell_wizard_result_granted)
				end
				local previousPromptState = var1.getPreviousPromptState(false)
				
				if previousPromptState then
					var1.setPromptState(previousPromptState)
				end
				if transferRetryOrigin == transferRetryOriginModule.AcceptTransfer then
					acceptTransferModule(var1)
					
					return
				elseif transferRetryOrigin == transferRetryOriginModule.InitiateTransfer then
					initiateTransferModule(var1)
					
					return
				elseif transferRetryOrigin == transferRetryOriginModule.ProcessTransfer then
					processTransferModule(var1, selectedAmount or 0)
					
					return
				elseif direction == transferDirectionModule.Receive then
					acceptTransferModule(var1)
					
					return
				end
				processTransferModule(var1, selectedAmount or 0)
				
				return
			else
				logCurrencyTransferCounterModule(var1, currencyTransferTelemetryModule.CurrencyTransferSubscriptionUpsellWizardResultDeniedCounter, { recourseSurface = "subscription" })
				
				if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
					logRobuxTransferFlowEventModule(var1, robuxTransferFlowEventNameModule.subscription_upsell_wizard_result_denied)
				end
				triggerOnClose()
			end
		end, t, ampWizardTransferConstantsModule.ENTRY_POINT_EVENT_CTX, if var3 then {
			{
				name = "targetUser",
				type = "UserId",
				value = tostring(var3)
			}
		} else nil, ampWizardTransferConstantsModule.NAMESPACE_NAME)
	end, {})
	
	return reactModule.createElement(reactModule.Fragment, {})
end