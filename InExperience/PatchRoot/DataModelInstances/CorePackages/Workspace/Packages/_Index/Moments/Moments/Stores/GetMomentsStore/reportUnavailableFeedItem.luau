local parent = script:FindFirstAncestor("Moments").Parent
local analytics = require(parent.MomentsCommon).Analytics
local momentStatus = require(parent.MomentsTypes).Enums.MomentStatus

return function(p0, p1) --[[ line: 24 | named "reportUnavailableFeedItem" ]]
	-- upvalues: momentStatus (ref), analytics (ref)
	if p0.status == momentStatus.Deleted then
		analytics.reportMomentsFeedItemFiltered("deleted", p1)
		
		return
	elseif p0.isModerated == true then
		analytics.reportMomentsFeedItemFiltered("moderated", p1)
	end
end