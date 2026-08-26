local httpService = game:GetService("HttpService")
local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local promiseModule = require(purchasePrompt.Promise)
local thunkModule = require(purchasePrompt.Thunk)
local purchaseErrorModule = require(purchasePrompt.Enums.PurchaseError)
local setPurchaseFlowUUIDModule = require(purchasePrompt.Actions.SetPurchaseFlowUUID)
local requestPremiumPurchaseModule = require(purchasePrompt.Actions.RequestPremiumPurchase)
local errorOccurredModule = require(purchasePrompt.Actions.ErrorOccurred)
local getPremiumUpsellPrecheckModule = require(purchasePrompt.Network.getPremiumUpsellPrecheck)
local getPremiumProductInfoModule = require(purchasePrompt.Network.getPremiumProductInfo)
local getAccountInfoModule = require(purchasePrompt.Network.getAccountInfo)
local getBalanceInfoModule = require(purchasePrompt.Network.getBalanceInfo)
local networkModule = require(purchasePrompt.Services.Network)
local externalSettingsModule = require(purchasePrompt.Services.ExternalSettings)
local resolvePremiumPromptStateModule = require(purchasePrompt.Thunks.resolvePremiumPromptState)
local hasPendingRequestModule = require(purchasePrompt.Utils.hasPendingRequest)
local _ = require(parent.AppCommonLib).Logging
local loggingProtocolModule = require(parent.LoggingProtocol)
local fFlagEnablePurchaseFlowUUIDMigrationModule = require(purchasePrompt.Flags.FFlagEnablePurchaseFlowUUIDMigration)
local purchaseFlowUUIDTelemetryModule = require(purchasePrompt.Events.PurchaseFlowUUIDTelemetry)
local list = { networkModule, externalSettingsModule }

return function(_, _, _)
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), externalSettingsModule (ref), fFlagEnablePurchaseFlowUUIDMigrationModule (ref), httpService (ref), setPurchaseFlowUUIDModule (ref), loggingProtocolModule (ref), purchaseFlowUUIDTelemetryModule (ref), hasPendingRequestModule (ref), requestPremiumPurchaseModule (ref), errorOccurredModule (ref), purchaseErrorModule (ref), promiseModule (ref), getPremiumUpsellPrecheckModule (ref), getPremiumProductInfoModule (ref), getAccountInfoModule (ref), getBalanceInfoModule (ref), resolvePremiumPromptStateModule (ref)
	return thunkModule.new(script.Name, list, function(p1, p2)
		-- upvalues: networkModule (copy), externalSettingsModule (copy), fFlagEnablePurchaseFlowUUIDMigrationModule (copy), httpService (copy), setPurchaseFlowUUIDModule (copy), loggingProtocolModule (copy), purchaseFlowUUIDTelemetryModule (copy), hasPendingRequestModule (copy), requestPremiumPurchaseModule (copy), errorOccurredModule (copy), purchaseErrorModule (copy), promiseModule (copy), getPremiumUpsellPrecheckModule (copy), getPremiumProductInfoModule (copy), getAccountInfoModule (copy), getBalanceInfoModule (copy), resolvePremiumPromptStateModule (copy)
		local var1 = p2[networkModule]
		local var2 = p2[externalSettingsModule]
		
		if fFlagEnablePurchaseFlowUUIDMigrationModule then
			p1:dispatch(setPurchaseFlowUUIDModule(httpService:GenerateGUID(false)))
			loggingProtocolModule.default:logRobloxTelemetryCounter(purchaseFlowUUIDTelemetryModule.InitiatePurchaseCounter, 1, { method = "initiatePremiumPurchase" })
		end
		if hasPendingRequestModule(p1:getState()) then
			return nil
		end
		p1:dispatch(requestPremiumPurchaseModule())
		
		if var2.getFlagOrder66() then
			p1:dispatch(errorOccurredModule(purchaseErrorModule.PurchaseDisabled))
			
			return nil
		end
		return promiseModule.all({
			canShowUpsell = not var2.isStudio() and getPremiumUpsellPrecheckModule(var1) or promiseModule.resolve(true),
			premiumProductInfo = getPremiumProductInfoModule(var1),
			accountInfo = getAccountInfoModule(var1, var2),
			balanceInfo = getBalanceInfoModule(var1, var2, false)
		}):andThen(function(p3)
			-- upvalues: p1 (ref), resolvePremiumPromptStateModule (copy)
			p1:dispatch(resolvePremiumPromptStateModule(p3.accountInfo, p3.balanceInfo, p3.premiumProductInfo, p3.canShowUpsell))
		end):catch(function(p3)
			-- upvalues: p1 (ref), errorOccurredModule (copy)
			p1:dispatch(errorOccurredModule(p3))
		end)
	end)
end