local SafetyService = game:GetService("SafetyService")

return {
	reportMenuTabOpen = function() --[[ Line: 8 ]]
		-- upvalues: SafetyService (copy)
		SafetyService:ReportMenuTabOpen()
	end,
	reportMenuTabClose = function() --[[ Line: 12 ]]
		-- upvalues: SafetyService (copy)
		SafetyService:ReportMenuTabClose()
	end
}