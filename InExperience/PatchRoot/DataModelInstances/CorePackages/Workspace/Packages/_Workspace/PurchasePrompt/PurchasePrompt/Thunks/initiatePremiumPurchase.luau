local HttpService = game:GetService("HttpService")
local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local PromiseModule = require(PurchasePrompt.Promise)
local ThunkModule = require(PurchasePrompt.Thunk)
local PurchaseErrorModule = require(PurchasePrompt.Enums.PurchaseError)
local SetPurchaseFlowUUIDModule = require(PurchasePrompt.Actions.SetPurchaseFlowUUID)
local RequestPremiumPurchaseModule = require(PurchasePrompt.Actions.RequestPremiumPurchase)
local ErrorOccurredModule = require(PurchasePrompt.Actions.ErrorOccurred)
local GetPremiumUpsellPrecheckModule = require(PurchasePrompt.Network.getPremiumUpsellPrecheck)
local GetPremiumProductInfoModule = require(PurchasePrompt.Network.getPremiumProductInfo)
local GetAccountInfoModule = require(PurchasePrompt.Network.getAccountInfo)
local GetBalanceInfoModule = require(PurchasePrompt.Network.getBalanceInfo)
local NetworkModule = require(PurchasePrompt.Services.Network)
local ExternalSettingsModule = require(PurchasePrompt.Services.ExternalSettings)
local ResolvePremiumPromptStateModule = require(PurchasePrompt.Thunks.resolvePremiumPromptState)
local HasPendingRequestModule = require(PurchasePrompt.Utils.hasPendingRequest)
local _ = require(Parent.AppCommonLib).Logging
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local FFlagEnablePurchaseFlowUUIDMigrationModule = require(PurchasePrompt.Flags.FFlagEnablePurchaseFlowUUIDMigration)
local PurchaseFlowUUIDTelemetryModule = require(PurchasePrompt.Events.PurchaseFlowUUIDTelemetry)
local list = { NetworkModule, ExternalSettingsModule }

return function(_, _, _) --[[ Line: 33 | Named "initiatePremiumPurchase" ]]
	-- upvalues: ThunkModule (copy), list (copy), NetworkModule (copy), ExternalSettingsModule (copy), FFlagEnablePurchaseFlowUUIDMigrationModule (copy), HttpService (copy), SetPurchaseFlowUUIDModule (copy), LoggingProtocolModule (copy), PurchaseFlowUUIDTelemetryModule (copy), HasPendingRequestModule (copy), RequestPremiumPurchaseModule (copy), ErrorOccurredModule (copy), PurchaseErrorModule (copy), PromiseModule (copy), GetPremiumUpsellPrecheckModule (copy), GetPremiumProductInfoModule (copy), GetAccountInfoModule (copy), GetBalanceInfoModule (copy), ResolvePremiumPromptStateModule (copy)
	return ThunkModule.new(script.Name, list, function(p1, p2) --[[ Line: 34 ]]
		-- upvalues: NetworkModule (upval), ExternalSettingsModule (upval), FFlagEnablePurchaseFlowUUIDMigrationModule (upval), HttpService (upval), SetPurchaseFlowUUIDModule (upval), LoggingProtocolModule (upval), PurchaseFlowUUIDTelemetryModule (upval), HasPendingRequestModule (upval), RequestPremiumPurchaseModule (upval), ErrorOccurredModule (upval), PurchaseErrorModule (upval), PromiseModule (upval), GetPremiumUpsellPrecheckModule (upval), GetPremiumProductInfoModule (upval), GetAccountInfoModule (upval), GetBalanceInfoModule (upval), ResolvePremiumPromptStateModule (upval)
		local v1 = p2[NetworkModule]
		local v2 = p2[ExternalSettingsModule]
		
		if FFlagEnablePurchaseFlowUUIDMigrationModule then
			p1:dispatch(SetPurchaseFlowUUIDModule((HttpService:GenerateGUID(false))))
			LoggingProtocolModule.default:logRobloxTelemetryCounter(PurchaseFlowUUIDTelemetryModule.InitiatePurchaseCounter, 1, { method = "initiatePremiumPurchase" })
		end
		if HasPendingRequestModule(p1:getState()) then
			return nil
		end
		p1:dispatch(RequestPremiumPurchaseModule())
		
		if v2.getFlagOrder66() then
			p1:dispatch(ErrorOccurredModule(PurchaseErrorModule.PurchaseDisabled))
			
			return nil
		else
			return PromiseModule.all({
				canShowUpsell = not v2.isStudio() and GetPremiumUpsellPrecheckModule(v1) or PromiseModule.resolve(true),
				premiumProductInfo = GetPremiumProductInfoModule(v1),
				accountInfo = GetAccountInfoModule(v1, v2),
				balanceInfo = GetBalanceInfoModule(v1, v2, false)
			}):andThen(function(Result) --[[ Line: 66 ]]
				-- upvalues: p1 (copy), ResolvePremiumPromptStateModule (upval)
				p1:dispatch(ResolvePremiumPromptStateModule(Result.accountInfo, Result.balanceInfo, Result.premiumProductInfo, Result.canShowUpsell))
			end):catch(function(Err) --[[ Line: 76 ]]
				-- upvalues: p1 (copy), ErrorOccurredModule (upval)
				p1:dispatch(ErrorOccurredModule(Err))
			end)
		end
	end)
end