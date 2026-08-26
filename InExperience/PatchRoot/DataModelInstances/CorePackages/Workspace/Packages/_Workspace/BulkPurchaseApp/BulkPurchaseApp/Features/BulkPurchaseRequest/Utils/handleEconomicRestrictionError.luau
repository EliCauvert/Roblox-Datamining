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

return function(p1, p2)
	-- upvalues: parseErrorReasonToEconomicRestriction (ref), default (ref), universalEconomicRestrictionsCounter (ref), economicRestrictionsSurface (ref), bulkPurchaseFailedModule (ref), errorCodeEnumModule (ref)
	local var1 = parseErrorReasonToEconomicRestriction(p1)
	default:logRobloxTelemetryCounter(universalEconomicRestrictionsCounter, 1, {
		surface = economicRestrictionsSurface.BulkPurchase,
		failureReason = if var1.violationType then tostring(var1.violationType) else "null"
	})
	p2(bulkPurchaseFailedModule(errorCodeEnumModule.EconomicRestriction, {
		failureReason = var1.violationType,
		expirationTimeInMinutes = var1.timeoutMinutes
	}))
end