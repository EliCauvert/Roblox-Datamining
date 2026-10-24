local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local HttpService = game:GetService("HttpService")
local _ = require(PurchasePrompt.Promise)
local PurchaseErrorModule = require(PurchasePrompt.Enums.PurchaseError)
local SetPurchaseFlowUUIDModule = require(PurchasePrompt.Actions.SetPurchaseFlowUUID)
local RequestSubscriptionPurchaseModule = require(PurchasePrompt.Actions.RequestSubscriptionPurchase)
local ErrorOccurredModule = require(PurchasePrompt.Actions.ErrorOccurred)
local GetSubscriptionPurchaseInfoModule = require(PurchasePrompt.Network.getSubscriptionPurchaseInfo)
local NetworkModule = require(PurchasePrompt.Services.Network)
local ExternalSettingsModule = require(PurchasePrompt.Services.ExternalSettings)
local ResolveSubscriptionPromptStateModule = require(PurchasePrompt.Thunks.resolveSubscriptionPromptState)
local HasPendingRequestModule = require(PurchasePrompt.Utils.hasPendingRequest)
local _ = require(Parent.AppCommonLib).Logging
local ThunkModule = require(PurchasePrompt.Thunk)
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local FFlagEnablePurchaseFlowUUIDMigrationModule = require(PurchasePrompt.Flags.FFlagEnablePurchaseFlowUUIDMigration)
local PurchaseFlowUUIDTelemetryModule = require(PurchasePrompt.Events.PurchaseFlowUUIDTelemetry)
local list = { NetworkModule, ExternalSettingsModule }

return function(p1)
	-- upvalues: ThunkModule (copy), list (copy), NetworkModule (copy), ExternalSettingsModule (copy), FFlagEnablePurchaseFlowUUIDMigrationModule (copy), HttpService (copy), SetPurchaseFlowUUIDModule (copy), LoggingProtocolModule (copy), PurchaseFlowUUIDTelemetryModule (copy), HasPendingRequestModule (copy), RequestSubscriptionPurchaseModule (copy), ErrorOccurredModule (copy), PurchaseErrorModule (copy), GetSubscriptionPurchaseInfoModule (copy), ResolveSubscriptionPromptStateModule (copy)
	return ThunkModule.new(script.Name, list, function(p2, p3)
		-- upvalues: NetworkModule (upval), ExternalSettingsModule (upval), FFlagEnablePurchaseFlowUUIDMigrationModule (upval), HttpService (upval), SetPurchaseFlowUUIDModule (upval), LoggingProtocolModule (upval), PurchaseFlowUUIDTelemetryModule (upval), HasPendingRequestModule (upval), RequestSubscriptionPurchaseModule (upval), p1 (copy), ErrorOccurredModule (upval), PurchaseErrorModule (upval), GetSubscriptionPurchaseInfoModule (upval), ResolveSubscriptionPromptStateModule (upval)
		local v1 = p3[NetworkModule]
		local v2 = p3[ExternalSettingsModule]
		
		if FFlagEnablePurchaseFlowUUIDMigrationModule then
			p2:dispatch(SetPurchaseFlowUUIDModule((HttpService:GenerateGUID(false))))
			LoggingProtocolModule.default:logRobloxTelemetryCounter(PurchaseFlowUUIDTelemetryModule.InitiatePurchaseCounter, 1, { method = "initiateSubscriptionPurchase" })
		end
		if HasPendingRequestModule(p2:getState()) then
			return nil
		end
		p2:dispatch(RequestSubscriptionPurchaseModule(p1))
		
		if v2.getFlagOrder66() then
			p2:dispatch(ErrorOccurredModule(PurchaseErrorModule.PurchaseDisabled))
			
			return nil
		else
			return GetSubscriptionPurchaseInfoModule(v1, p1):andThen(function(Result)
				-- upvalues: p2 (copy), ResolveSubscriptionPromptStateModule (upval)
				p2:dispatch(ResolveSubscriptionPromptStateModule(Result))
			end):catch(function(Err)
				-- upvalues: p2 (copy), ErrorOccurredModule (upval)
				p2:dispatch(ErrorOccurredModule(Err))
			end)
		end
	end)
end