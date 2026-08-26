local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local errorOccurredModule = require(purchasePrompt.Actions.ErrorOccurred)
local setEconomicRestrictionErrorModule = require(purchasePrompt.Actions.SetEconomicRestrictionError)
local purchaseCompleteRecievedModule = require(purchasePrompt.Actions.PurchaseCompleteRecieved)
local setPromptStateModule = require(purchasePrompt.Actions.SetPromptState)
local promptStateModule = require(purchasePrompt.Enums.PromptState)
local performSubscriptionPurchaseModule = require(purchasePrompt.Network.performSubscriptionPurchase)
local externalSettingsModule = require(purchasePrompt.Services.ExternalSettings)
local networkModule = require(purchasePrompt.Services.Network)
local thunkModule = require(purchasePrompt.Thunk)
local hideWindowModule = require(purchasePrompt.Thunks.hideWindow)
local purchaseErrorModule = require(purchasePrompt.Enums.PurchaseError)
local IAPExperienceModule = require(parent.IAPExperience)
local isErrorReasonPrefixWithEconomicRestrictions = IAPExperienceModule.Utility.isErrorReasonPrefixWithEconomicRestrictions
local parseErrorReasonToEconomicRestriction = IAPExperienceModule.Utility.parseErrorReasonToEconomicRestriction
local list = { externalSettingsModule, networkModule }

return function(p1)
	-- upvalues: thunkModule (ref), list (ref), externalSettingsModule (ref), networkModule (ref), purchaseCompleteRecievedModule (ref), hideWindowModule (ref), performSubscriptionPurchaseModule (ref), isErrorReasonPrefixWithEconomicRestrictions (ref), parseErrorReasonToEconomicRestriction (ref), setEconomicRestrictionErrorModule (ref), errorOccurredModule (ref), purchaseErrorModule (ref), setPromptStateModule (ref), promptStateModule (ref)
	return thunkModule.new(script.Name, list, function(p2, p3)
		-- upvalues: externalSettingsModule (copy), networkModule (copy), purchaseCompleteRecievedModule (copy), hideWindowModule (copy), performSubscriptionPurchaseModule (copy), p1 (ref), isErrorReasonPrefixWithEconomicRestrictions (copy), parseErrorReasonToEconomicRestriction (copy), setEconomicRestrictionErrorModule (copy), errorOccurredModule (copy), purchaseErrorModule (copy), setPromptStateModule (copy), promptStateModule (copy)
		local var1 = p3[networkModule]
		
		if p3[externalSettingsModule].isStudio() then
			p2:dispatch(purchaseCompleteRecievedModule())
			p2:dispatch(hideWindowModule())
			
			return nil
		end
		performSubscriptionPurchaseModule(var1, p2:getState().promptRequest.id, p1):catch(function(p4)
			-- upvalues: isErrorReasonPrefixWithEconomicRestrictions (copy), parseErrorReasonToEconomicRestriction (copy), p2 (ref), setEconomicRestrictionErrorModule (copy), errorOccurredModule (copy), purchaseErrorModule (copy)
			if isErrorReasonPrefixWithEconomicRestrictions(p4) then
				local var2 = parseErrorReasonToEconomicRestriction(p4)
				p2:dispatch(setEconomicRestrictionErrorModule(var2.violationType, var2.timeoutMinutes))
				p2:dispatch(errorOccurredModule(purchaseErrorModule.EconomicRestriction))
				
				return
			end
			p2:dispatch(errorOccurredModule(p4))
		end)
		p2:dispatch(setPromptStateModule(promptStateModule.UpsellInProgress))
		p2:dispatch(hideWindowModule())
		
		return nil
	end)
end