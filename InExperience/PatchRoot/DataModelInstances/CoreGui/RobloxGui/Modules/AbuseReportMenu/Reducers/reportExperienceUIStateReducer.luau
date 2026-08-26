local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local _ = require(abuseReportMenu.Components.Types)
local playerMenuActions = require(abuseReportMenu.Components.Constants).PlayerMenuActions

return function(p1, p2)
	-- upvalues: playerMenuActions (ref)
	local cloned = table.clone(p1)
	
	if p2.type == playerMenuActions.UpdateComment then
		cloned.comment = p2.comment
	end
	return cloned
end