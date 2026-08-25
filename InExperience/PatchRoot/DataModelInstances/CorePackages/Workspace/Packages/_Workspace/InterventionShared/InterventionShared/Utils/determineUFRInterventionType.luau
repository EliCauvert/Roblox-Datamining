local interventionTypes = require(script:FindFirstAncestor("InterventionShared").InterventionAnalytics).Constants.InterventionTypes

return function(p0)
	-- upvalues: interventionTypes (ref)
	local var0 = if p0 then p0:lower() else ""
	
	return if string.find(var0, "nudge") then interventionTypes.UFRNudge elseif string.find(var0, "timeout") then interventionTypes.UFRTimeout else interventionTypes.UFRTimeout
end