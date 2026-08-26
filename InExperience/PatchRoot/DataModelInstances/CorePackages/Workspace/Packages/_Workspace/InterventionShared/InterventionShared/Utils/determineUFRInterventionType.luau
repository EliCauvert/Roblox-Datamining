local interventionTypes = require(script:FindFirstAncestor("InterventionShared").InterventionAnalytics).Constants.InterventionTypes

return function(p1)
	-- upvalues: interventionTypes (ref)
	local var1 = if p1 then p1:lower() else ""
	
	return if string.find(var1, "nudge") then interventionTypes.UFRNudge elseif string.find(var1, "timeout") then interventionTypes.UFRTimeout else interventionTypes.UFRTimeout
end