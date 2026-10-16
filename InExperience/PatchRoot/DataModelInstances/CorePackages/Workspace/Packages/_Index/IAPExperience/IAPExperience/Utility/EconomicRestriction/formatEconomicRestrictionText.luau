local IAPExperience = script:FindFirstAncestor("IAPExperience")
local GetEconomicRestrictionLocalizedLabelModule = require(IAPExperience.Utility.EconomicRestriction.getEconomicRestrictionLocalizedLabel)
local Default = require(IAPExperience.Parent.LoggingProtocol).default
local EconomicRestrictionsPromptShownCounter = require(IAPExperience.Generic.Events.PurchaseErrorPromptCounter).EconomicRestrictionsPromptShownCounter
local LoggerModule = require(IAPExperience.Utility.logger)
local GetAppContextModule = require(IAPExperience.Utility.getAppContext)

return function(p1, p2, p3) --[[ Line: 14 ]]
	-- upvalues: Default (copy), EconomicRestrictionsPromptShownCounter (copy), GetAppContextModule (copy), LoggerModule (copy), GetEconomicRestrictionLocalizedLabelModule (copy)
	local TimeoutMinutes = p2.timeoutMinutes or (p2.expirationTimeInMinutes or p2.ExpirationTimeInMinutes)
	local ViolationType = p2.violationType or (p2.failureReason or p2.FailureReason)
	Default:logRobloxTelemetryCounter(EconomicRestrictionsPromptShownCounter, 1, {
		violationType = tostring(ViolationType),
		appContext = GetAppContextModule()
	})
	
	if TimeoutMinutes and ViolationType then
		local EconomicRestrictionLocalizedLabelModule = GetEconomicRestrictionLocalizedLabelModule(p1, ViolationType)
		local Ceiled = math.ceil(TimeoutMinutes / 60)
		
		return if Ceiled >= 24 then (if p3 then p1.economicRestrictionBaseTextDaysGeneral else p1.economicRestrictionBaseTextDays):gsub("{day}", (tostring((math.ceil(Ceiled / 24))))):gsub("{violation}", EconomicRestrictionLocalizedLabelModule) else (if p3 then p1.economicRestrictionBaseTextHoursGeneral else p1.economicRestrictionBaseTextHours):gsub("{hour}", (tostring(Ceiled))):gsub("{violation}", EconomicRestrictionLocalizedLabelModule)
	else
		LoggerModule.error({
			error = "Timeout and violationType is required for economic restriction text. Showing unknown error.",
			timeoutMinutes = TimeoutMinutes,
			violationType = ViolationType
		})
		
		return p1.unknownText
	end
end