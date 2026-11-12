local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local Parent = CurrencyTransfers.Parent
local ReactModule = require(Parent.React)
local SharedFlagsModule = require(Parent.SharedFlags)
local TransferLocalizationKeysModule = require(CurrencyTransfers.Localization.TransferLocalizationKeys)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseTransferStoreModule = require(CurrencyTransfers.Hooks.useTransferStore)
local InitiateTransferModule = require(CurrencyTransfers.Actions.Send.initiateTransfer)
local ProcessTransferModule = require(CurrencyTransfers.Actions.Send.processTransfer)
local AcceptTransferModule = require(CurrencyTransfers.Actions.Receive.acceptTransfer)
local PromptStateModule = require(CurrencyTransfers.Enums.PromptState)
local TransferDirectionModule = require(CurrencyTransfers.Enums.TransferDirection)
local TransferOriginationModule = require(CurrencyTransfers.Enums.TransferOrigination)
local TransferRetryOriginModule = require(CurrencyTransfers.Enums.TransferRetryOrigin)
local AmpWizardTransferConstantsModule = require(CurrencyTransfers.Constants.AmpWizardTransferConstants)
local GetCounterUserIdModule = require(CurrencyTransfers.Utils.getCounterUserId)
local CurrencyTransferTelemetryModule = require(CurrencyTransfers.Events.CurrencyTransferTelemetry)
local RobuxTransferFlowEventNameModule = require(CurrencyTransfers.Enums.RobuxTransferFlowEventName)
local LogCurrencyTransferCounterModule = require(CurrencyTransfers.Utils.logCurrencyTransferCounter)
local LogRobuxTransferFlowEventModule = require(CurrencyTransfers.Utils.logRobuxTransferFlowEvent)
local AmpUpsellModule = require(Parent.AmpUpsell)
local AccessResponseEnum = AmpUpsellModule.AmpEnums.AccessResponseEnum
local InExpAmpWizardController = AmpUpsellModule.InExpAmpWizardController
local RobloxSubscriptionPurchaseAppModule = require(Parent.RobloxSubscriptionPurchaseApp)
local SurfaceName = RobloxSubscriptionPurchaseAppModule.SurfaceName
local SurfaceContext = RobloxSubscriptionPurchaseAppModule.SurfaceContext

return function(p1)
	-- upvalues: UseTransferStoreModule (copy), UseLocalizationFunction (copy), TransferLocalizationKeysModule (copy), TransferOriginationModule (copy), SurfaceContext (copy), SharedFlagsModule (copy), RobloxSubscriptionPurchaseAppModule (copy), SurfaceName (copy), ReactModule (copy), LogCurrencyTransferCounterModule (copy), CurrencyTransferTelemetryModule (copy), LogRobuxTransferFlowEventModule (copy), RobuxTransferFlowEventNameModule (copy), PromptStateModule (copy), GetCounterUserIdModule (copy), InExpAmpWizardController (copy), AccessResponseEnum (copy), TransferRetryOriginModule (copy), AcceptTransferModule (copy), InitiateTransferModule (copy), ProcessTransferModule (copy), TransferDirectionModule (copy), AmpWizardTransferConstantsModule (copy)
	local UseTransferStoreModuleResult = UseTransferStoreModule()
	local Direction = p1.direction
	local TriggerOnCloseFunction = UseTransferStoreModuleResult.triggerOnClose
	local SelectedAmount = UseTransferStoreModuleResult.getSelectedAmount(false)
	local TransferRetryOrigin = UseTransferStoreModuleResult.getTransferRetryOrigin(false)
	local TransferClientSessionId = UseTransferStoreModuleResult.getTransferClientSessionId(false)
	local config = {
		purchaseUIOptions = {
			title = UseLocalizationFunction(TransferLocalizationKeysModule.Presets.SubscriptionUpsellContainer).UpsellSubscriptionTitle or ""
		},
		surfaceName = SurfaceName.RobuxTransferUpsell,
		surfaceContext = if UseTransferStoreModuleResult.getTransferOrigination(false) == TransferOriginationModule.InExperience then SurfaceContext.InGame else SurfaceContext.InApp,
		analyticsContext = if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest and TransferClientSessionId ~= "" then {
			clientSessionId = {
				clientSessionIdType = RobloxSubscriptionPurchaseAppModule.PurchaseClientSessionIdType.CurrencyTransferSessionId,
				clientSessionId = TransferClientSessionId
			}
		} else nil
	}
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), TriggerOnCloseFunction (copy), LogCurrencyTransferCounterModule (upval), UseTransferStoreModuleResult (copy), CurrencyTransferTelemetryModule (upval), SharedFlagsModule (upval), LogRobuxTransferFlowEventModule (upval), RobuxTransferFlowEventNameModule (upval), PromptStateModule (upval), GetCounterUserIdModule (upval), Direction (copy), InExpAmpWizardController (upval), AccessResponseEnum (upval), TransferRetryOrigin (copy), TransferRetryOriginModule (upval), AcceptTransferModule (upval), InitiateTransferModule (upval), ProcessTransferModule (upval), SelectedAmount (copy), TransferDirectionModule (upval), config (copy), AmpWizardTransferConstantsModule (upval)
		if not p1.ampFeatureCheck then
			TriggerOnCloseFunction()
			
			return
		end
		LogCurrencyTransferCounterModule(UseTransferStoreModuleResult, CurrencyTransferTelemetryModule.CurrencyTransferSubscriptionUpsellWizardOpenedCounter, { recourseSurface = "subscription" })
		
		if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
			LogRobuxTransferFlowEventModule(UseTransferStoreModuleResult, RobuxTransferFlowEventNameModule.subscription_upsell_wizard_opened)
		end
		UseTransferStoreModuleResult.setPreviousPromptState((UseTransferStoreModuleResult.getPromptState(false)))
		UseTransferStoreModuleResult.setPromptState(PromptStateModule.Hidden)
		local CounterUserIdModule = GetCounterUserIdModule(UseTransferStoreModuleResult, Direction)
		InExpAmpWizardController.OpenAmpWizardContainerInExp(p1.ampFeatureCheck, function(Granted, _)
			-- upvalues: AccessResponseEnum (upval), LogCurrencyTransferCounterModule (upval), UseTransferStoreModuleResult (upval), CurrencyTransferTelemetryModule (upval), SharedFlagsModule (upval), LogRobuxTransferFlowEventModule (upval), RobuxTransferFlowEventNameModule (upval), TransferRetryOrigin (upval), TransferRetryOriginModule (upval), AcceptTransferModule (upval), InitiateTransferModule (upval), ProcessTransferModule (upval), SelectedAmount (upval), Direction (upval), TransferDirectionModule (upval), TriggerOnCloseFunction (upval)
			if Granted == AccessResponseEnum.Granted then
				LogCurrencyTransferCounterModule(UseTransferStoreModuleResult, CurrencyTransferTelemetryModule.CurrencyTransferSubscriptionUpsellWizardResultGrantedCounter, { recourseSurface = "subscription" })
				
				if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
					LogRobuxTransferFlowEventModule(UseTransferStoreModuleResult, RobuxTransferFlowEventNameModule.subscription_upsell_wizard_result_granted)
				end
				local PreviousPromptState = UseTransferStoreModuleResult.getPreviousPromptState(false)
				
				if PreviousPromptState then
					UseTransferStoreModuleResult.setPromptState(PreviousPromptState)
				end
				if TransferRetryOrigin == TransferRetryOriginModule.AcceptTransfer then
					AcceptTransferModule(UseTransferStoreModuleResult)
					
					return
				end
				if TransferRetryOrigin == TransferRetryOriginModule.InitiateTransfer then
					InitiateTransferModule(UseTransferStoreModuleResult)
					
					return
				end
				if TransferRetryOrigin == TransferRetryOriginModule.ProcessTransfer then
					ProcessTransferModule(UseTransferStoreModuleResult, SelectedAmount or 0)
					
					return
				end
				if Direction == TransferDirectionModule.Receive then
					AcceptTransferModule(UseTransferStoreModuleResult)
					
					return
				else
					ProcessTransferModule(UseTransferStoreModuleResult, SelectedAmount or 0)
					
					return
				end
			else
				LogCurrencyTransferCounterModule(UseTransferStoreModuleResult, CurrencyTransferTelemetryModule.CurrencyTransferSubscriptionUpsellWizardResultDeniedCounter, { recourseSurface = "subscription" })
				
				if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
					LogRobuxTransferFlowEventModule(UseTransferStoreModuleResult, RobuxTransferFlowEventNameModule.subscription_upsell_wizard_result_denied)
				end
				TriggerOnCloseFunction()
			end
		end, config, AmpWizardTransferConstantsModule.ENTRY_POINT_EVENT_CTX, if CounterUserIdModule then {
			{
				name = "targetUser",
				type = "UserId",
				value = tostring(CounterUserIdModule)
			}
		} else nil, AmpWizardTransferConstantsModule.NAMESPACE_NAME)
	end, {})
	
	return ReactModule.createElement(ReactModule.Fragment, {})
end