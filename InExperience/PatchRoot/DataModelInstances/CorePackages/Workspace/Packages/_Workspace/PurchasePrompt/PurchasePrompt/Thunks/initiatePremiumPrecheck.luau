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

local function handleCheckUserSettingsResult(value, p1, p2)
	-- upvalues: errorOccurredModule (ref), purchaseErrorModule (ref), mapCheckUserPurchaseSettingsFailureReasonToViolationType (ref), economicRestrictionsViolationType (ref), launchPremiumUpsellModule (ref), checkUserPurchaseSettingsFailureReason (ref), setPromptStateModule (ref), promptStateModule (ref), setEconomicRestrictionErrorModule (ref)
	if value == nil then
		return p1:dispatch(errorOccurredModule(purchaseErrorModule.UnknownFailure))
	end
	local var1 = mapCheckUserPurchaseSettingsFailureReasonToViolationType(value.failureReason)
	local var2 = var1 ~= economicRestrictionsViolationType.None and value.expirationTimeInMinutes ~= nil
	
	if (if value.isEligible ~= nil then value.failureReason == nil else true) and not var2 then
		return p1:dispatch(errorOccurredModule(purchaseErrorModule.UnknownFailure))
	elseif value.isEligible == true then
		return p1:dispatch(launchPremiumUpsellModule())
	elseif value.failureReason == checkUserPurchaseSettingsFailureReason.PurchaseNotEnabled then
		p2.signalUserSettingEligibilityModal(checkUserPurchaseSettingsFailureReason.PurchaseNotEnabled)
		
		return p1:dispatch(setPromptStateModule(promptStateModule.EnablePurchaseVPCModal))
	elseif value.failureReason == checkUserPurchaseSettingsFailureReason.SpendLimitExceeded then
		return p1:dispatch(launchPremiumUpsellModule())
	elseif var2 then
		p2.signalEconomicRestrictionError(var1, value.expirationTimeInMinutes)
		p1:dispatch(setEconomicRestrictionErrorModule(var1, value.expirationTimeInMinutes))
		
		return p1:dispatch(errorOccurredModule(purchaseErrorModule.EconomicRestriction))
	end
	return p1:dispatch(errorOccurredModule(purchaseErrorModule.UnknownFailure))
end

return function()
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), analyticsModule (ref), externalSettingsModule (ref), launchPremiumUpsellModule (ref), getPaymentPlatformModule (ref), paymentPlatformModule (ref), checkUserPurchaseSettingsModule (ref), handleCheckUserSettingsResult (ref), errorOccurredModule (ref), purchaseErrorModule (ref)
	return thunkModule.new(script.Name, list, function(p1, p2)
		-- upvalues: networkModule (copy), analyticsModule (copy), externalSettingsModule (copy), launchPremiumUpsellModule (copy), getPaymentPlatformModule (copy), paymentPlatformModule (copy), checkUserPurchaseSettingsModule (copy), handleCheckUserSettingsResult (copy), errorOccurredModule (copy), purchaseErrorModule (copy)
		local var1 = p2[networkModule]
		local var2 = p2[analyticsModule]
		local var3 = p2[externalSettingsModule]
		
		return if var3.isStudio() then p1:dispatch(launchPremiumUpsellModule()) elseif getPaymentPlatformModule(var3.getPlatform()) == paymentPlatformModule.Web then p1:dispatch(launchPremiumUpsellModule()) else checkUserPurchaseSettingsModule(var1):andThen(function(p3)
			-- upvalues: handleCheckUserSettingsResult (copy), p1 (ref), var2 (ref)
			return handleCheckUserSettingsResult(p3, p1, var2)
		end):catch(function(_)
			-- upvalues: p1 (ref), errorOccurredModule (copy), purchaseErrorModule (copy)
			return p1:dispatch(errorOccurredModule(purchaseErrorModule.UnknownFailure))
		end)
	end)
end