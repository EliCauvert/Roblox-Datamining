local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local _ = require(abuseReportMenu.Components.Types)
local playerMenuActions = require(abuseReportMenu.Components.Constants).PlayerMenuActions

return function(p0, p1)
	-- upvalues: playerMenuActions (ref)
	local cloned = table.clone(p0)
	
	if p1.type == playerMenuActions.UpdateComment then
		cloned.comment = p1.comment
	end
	return cloned
end