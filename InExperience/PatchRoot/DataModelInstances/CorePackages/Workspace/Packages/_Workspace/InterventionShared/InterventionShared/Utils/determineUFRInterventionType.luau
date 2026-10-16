local InterventionTypes = require(script:FindFirstAncestor("InterventionShared").InterventionAnalytics).Constants.InterventionTypes

return function(Text: string) --[[ Line: 13 ]]
	-- upvalues: InterventionTypes (copy)
	local Lowered = if Text then Text:lower() else ""
	
	return if string.find(Lowered, "nudge") then InterventionTypes.UFRNudge elseif string.find(Lowered, "timeout") then InterventionTypes.UFRTimeout else InterventionTypes.UFRTimeout
end