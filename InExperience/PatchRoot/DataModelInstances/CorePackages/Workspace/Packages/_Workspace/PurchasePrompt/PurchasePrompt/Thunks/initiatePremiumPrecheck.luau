local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local thunkModule = require(purchasePrompt.Thunk)
local networkModule = require(purchasePrompt.Services.Network)
local externalSettingsModule = require(purchasePrompt.Services.ExternalSettings)
local analyticsModule = require(purchasePrompt.Services.Analytics)
local promptStateModule = require(purchasePrompt.Enums.PromptState)
local paymentPlatformModule = require(purchasePrompt.Enums.PaymentPlatform)
local setPromptStateModule = require(purchasePrompt.Actions.SetPromptState)
local launchPremiumUpsellModule = require(purchasePrompt.Thunks.launchPremiumUpsell)
local checkUserPurchaseSettingsModule = require(purchasePrompt.Network.checkUserPurchaseSettings)
local getPaymentPlatformModule = require(purchasePrompt.Utils.getPaymentPlatform)
local errorOccurredModule = require(purchasePrompt.Actions.ErrorOccurred)
local purchaseErrorModule = require(purchasePrompt.Enums.PurchaseError)
local IAPExperienceModule = require(parent.IAPExperience)
local setEconomicRestrictionErrorModule = require(purchasePrompt.Actions.SetEconomicRestrictionError)
local economicRestrictionsViolationType = IAPExperienceModule.Enums.EconomicRestrictionsViolationType
local checkUserPurchaseSettingsFailureReason = IAPExperienceModule.Enums.CheckUserPurchaseSettingsFailureReason
local mapCheckUserPurchaseSettingsFailureReasonToViolationType = IAPExperienceModule.Utility.mapCheckUserPurchaseSettingsFailureReasonToViolationType
local list = { analyticsModule, networkModule, externalSettingsModule }

local function handleCheckUserSettingsResult(value, p0, p1) --[[ line: 35 ]]
	-- upvalues: errorOccurredModule (ref), purchaseErrorModule (ref), mapCheckUserPurchaseSettingsFailureReasonToViolationType (ref), economicRestrictionsViolationType (ref), launchPremiumUpsellModule (ref), checkUserPurchaseSettingsFailureReason (ref), setPromptStateModule (ref), promptStateModule (ref), setEconomicRestrictionErrorModule (ref)
	if value == nil then
		return p0:dispatch(errorOccurredModule(purchaseErrorModule.UnknownFailure))
	end
	local var17 = mapCheckUserPurchaseSettingsFailureReasonToViolationType(value.failureReason)
	local var18 = var17 ~= economicRestrictionsViolationType.None and value.expirationTimeInMinutes ~= nil
	
	if (if value.isEligible ~= nil then value.failureReason == nil else true) and not var18 then
		return p0:dispatch(errorOccurredModule(purchaseErrorModule.UnknownFailure))
	elseif value.isEligible == true then
		return p0:dispatch(launchPremiumUpsellModule())
	elseif value.failureReason == checkUserPurchaseSettingsFailureReason.PurchaseNotEnabled then
		p1.signalUserSettingEligibilityModal(checkUserPurchaseSettingsFailureReason.PurchaseNotEnabled)
		
		return p0:dispatch(setPromptStateModule(promptStateModule.EnablePurchaseVPCModal))
	elseif value.failureReason == checkUserPurchaseSettingsFailureReason.SpendLimitExceeded then
		return p0:dispatch(launchPremiumUpsellModule())
	elseif var18 then
		p1.signalEconomicRestrictionError(var17, value.expirationTimeInMinutes)
		p0:dispatch(setEconomicRestrictionErrorModule(var17, value.expirationTimeInMinutes))
		
		return p0:dispatch(errorOccurredModule(purchaseErrorModule.EconomicRestriction))
	end
	return p0:dispatch(errorOccurredModule(purchaseErrorModule.UnknownFailure))
end

return function() --[[ line: 72 | named "initiatePremiumPrecheck" ]]
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), analyticsModule (ref), externalSettingsModule (ref), launchPremiumUpsellModule (ref), getPaymentPlatformModule (ref), paymentPlatformModule (ref), checkUserPurchaseSettingsModule (ref), handleCheckUserSettingsResult (ref), errorOccurredModule (ref), purchaseErrorModule (ref)
	return thunkModule.new(script.Name, list, function(p2, p3) --[[ line: 73 ]]
		-- upvalues: networkModule (copy), analyticsModule (copy), externalSettingsModule (copy), launchPremiumUpsellModule (copy), getPaymentPlatformModule (copy), paymentPlatformModule (copy), checkUserPurchaseSettingsModule (copy), handleCheckUserSettingsResult (copy), errorOccurredModule (copy), purchaseErrorModule (copy)
		local var19 = p3[networkModule]
		local var20 = p3[analyticsModule]
		local var21 = p3[externalSettingsModule]
		
		return if var21.isStudio() then p2:dispatch(launchPremiumUpsellModule()) elseif getPaymentPlatformModule(var21.getPlatform()) == paymentPlatformModule.Web then p2:dispatch(launchPremiumUpsellModule()) else checkUserPurchaseSettingsModule(var19):andThen(function(p4) --[[ line: 90 ]]
			-- upvalues: handleCheckUserSettingsResult (copy), p2 (ref), var20 (ref)
			return handleCheckUserSettingsResult(p4, p2, var20)
		end):catch(function(_) --[[ line: 93 ]]
			-- upvalues: p2 (ref), errorOccurredModule (copy), purchaseErrorModule (copy)
			return p2:dispatch(errorOccurredModule(purchaseErrorModule.UnknownFailure))
		end)
	end)
end