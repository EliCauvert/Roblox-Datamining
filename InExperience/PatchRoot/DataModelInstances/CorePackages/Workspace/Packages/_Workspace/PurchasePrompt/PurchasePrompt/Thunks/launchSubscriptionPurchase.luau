local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local ErrorOccurredModule = require(PurchasePrompt.Actions.ErrorOccurred)
local SetEconomicRestrictionErrorModule = require(PurchasePrompt.Actions.SetEconomicRestrictionError)
local PurchaseCompleteRecievedModule = require(PurchasePrompt.Actions.PurchaseCompleteRecieved)
local SetPromptStateModule = require(PurchasePrompt.Actions.SetPromptState)
local PromptStateModule = require(PurchasePrompt.Enums.PromptState)
local PerformSubscriptionPurchaseModule = require(PurchasePrompt.Network.performSubscriptionPurchase)
local ExternalSettingsModule = require(PurchasePrompt.Services.ExternalSettings)
local NetworkModule = require(PurchasePrompt.Services.Network)
local ThunkModule = require(PurchasePrompt.Thunk)
local HideWindowModule = require(PurchasePrompt.Thunks.hideWindow)
local PurchaseErrorModule = require(PurchasePrompt.Enums.PurchaseError)
local IAPExperienceModule = require(PurchasePrompt.Parent.IAPExperience)
local IsErrorReasonPrefixWithEconomicRestrictionsFunction = IAPExperienceModule.Utility.isErrorReasonPrefixWithEconomicRestrictions
local ParseErrorReasonToEconomicRestrictionFunction = IAPExperienceModule.Utility.parseErrorReasonToEconomicRestriction
local list = { ExternalSettingsModule, NetworkModule }

return function(p1) --[[ Line: 23 | Named "launchSubscriptionPurchase" ]]
	-- upvalues: ThunkModule (copy), list (copy), ExternalSettingsModule (copy), NetworkModule (copy), PurchaseCompleteRecievedModule (copy), HideWindowModule (copy), PerformSubscriptionPurchaseModule (copy), IsErrorReasonPrefixWithEconomicRestrictionsFunction (copy), ParseErrorReasonToEconomicRestrictionFunction (copy), SetEconomicRestrictionErrorModule (copy), ErrorOccurredModule (copy), PurchaseErrorModule (copy), SetPromptStateModule (copy), PromptStateModule (copy)
	return ThunkModule.new(script.Name, list, function(p2, p3) --[[ Line: 24 ]]
		-- upvalues: ExternalSettingsModule (upval), NetworkModule (upval), PurchaseCompleteRecievedModule (upval), HideWindowModule (upval), PerformSubscriptionPurchaseModule (upval), p1 (copy), IsErrorReasonPrefixWithEconomicRestrictionsFunction (upval), ParseErrorReasonToEconomicRestrictionFunction (upval), SetEconomicRestrictionErrorModule (upval), ErrorOccurredModule (upval), PurchaseErrorModule (upval), SetPromptStateModule (upval), PromptStateModule (upval)
		local v1 = p3[NetworkModule]
		
		if p3[ExternalSettingsModule].isStudio() then
			p2:dispatch(PurchaseCompleteRecievedModule())
			p2:dispatch(HideWindowModule())
			
			return nil
		else
			PerformSubscriptionPurchaseModule(v1, p2:getState().promptRequest.id, p1):catch(function(Err) --[[ Line: 35 ]]
				-- upvalues: IsErrorReasonPrefixWithEconomicRestrictionsFunction (upval), ParseErrorReasonToEconomicRestrictionFunction (upval), p2 (copy), SetEconomicRestrictionErrorModule (upval), ErrorOccurredModule (upval), PurchaseErrorModule (upval)
				if IsErrorReasonPrefixWithEconomicRestrictionsFunction(Err) then
					local ParseErrorReasonToEconomicRestrictionResult = ParseErrorReasonToEconomicRestrictionFunction(Err)
					p2:dispatch(SetEconomicRestrictionErrorModule(ParseErrorReasonToEconomicRestrictionResult.violationType, ParseErrorReasonToEconomicRestrictionResult.timeoutMinutes))
					p2:dispatch(ErrorOccurredModule(PurchaseErrorModule.EconomicRestriction))
					
					return
				else
					p2:dispatch(ErrorOccurredModule(Err))
				end
			end)
			p2:dispatch(SetPromptStateModule(PromptStateModule.UpsellInProgress))
			p2:dispatch(HideWindowModule())
			
			return nil
		end
	end)
end