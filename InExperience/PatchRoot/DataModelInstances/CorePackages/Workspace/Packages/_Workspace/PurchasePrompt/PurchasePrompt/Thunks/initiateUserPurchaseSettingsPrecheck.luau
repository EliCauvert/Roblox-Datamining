local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local upsellFlowModule = require(purchasePrompt.Enums.UpsellFlow)
local networkModule = require(purchasePrompt.Services.Network)
local checkUserPurchaseSettingsModule = require(purchasePrompt.Network.checkUserPurchaseSettings)
local getUpsellFlowModule = require(purchasePrompt.NativeUpsell.getUpsellFlow)
local analyticsModule = require(purchasePrompt.Services.Analytics)
local externalSettingsModule = require(purchasePrompt.Services.ExternalSettings)
local errorOccurredModule = require(purchasePrompt.Actions.ErrorOccurred)
local setEconomicRestrictionErrorModule = require(purchasePrompt.Actions.SetEconomicRestrictionError)
local purchaseErrorModule = require(purchasePrompt.Enums.PurchaseError)
local thunkModule = require(purchasePrompt.Thunk)
local initiatePurchasePrecheckModule = require(purchasePrompt.Thunks.initiatePurchasePrecheck)
local setPromptStateModule = require(purchasePrompt.Actions.SetPromptState)
local promptStateModule = require(purchasePrompt.Enums.PromptState)
local IAPExperienceModule = require(parent.IAPExperience)
local checkUserPurchaseSettingsFailureReason = IAPExperienceModule.Enums.CheckUserPurchaseSettingsFailureReason
local mapCheckUserPurchaseSettingsFailureReasonToViolationType = IAPExperienceModule.Utility.mapCheckUserPurchaseSettingsFailureReasonToViolationType
local economicRestrictionsViolationType = IAPExperienceModule.Enums.EconomicRestrictionsViolationType
local list = { analyticsModule, networkModule, externalSettingsModule }

local function _(p1)
	-- upvalues: mapCheckUserPurchaseSettingsFailureReasonToViolationType (ref), economicRestrictionsViolationType (ref)
	return if p1 == nil then false else (if p1.isEligible ~= nil then p1.failureReason == nil else true) and not (mapCheckUserPurchaseSettingsFailureReasonToViolationType(p1.failureReason) ~= economicRestrictionsViolationType.None and p1.expirationTimeInMinutes ~= nil)
end

return function()
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), analyticsModule (ref), externalSettingsModule (ref), initiatePurchasePrecheckModule (ref), getUpsellFlowModule (ref), upsellFlowModule (ref), checkUserPurchaseSettingsModule (ref), mapCheckUserPurchaseSettingsFailureReasonToViolationType (ref), economicRestrictionsViolationType (ref), errorOccurredModule (ref), purchaseErrorModule (ref), checkUserPurchaseSettingsFailureReason (ref), setPromptStateModule (ref), promptStateModule (ref), setEconomicRestrictionErrorModule (ref)
	return thunkModule.new(script.Name, list, function(p1, p2)
		-- upvalues: networkModule (copy), analyticsModule (copy), externalSettingsModule (copy), initiatePurchasePrecheckModule (copy), getUpsellFlowModule (copy), upsellFlowModule (copy), checkUserPurchaseSettingsModule (copy), mapCheckUserPurchaseSettingsFailureReasonToViolationType (copy), economicRestrictionsViolationType (copy), errorOccurredModule (copy), purchaseErrorModule (copy), checkUserPurchaseSettingsFailureReason (copy), setPromptStateModule (copy), promptStateModule (copy), setEconomicRestrictionErrorModule (copy)
		local var1 = p2[networkModule]
		local var2 = p2[analyticsModule]
		local var3 = p2[externalSettingsModule]
		
		return if var3.isStudio() then p1:dispatch(initiatePurchasePrecheckModule()) elseif getUpsellFlowModule(var3.getPlatform()) == upsellFlowModule.Web then p1:dispatch(initiatePurchasePrecheckModule()) else checkUserPurchaseSettingsModule(var1):andThen(function(p3)
			-- upvalues: mapCheckUserPurchaseSettingsFailureReasonToViolationType (copy), economicRestrictionsViolationType (copy), p1 (ref), errorOccurredModule (copy), purchaseErrorModule (copy), initiatePurchasePrecheckModule (copy), checkUserPurchaseSettingsFailureReason (copy), var2 (ref), setPromptStateModule (copy), promptStateModule (copy), setEconomicRestrictionErrorModule (copy)
			local var4, var5
			if p3 == nil then
				var4 = false
			else
				var5 = if p3.isEligible ~= nil then p3.failureReason == nil else true
				var4 = if var5 and not (mapCheckUserPurchaseSettingsFailureReasonToViolationType(p3.failureReason) ~= economicRestrictionsViolationType.None and p3.expirationTimeInMinutes ~= nil) then false else true
			end
			if var4 == false then
				return p1:dispatch(errorOccurredModule(purchaseErrorModule.UnknownFailure))
			elseif p3.isEligible == true then
				return p1:dispatch(initiatePurchasePrecheckModule())
			end
			local var6 = mapCheckUserPurchaseSettingsFailureReasonToViolationType(p3.failureReason)
			var5 = var6 ~= economicRestrictionsViolationType.None
			
			if p3.failureReason == checkUserPurchaseSettingsFailureReason.PurchaseNotEnabled then
				var2.signalUserSettingEligibilityModal("PurchaseNotEnabled")
				
				return p1:dispatch(setPromptStateModule(promptStateModule.EnablePurchaseVPCModal))
			elseif p3.failureReason == checkUserPurchaseSettingsFailureReason.SpendLimitExceeded then
				return p1:dispatch(initiatePurchasePrecheckModule())
			elseif var5 and p3.expirationTimeInMinutes ~= nil then
				var2.signalEconomicRestrictionError(var6, p3.expirationTimeInMinutes)
				p1:dispatch(setEconomicRestrictionErrorModule(var6, p3.expirationTimeInMinutes))
				
				return p1:dispatch(errorOccurredModule(purchaseErrorModule.EconomicRestriction))
			end
			return p1:dispatch(errorOccurredModule(purchaseErrorModule.UnknownFailure))
		end):catch(function(_)
			-- upvalues: p1 (ref), errorOccurredModule (copy), purchaseErrorModule (copy)
			return p1:dispatch(errorOccurredModule(purchaseErrorModule.UnknownFailure))
		end)
	end)
end