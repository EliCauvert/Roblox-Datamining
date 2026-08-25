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

return function(p0)
	-- upvalues: thunkModule (ref), list (ref), externalSettingsModule (ref), networkModule (ref), purchaseCompleteRecievedModule (ref), hideWindowModule (ref), performSubscriptionPurchaseModule (ref), isErrorReasonPrefixWithEconomicRestrictions (ref), parseErrorReasonToEconomicRestriction (ref), setEconomicRestrictionErrorModule (ref), errorOccurredModule (ref), purchaseErrorModule (ref), setPromptStateModule (ref), promptStateModule (ref)
	return thunkModule.new(script.Name, list, function(p1, p2)
		-- upvalues: externalSettingsModule (copy), networkModule (copy), purchaseCompleteRecievedModule (copy), hideWindowModule (copy), performSubscriptionPurchaseModule (copy), p0 (ref), isErrorReasonPrefixWithEconomicRestrictions (copy), parseErrorReasonToEconomicRestriction (copy), setEconomicRestrictionErrorModule (copy), errorOccurredModule (copy), purchaseErrorModule (copy), setPromptStateModule (copy), promptStateModule (copy)
		local var14 = p2[networkModule]
		
		if p2[externalSettingsModule].isStudio() then
			p1:dispatch(purchaseCompleteRecievedModule())
			p1:dispatch(hideWindowModule())
			
			return nil
		end
		performSubscriptionPurchaseModule(var14, p1:getState().promptRequest.id, p0):catch(function(p3)
			-- upvalues: isErrorReasonPrefixWithEconomicRestrictions (copy), parseErrorReasonToEconomicRestriction (copy), p1 (ref), setEconomicRestrictionErrorModule (copy), errorOccurredModule (copy), purchaseErrorModule (copy)
			if isErrorReasonPrefixWithEconomicRestrictions(p3) then
				local var15 = parseErrorReasonToEconomicRestriction(p3)
				p1:dispatch(setEconomicRestrictionErrorModule(var15.violationType, var15.timeoutMinutes))
				p1:dispatch(errorOccurredModule(purchaseErrorModule.EconomicRestriction))
				
				return
			end
			p1:dispatch(errorOccurredModule(p3))
		end)
		p1:dispatch(setPromptStateModule(promptStateModule.UpsellInProgress))
		p1:dispatch(hideWindowModule())
		
		return nil
	end)
end