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

return function(p0)
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), externalSettingsModule (ref), fFlagEnablePurchaseFlowUUIDMigrationModule (ref), httpService (ref), setPurchaseFlowUUIDModule (ref), loggingProtocolModule (ref), purchaseFlowUUIDTelemetryModule (ref), hasPendingRequestModule (ref), requestSubscriptionPurchaseModule (ref), errorOccurredModule (ref), purchaseErrorModule (ref), getSubscriptionPurchaseInfoModule (ref), resolveSubscriptionPromptStateModule (ref)
	return thunkModule.new(script.Name, list, function(p1, p2)
		-- upvalues: networkModule (copy), externalSettingsModule (copy), fFlagEnablePurchaseFlowUUIDMigrationModule (copy), httpService (copy), setPurchaseFlowUUIDModule (copy), loggingProtocolModule (copy), purchaseFlowUUIDTelemetryModule (copy), hasPendingRequestModule (copy), requestSubscriptionPurchaseModule (copy), p0 (ref), errorOccurredModule (copy), purchaseErrorModule (copy), getSubscriptionPurchaseInfoModule (copy), resolveSubscriptionPromptStateModule (copy)
		local var16 = p2[networkModule]
		local var17 = p2[externalSettingsModule]
		
		if fFlagEnablePurchaseFlowUUIDMigrationModule then
			p1:dispatch(setPurchaseFlowUUIDModule(httpService:GenerateGUID(false)))
			loggingProtocolModule.default:logRobloxTelemetryCounter(purchaseFlowUUIDTelemetryModule.InitiatePurchaseCounter, 1, { method = "initiateSubscriptionPurchase" })
		end
		if hasPendingRequestModule(p1:getState()) then
			return nil
		end
		p1:dispatch(requestSubscriptionPurchaseModule(p0))
		
		if var17.getFlagOrder66() then
			p1:dispatch(errorOccurredModule(purchaseErrorModule.PurchaseDisabled))
			
			return nil
		end
		return getSubscriptionPurchaseInfoModule(var16, p0):andThen(function(p4)
			-- upvalues: p1 (ref), resolveSubscriptionPromptStateModule (copy)
			p1:dispatch(resolveSubscriptionPromptStateModule(p4))
		end):catch(function(p3)
			-- upvalues: p1 (ref), errorOccurredModule (copy)
			p1:dispatch(errorOccurredModule(p3))
		end)
	end)
end