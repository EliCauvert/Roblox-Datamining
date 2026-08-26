local IAPExperience = script:FindFirstAncestor("IAPExperience")
local getEconomicRestrictionLocalizedLabelModule = require(IAPExperience.Utility.EconomicRestriction.getEconomicRestrictionLocalizedLabel)
local default = require(IAPExperience.Parent.LoggingProtocol).default
local economicRestrictionsPromptShownCounter = require(IAPExperience.Generic.Events.PurchaseErrorPromptCounter).EconomicRestrictionsPromptShownCounter
local loggerModule = require(IAPExperience.Utility.logger)
local getAppContextModule = require(IAPExperience.Utility.getAppContext)

return function(p1, p2, p3)
	-- upvalues: default (ref), economicRestrictionsPromptShownCounter (ref), getAppContextModule (ref), loggerModule (ref), getEconomicRestrictionLocalizedLabelModule (ref)
	local timeoutMinutes = p2.timeoutMinutes or (p2.expirationTimeInMinutes or p2.ExpirationTimeInMinutes)
	local violationType = p2.violationType or (p2.failureReason or p2.FailureReason)
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
		
		return p1.unknownText
	end
	local var1 = getEconomicRestrictionLocalizedLabelModule(p1, violationType)
	local ceiled = math.ceil(timeoutMinutes / 60)
	
	return if ceiled >= 24 then (if p3 then p1.economicRestrictionBaseTextDaysGeneral else p1.economicRestrictionBaseTextDays):gsub("{day}", tostring(math.ceil(ceiled / 24))):gsub("{violation}", var1) else (if p3 then p1.economicRestrictionBaseTextHoursGeneral else p1.economicRestrictionBaseTextHours):gsub("{hour}", tostring(ceiled)):gsub("{violation}", var1)
end