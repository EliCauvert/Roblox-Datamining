local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local parent = bulkPurchaseApp.Parent
local IAPExperienceModule = require(parent.IAPExperience)
local parseErrorReasonToEconomicRestriction = IAPExperienceModule.Utility.parseErrorReasonToEconomicRestriction
local economicRestrictionsCounter = IAPExperienceModule.Counters.EconomicRestrictionsCounter
local universalEconomicRestrictionsCounter = economicRestrictionsCounter.UniversalEconomicRestrictionsCounter
local economicRestrictionsSurface = economicRestrictionsCounter.EconomicRestrictionsSurface
local default = require(parent.LoggingProtocol).default
local bulkPurchaseFailedModule = require(bulkPurchaseApp.Store.Actions.BulkPurchaseFailed)
local errorCodeEnumModule = require(bulkPurchaseApp.Enums.ErrorCodeEnum)

return function(p0, p1) --[[ line: 14 | named "handleEconomicRestrictionError" ]]
	-- upvalues: parseErrorReasonToEconomicRestriction (ref), default (ref), universalEconomicRestrictionsCounter (ref), economicRestrictionsSurface (ref), bulkPurchaseFailedModule (ref), errorCodeEnumModule (ref)
	local var4 = parseErrorReasonToEconomicRestriction(p0)
	default:logRobloxTelemetryCounter(universalEconomicRestrictionsCounter, 1, {
		surface = economicRestrictionsSurface.BulkPurchase,
		failureReason = if var4.violationType then tostring(var4.violationType) else "null"
	})
	p1(bulkPurchaseFailedModule(errorCodeEnumModule.EconomicRestriction, {
		failureReason = var4.violationType,
		expirationTimeInMinutes = var4.timeoutMinutes
	}))
end