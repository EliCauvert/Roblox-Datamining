local safetyService = game:GetService("SafetyService")

return {
	reportMenuTabOpen = function()
		-- upvalues: safetyService (ref)
		safetyService:ReportMenuTabOpen()
	end,
	reportMenuTabClose = function()
		-- upvalues: safetyService (ref)
		safetyService:ReportMenuTabClose()
	end
}