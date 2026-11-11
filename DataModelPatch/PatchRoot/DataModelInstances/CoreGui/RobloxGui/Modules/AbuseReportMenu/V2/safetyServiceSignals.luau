local SafetyService = game:GetService("SafetyService")

return {
	reportMenuTabOpen = function()
		-- upvalues: SafetyService (copy)
		SafetyService:ReportMenuTabOpen()
	end,
	reportMenuTabClose = function()
		-- upvalues: SafetyService (copy)
		SafetyService:ReportMenuTabClose()
	end
}