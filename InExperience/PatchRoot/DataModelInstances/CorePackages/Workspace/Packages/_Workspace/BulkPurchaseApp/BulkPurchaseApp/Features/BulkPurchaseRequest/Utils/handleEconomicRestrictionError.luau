local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local Parent = BulkPurchaseApp.Parent
local IAPExperienceModule = require(Parent.IAPExperience)
local ParseErrorReasonToEconomicRestrictionFunction = IAPExperienceModule.Utility.parseErrorReasonToEconomicRestriction
local EconomicRestrictionsCounter = IAPExperienceModule.Counters.EconomicRestrictionsCounter
local UniversalEconomicRestrictionsCounter = EconomicRestrictionsCounter.UniversalEconomicRestrictionsCounter
local EconomicRestrictionsSurface = EconomicRestrictionsCounter.EconomicRestrictionsSurface
local Default = require(Parent.LoggingProtocol).default
local BulkPurchaseFailedModule = require(BulkPurchaseApp.Store.Actions.BulkPurchaseFailed)
local ErrorCodeEnumModule = require(BulkPurchaseApp.Enums.ErrorCodeEnum)

return function(p1, Callback: (any) -> ()) --[[ Line: 14 | Named "handleEconomicRestrictionError" ]]
	-- upvalues: ParseErrorReasonToEconomicRestrictionFunction (copy), Default (copy), UniversalEconomicRestrictionsCounter (copy), EconomicRestrictionsSurface (copy), BulkPurchaseFailedModule (copy), ErrorCodeEnumModule (copy)
	local ParseErrorReasonToEconomicRestrictionResult = ParseErrorReasonToEconomicRestrictionFunction(p1)
	Default:logRobloxTelemetryCounter(UniversalEconomicRestrictionsCounter, 1, {
		surface = EconomicRestrictionsSurface.BulkPurchase,
		failureReason = if ParseErrorReasonToEconomicRestrictionResult.violationType then tostring(ParseErrorReasonToEconomicRestrictionResult.violationType) else "null"
	})
	Callback(BulkPurchaseFailedModule(ErrorCodeEnumModule.EconomicRestriction, {
		failureReason = ParseErrorReasonToEconomicRestrictionResult.violationType,
		expirationTimeInMinutes = ParseErrorReasonToEconomicRestrictionResult.timeoutMinutes
	}))
end