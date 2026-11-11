local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local UpsellFlowModule = require(PurchasePrompt.Enums.UpsellFlow)
local NetworkModule = require(PurchasePrompt.Services.Network)
local CheckUserPurchaseSettingsModule = require(PurchasePrompt.Network.checkUserPurchaseSettings)
local GetUpsellFlowModule = require(PurchasePrompt.NativeUpsell.getUpsellFlow)
local AnalyticsModule = require(PurchasePrompt.Services.Analytics)
local ExternalSettingsModule = require(PurchasePrompt.Services.ExternalSettings)
local ErrorOccurredModule = require(PurchasePrompt.Actions.ErrorOccurred)
local SetEconomicRestrictionErrorModule = require(PurchasePrompt.Actions.SetEconomicRestrictionError)
local PurchaseErrorModule = require(PurchasePrompt.Enums.PurchaseError)
local ThunkModule = require(PurchasePrompt.Thunk)
local InitiatePurchasePrecheckModule = require(PurchasePrompt.Thunks.initiatePurchasePrecheck)
local SetPromptStateModule = require(PurchasePrompt.Actions.SetPromptState)
local PromptStateModule = require(PurchasePrompt.Enums.PromptState)
local IAPExperienceModule = require(PurchasePrompt.Parent.IAPExperience)
local CheckUserPurchaseSettingsFailureReason = IAPExperienceModule.Enums.CheckUserPurchaseSettingsFailureReason
local MapCheckUserPurchaseSettingsFailureReasonToViolationTypeFunction = IAPExperienceModule.Utility.mapCheckUserPurchaseSettingsFailureReasonToViolationType
local EconomicRestrictionsViolationType = IAPExperienceModule.Enums.EconomicRestrictionsViolationType
local list = { AnalyticsModule, NetworkModule, ExternalSettingsModule }

local function _(p1): boolean
	-- upvalues: MapCheckUserPurchaseSettingsFailureReasonToViolationTypeFunction (copy), EconomicRestrictionsViolationType (copy)
	if p1 == nil then
		return false
	else
		local NoIsEligible: boolean = p1.isEligible == nil or p1.failureReason == nil
		local HasExpirationTimeInMinutes: boolean = MapCheckUserPurchaseSettingsFailureReasonToViolationTypeFunction(p1.failureReason) ~= EconomicRestrictionsViolationType.None and p1.expirationTimeInMinutes ~= nil
		
		return not NoIsEligible or HasExpirationTimeInMinutes
	end
end

return function()
	-- upvalues: ThunkModule (copy), list (copy), NetworkModule (copy), AnalyticsModule (copy), ExternalSettingsModule (copy), InitiatePurchasePrecheckModule (copy), GetUpsellFlowModule (copy), UpsellFlowModule (copy), CheckUserPurchaseSettingsModule (copy), MapCheckUserPurchaseSettingsFailureReasonToViolationTypeFunction (copy), EconomicRestrictionsViolationType (copy), ErrorOccurredModule (copy), PurchaseErrorModule (copy), CheckUserPurchaseSettingsFailureReason (copy), SetPromptStateModule (copy), PromptStateModule (copy), SetEconomicRestrictionErrorModule (copy)
	return ThunkModule.new(script.Name, list, function(p1, p2)
		-- upvalues: NetworkModule (upval), AnalyticsModule (upval), ExternalSettingsModule (upval), InitiatePurchasePrecheckModule (upval), GetUpsellFlowModule (upval), UpsellFlowModule (upval), CheckUserPurchaseSettingsModule (upval), MapCheckUserPurchaseSettingsFailureReasonToViolationTypeFunction (upval), EconomicRestrictionsViolationType (upval), ErrorOccurredModule (upval), PurchaseErrorModule (upval), CheckUserPurchaseSettingsFailureReason (upval), SetPromptStateModule (upval), PromptStateModule (upval), SetEconomicRestrictionErrorModule (upval)
		local v1 = p2[NetworkModule]
		local v2 = p2[AnalyticsModule]
		local v3 = p2[ExternalSettingsModule]
		
		return if v3.isStudio() then p1:dispatch(InitiatePurchasePrecheckModule()) elseif GetUpsellFlowModule(v3.getPlatform()) == UpsellFlowModule.Web then p1:dispatch(InitiatePurchasePrecheckModule()) else CheckUserPurchaseSettingsModule(v1):andThen(function(Result)
			-- upvalues: MapCheckUserPurchaseSettingsFailureReasonToViolationTypeFunction (upval), EconomicRestrictionsViolationType (upval), p1 (copy), ErrorOccurredModule (upval), PurchaseErrorModule (upval), InitiatePurchasePrecheckModule (upval), CheckUserPurchaseSettingsFailureReason (upval), v2 (copy), SetPromptStateModule (upval), PromptStateModule (upval), SetEconomicRestrictionErrorModule (upval)
			local Enabled = nil
			if Result == nil then
				Enabled = false
			else
				local NoIsEligible: boolean = Result.isEligible == nil or Result.failureReason == nil
				local HasExpirationTimeInMinutes: boolean = MapCheckUserPurchaseSettingsFailureReasonToViolationTypeFunction(Result.failureReason) ~= EconomicRestrictionsViolationType.None and Result.expirationTimeInMinutes ~= nil
				Enabled = not NoIsEligible or HasExpirationTimeInMinutes
			end
			if Enabled == false then
				return p1:dispatch(ErrorOccurredModule(PurchaseErrorModule.UnknownFailure))
			elseif Result.isEligible == true then
				return p1:dispatch(InitiatePurchasePrecheckModule())
			else
				local MapCheckUserPurchaseSettingsFailureReasonToViolationTypeResult = MapCheckUserPurchaseSettingsFailureReasonToViolationTypeFunction(Result.failureReason)
				local IsNotMapCheckUserPurchaseSettingsFailureReasonToViolationTypeResultMatch = MapCheckUserPurchaseSettingsFailureReasonToViolationTypeResult ~= EconomicRestrictionsViolationType.None
				
				if Result.failureReason == CheckUserPurchaseSettingsFailureReason.PurchaseNotEnabled then
					v2.signalUserSettingEligibilityModal("PurchaseNotEnabled")
					
					return p1:dispatch(SetPromptStateModule(PromptStateModule.EnablePurchaseVPCModal))
				elseif Result.failureReason == CheckUserPurchaseSettingsFailureReason.SpendLimitExceeded then
					return p1:dispatch(InitiatePurchasePrecheckModule())
				elseif IsNotMapCheckUserPurchaseSettingsFailureReasonToViolationTypeResultMatch and Result.expirationTimeInMinutes ~= nil then
					v2.signalEconomicRestrictionError(MapCheckUserPurchaseSettingsFailureReasonToViolationTypeResult, Result.expirationTimeInMinutes)
					p1:dispatch(SetEconomicRestrictionErrorModule(MapCheckUserPurchaseSettingsFailureReasonToViolationTypeResult, Result.expirationTimeInMinutes))
					
					return p1:dispatch(ErrorOccurredModule(PurchaseErrorModule.EconomicRestriction))
				else
					return p1:dispatch(ErrorOccurredModule(PurchaseErrorModule.UnknownFailure))
				end
			end
		end):catch(function(_)
			-- upvalues: p1 (copy), ErrorOccurredModule (upval), PurchaseErrorModule (upval)
			return p1:dispatch(ErrorOccurredModule(PurchaseErrorModule.UnknownFailure))
		end)
	end)
end