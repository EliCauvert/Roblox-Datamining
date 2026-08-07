local safetyService = game:GetService("SafetyService")

return {
	reportMenuTabOpen = function() --[[ line: 8 ]]
		-- upvalues: safetyService (ref)
		safetyService:ReportMenuTabOpen()
	end,
	reportMenuTabClose = function() --[[ line: 12 ]]
		-- upvalues: safetyService (ref)
		safetyService:ReportMenuTabClose()
	end
}