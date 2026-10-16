local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local ThunkModule = require(PurchasePrompt.Thunk)
local NetworkModule = require(PurchasePrompt.Services.Network)
local ExternalSettingsModule = require(PurchasePrompt.Services.ExternalSettings)
local AnalyticsModule = require(PurchasePrompt.Services.Analytics)
local PromptStateModule = require(PurchasePrompt.Enums.PromptState)
local PaymentPlatformModule = require(PurchasePrompt.Enums.PaymentPlatform)
local SetPromptStateModule = require(PurchasePrompt.Actions.SetPromptState)
local LaunchPremiumUpsellModule = require(PurchasePrompt.Thunks.launchPremiumUpsell)
local CheckUserPurchaseSettingsModule = require(PurchasePrompt.Network.checkUserPurchaseSettings)
local GetPaymentPlatformModule = require(PurchasePrompt.Utils.getPaymentPlatform)
local ErrorOccurredModule = require(PurchasePrompt.Actions.ErrorOccurred)
local PurchaseErrorModule = require(PurchasePrompt.Enums.PurchaseError)
local IAPExperienceModule = require(PurchasePrompt.Parent.IAPExperience)
local SetEconomicRestrictionErrorModule = require(PurchasePrompt.Actions.SetEconomicRestrictionError)
local EconomicRestrictionsViolationType = IAPExperienceModule.Enums.EconomicRestrictionsViolationType
local CheckUserPurchaseSettingsFailureReason = IAPExperienceModule.Enums.CheckUserPurchaseSettingsFailureReason
local MapCheckUserPurchaseSettingsFailureReasonToViolationTypeFunction = IAPExperienceModule.Utility.mapCheckUserPurchaseSettingsFailureReasonToViolationType
local list = { AnalyticsModule, NetworkModule, ExternalSettingsModule }

local function handleCheckUserSettingsResult(p1, p2, p3) --[[ Line: 35 ]]
	-- upvalues: ErrorOccurredModule (copy), PurchaseErrorModule (copy), MapCheckUserPurchaseSettingsFailureReasonToViolationTypeFunction (copy), EconomicRestrictionsViolationType (copy), LaunchPremiumUpsellModule (copy), CheckUserPurchaseSettingsFailureReason (copy), SetPromptStateModule (copy), PromptStateModule (copy), SetEconomicRestrictionErrorModule (copy)
	if p1 == nil then
		return p2:dispatch(ErrorOccurredModule(PurchaseErrorModule.UnknownFailure))
	end
	local MapCheckUserPurchaseSettingsFailureReasonToViolationTypeResult = MapCheckUserPurchaseSettingsFailureReasonToViolationTypeFunction(p1.failureReason)
	local HasExpirationTimeInMinutes: boolean = MapCheckUserPurchaseSettingsFailureReasonToViolationTypeResult ~= EconomicRestrictionsViolationType.None and p1.expirationTimeInMinutes ~= nil
	
	if (p1.isEligible == nil or p1.failureReason == nil) and not HasExpirationTimeInMinutes then
		return p2:dispatch(ErrorOccurredModule(PurchaseErrorModule.UnknownFailure))
	elseif p1.isEligible == true then
		return p2:dispatch(LaunchPremiumUpsellModule())
	elseif p1.failureReason == CheckUserPurchaseSettingsFailureReason.PurchaseNotEnabled then
		p3.signalUserSettingEligibilityModal(CheckUserPurchaseSettingsFailureReason.PurchaseNotEnabled)
		
		return p2:dispatch(SetPromptStateModule(PromptStateModule.EnablePurchaseVPCModal))
	elseif p1.failureReason == CheckUserPurchaseSettingsFailureReason.SpendLimitExceeded then
		return p2:dispatch(LaunchPremiumUpsellModule())
	elseif HasExpirationTimeInMinutes then
		p3.signalEconomicRestrictionError(MapCheckUserPurchaseSettingsFailureReasonToViolationTypeResult, p1.expirationTimeInMinutes)
		p2:dispatch(SetEconomicRestrictionErrorModule(MapCheckUserPurchaseSettingsFailureReasonToViolationTypeResult, p1.expirationTimeInMinutes))
		
		return p2:dispatch(ErrorOccurredModule(PurchaseErrorModule.EconomicRestriction))
	else
		return p2:dispatch(ErrorOccurredModule(PurchaseErrorModule.UnknownFailure))
	end
end

return function() --[[ Line: 72 | Named "initiatePremiumPrecheck" ]]
	-- upvalues: ThunkModule (copy), list (copy), NetworkModule (copy), AnalyticsModule (copy), ExternalSettingsModule (copy), LaunchPremiumUpsellModule (copy), GetPaymentPlatformModule (copy), PaymentPlatformModule (copy), CheckUserPurchaseSettingsModule (copy), handleCheckUserSettingsResult (copy), ErrorOccurredModule (copy), PurchaseErrorModule (copy)
	return ThunkModule.new(script.Name, list, function(p1, p2) --[[ Line: 73 ]]
		-- upvalues: NetworkModule (upval), AnalyticsModule (upval), ExternalSettingsModule (upval), LaunchPremiumUpsellModule (upval), GetPaymentPlatformModule (upval), PaymentPlatformModule (upval), CheckUserPurchaseSettingsModule (upval), handleCheckUserSettingsResult (upval), ErrorOccurredModule (upval), PurchaseErrorModule (upval)
		local v1 = p2[NetworkModule]
		local v2 = p2[AnalyticsModule]
		local v3 = p2[ExternalSettingsModule]
		
		return if v3.isStudio() then p1:dispatch(LaunchPremiumUpsellModule()) elseif GetPaymentPlatformModule(v3.getPlatform()) == PaymentPlatformModule.Web then p1:dispatch(LaunchPremiumUpsellModule()) else CheckUserPurchaseSettingsModule(v1):andThen(function(Result) --[[ Line: 90 ]]
			-- upvalues: handleCheckUserSettingsResult (upval), p1 (copy), v2 (copy)
			return handleCheckUserSettingsResult(Result, p1, v2)
		end):catch(function(_) --[[ Line: 93 ]]
			-- upvalues: p1 (copy), ErrorOccurredModule (upval), PurchaseErrorModule (upval)
			return p1:dispatch(ErrorOccurredModule(PurchaseErrorModule.UnknownFailure))
		end)
	end)
end