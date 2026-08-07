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

local function _(p0) --[[ line: 32 | named "validateResult" ]]
	-- upvalues: mapCheckUserPurchaseSettingsFailureReasonToViolationType (ref), economicRestrictionsViolationType (ref)
	return if p0 == nil then false else (if p0.isEligible ~= nil then p0.failureReason == nil else true) and not (mapCheckUserPurchaseSettingsFailureReasonToViolationType(p0.failureReason) ~= economicRestrictionsViolationType.None and p0.expirationTimeInMinutes ~= nil)
end

return function() --[[ line: 55 | named "initiateUserPurchaseSettingsPrecheck" ]]
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), analyticsModule (ref), externalSettingsModule (ref), initiatePurchasePrecheckModule (ref), getUpsellFlowModule (ref), upsellFlowModule (ref), checkUserPurchaseSettingsModule (ref), mapCheckUserPurchaseSettingsFailureReasonToViolationType (ref), economicRestrictionsViolationType (ref), errorOccurredModule (ref), purchaseErrorModule (ref), checkUserPurchaseSettingsFailureReason (ref), setPromptStateModule (ref), promptStateModule (ref), setEconomicRestrictionErrorModule (ref)
	return thunkModule.new(script.Name, list, function(p1, p2) --[[ line: 56 ]]
		-- upvalues: networkModule (copy), analyticsModule (copy), externalSettingsModule (copy), initiatePurchasePrecheckModule (copy), getUpsellFlowModule (copy), upsellFlowModule (copy), checkUserPurchaseSettingsModule (copy), mapCheckUserPurchaseSettingsFailureReasonToViolationType (copy), economicRestrictionsViolationType (copy), errorOccurredModule (copy), purchaseErrorModule (copy), checkUserPurchaseSettingsFailureReason (copy), setPromptStateModule (copy), promptStateModule (copy), setEconomicRestrictionErrorModule (copy)
		local var16 = p2[networkModule]
		local var17 = p2[analyticsModule]
		local var18 = p2[externalSettingsModule]
		
		return if var18.isStudio() then p1:dispatch(initiatePurchasePrecheckModule()) elseif getUpsellFlowModule(var18.getPlatform()) == upsellFlowModule.Web then p1:dispatch(initiatePurchasePrecheckModule()) else checkUserPurchaseSettingsModule(var16):andThen(function(p3) --[[ line: 75 ]]
			-- upvalues: mapCheckUserPurchaseSettingsFailureReasonToViolationType (copy), economicRestrictionsViolationType (copy), p1 (ref), errorOccurredModule (copy), purchaseErrorModule (copy), initiatePurchasePrecheckModule (copy), checkUserPurchaseSettingsFailureReason (copy), var17 (ref), setPromptStateModule (copy), promptStateModule (copy), setEconomicRestrictionErrorModule (copy)
			local var19, var20
			if p3 == nil then
				var19 = false
			else
				var20 = if p3.isEligible ~= nil then p3.failureReason == nil else true
				var19 = if var20 and not (mapCheckUserPurchaseSettingsFailureReasonToViolationType(p3.failureReason) ~= economicRestrictionsViolationType.None and p3.expirationTimeInMinutes ~= nil) then false else true
			end
			if var19 == false then
				return p1:dispatch(errorOccurredModule(purchaseErrorModule.UnknownFailure))
			elseif p3.isEligible == true then
				return p1:dispatch(initiatePurchasePrecheckModule())
			end
			local var21 = mapCheckUserPurchaseSettingsFailureReasonToViolationType(p3.failureReason)
			var20 = var21 ~= economicRestrictionsViolationType.None
			
			if p3.failureReason == checkUserPurchaseSettingsFailureReason.PurchaseNotEnabled then
				var17.signalUserSettingEligibilityModal("PurchaseNotEnabled")
				
				return p1:dispatch(setPromptStateModule(promptStateModule.EnablePurchaseVPCModal))
			elseif p3.failureReason == checkUserPurchaseSettingsFailureReason.SpendLimitExceeded then
				return p1:dispatch(initiatePurchasePrecheckModule())
			elseif var20 and p3.expirationTimeInMinutes ~= nil then
				var17.signalEconomicRestrictionError(var21, p3.expirationTimeInMinutes)
				p1:dispatch(setEconomicRestrictionErrorModule(var21, p3.expirationTimeInMinutes))
				
				return p1:dispatch(errorOccurredModule(purchaseErrorModule.EconomicRestriction))
			end
			return p1:dispatch(errorOccurredModule(purchaseErrorModule.UnknownFailure))
		end):catch(function(_) --[[ line: 116 ]]
			-- upvalues: p1 (ref), errorOccurredModule (copy), purchaseErrorModule (copy)
			return p1:dispatch(errorOccurredModule(purchaseErrorModule.UnknownFailure))
		end)
	end)
end