local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local httpService = game:GetService("HttpService")
local _ = require(purchasePrompt.Promise)
local purchaseErrorModule = require(purchasePrompt.Enums.PurchaseError)
local setPurchaseFlowUUIDModule = require(purchasePrompt.Actions.SetPurchaseFlowUUID)
local requestSubscriptionPurchaseModule = require(purchasePrompt.Actions.RequestSubscriptionPurchase)
local errorOccurredModule = require(purchasePrompt.Actions.ErrorOccurred)
local _ = require(purchasePrompt.Network.getPremiumUpsellPrecheck)
local getSubscriptionPurchaseInfoModule = require(purchasePrompt.Network.getSubscriptionPurchaseInfo)
local networkModule = require(purchasePrompt.Services.Network)
local externalSettingsModule = require(purchasePrompt.Services.ExternalSettings)
local resolveSubscriptionPromptStateModule = require(purchasePrompt.Thunks.resolveSubscriptionPromptState)
local hasPendingRequestModule = require(purchasePrompt.Utils.hasPendingRequest)
local _ = require(parent.AppCommonLib).Logging
local thunkModule = require(purchasePrompt.Thunk)
local loggingProtocolModule = require(parent.LoggingProtocol)
local fFlagEnablePurchaseFlowUUIDMigrationModule = require(purchasePrompt.Flags.FFlagEnablePurchaseFlowUUIDMigration)
local purchaseFlowUUIDTelemetryModule = require(purchasePrompt.Events.PurchaseFlowUUIDTelemetry)
local list = { networkModule, externalSettingsModule }

return function(p1)
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), externalSettingsModule (ref), fFlagEnablePurchaseFlowUUIDMigrationModule (ref), httpService (ref), setPurchaseFlowUUIDModule (ref), loggingProtocolModule (ref), purchaseFlowUUIDTelemetryModule (ref), hasPendingRequestModule (ref), requestSubscriptionPurchaseModule (ref), errorOccurredModule (ref), purchaseErrorModule (ref), getSubscriptionPurchaseInfoModule (ref), resolveSubscriptionPromptStateModule (ref)
	return thunkModule.new(script.Name, list, function(p2, p3)
		-- upvalues: networkModule (copy), externalSettingsModule (copy), fFlagEnablePurchaseFlowUUIDMigrationModule (copy), httpService (copy), setPurchaseFlowUUIDModule (copy), loggingProtocolModule (copy), purchaseFlowUUIDTelemetryModule (copy), hasPendingRequestModule (copy), requestSubscriptionPurchaseModule (copy), p1 (ref), errorOccurredModule (copy), purchaseErrorModule (copy), getSubscriptionPurchaseInfoModule (copy), resolveSubscriptionPromptStateModule (copy)
		local var1 = p3[networkModule]
		local var2 = p3[externalSettingsModule]
		
		if fFlagEnablePurchaseFlowUUIDMigrationModule then
			p2:dispatch(setPurchaseFlowUUIDModule(httpService:GenerateGUID(false)))
			loggingProtocolModule.default:logRobloxTelemetryCounter(purchaseFlowUUIDTelemetryModule.InitiatePurchaseCounter, 1, { method = "initiateSubscriptionPurchase" })
		end
		if hasPendingRequestModule(p2:getState()) then
			return nil
		end
		p2:dispatch(requestSubscriptionPurchaseModule(p1))
		
		if var2.getFlagOrder66() then
			p2:dispatch(errorOccurredModule(purchaseErrorModule.PurchaseDisabled))
			
			return nil
		end
		return getSubscriptionPurchaseInfoModule(var1, p1):andThen(function(p4)
			-- upvalues: p2 (ref), resolveSubscriptionPromptStateModule (copy)
			p2:dispatch(resolveSubscriptionPromptStateModule(p4))
		end):catch(function(p4)
			-- upvalues: p2 (ref), errorOccurredModule (copy)
			p2:dispatch(errorOccurredModule(p4))
		end)
	end)
end