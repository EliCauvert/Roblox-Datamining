local IAPExperience = script:FindFirstAncestor("IAPExperience")
local getEconomicRestrictionLocalizedLabelModule = require(IAPExperience.Utility.EconomicRestriction.getEconomicRestrictionLocalizedLabel)
local default = require(IAPExperience.Parent.LoggingProtocol).default
local economicRestrictionsPromptShownCounter = require(IAPExperience.Generic.Events.PurchaseErrorPromptCounter).EconomicRestrictionsPromptShownCounter
local loggerModule = require(IAPExperience.Utility.logger)
local getAppContextModule = require(IAPExperience.Utility.getAppContext)

return function(p0, p1, p2)
	-- upvalues: default (ref), economicRestrictionsPromptShownCounter (ref), getAppContextModule (ref), loggerModule (ref), getEconomicRestrictionLocalizedLabelModule (ref)
	local timeoutMinutes = p1.timeoutMinutes or (p1.expirationTimeInMinutes or p1.ExpirationTimeInMinutes)
	local violationType = p1.violationType or (p1.failureReason or p1.FailureReason)
	default:logRobloxTelemetryCounter(economicRestrictionsPromptShownCounter, 1, {
		violationType = tostring(violationType),
		appContext = getAppContextModule()
	})
	
	if not timeoutMinutes or not violationType then
		loggerModule.error({
			error = "Timeout and violationType is required for economic restriction text. Showing unknown error.",
			timeoutMinutes = timeoutMinutes,
			violationType = violationType
		})
		
		return p0.unknownText
	end
	local var6 = getEconomicRestrictionLocalizedLabelModule(p0, violationType)
	local ceiled = math.ceil(timeoutMinutes / 60)
	
	return if ceiled >= 24 then (if p2 then p0.economicRestrictionBaseTextDaysGeneral else p0.economicRestrictionBaseTextDays):gsub("{day}", tostring(math.ceil(ceiled / 24))):gsub("{violation}", var6) else (if p2 then p0.economicRestrictionBaseTextHoursGeneral else p0.economicRestrictionBaseTextHours):gsub("{hour}", tostring(ceiled)):gsub("{violation}", var6)
end