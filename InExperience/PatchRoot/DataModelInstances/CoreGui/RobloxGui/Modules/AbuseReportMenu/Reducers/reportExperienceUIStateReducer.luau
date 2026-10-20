local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local _ = require(AbuseReportMenu.Components.Types)
local PlayerMenuActions = require(AbuseReportMenu.Components.Constants).PlayerMenuActions

return function(Tbl, p1)
	-- upvalues: PlayerMenuActions (copy)
	local Copy = table.clone(Tbl)
	
	if p1.type == PlayerMenuActions.UpdateComment then
		Copy.comment = p1.comment
	end
	return Copy
end