local parent = script:FindFirstAncestor("Moments").Parent
local analytics = require(parent.MomentsCommon).Analytics
local momentStatus = require(parent.MomentsTypes).Enums.MomentStatus

return function(p1, p2)
	-- upvalues: momentStatus (ref), analytics (ref)
	if p1.status == momentStatus.Deleted then
		analytics.reportMomentsFeedItemFiltered("deleted", p2)
		
		return
	elseif p1.isModerated == true then
		analytics.reportMomentsFeedItemFiltered("moderated", p2)
	end
end