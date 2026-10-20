local Parent = script:FindFirstAncestor("Moments").Parent
local Analytics = require(Parent.MomentsCommon).Analytics
local MomentStatus = require(Parent.MomentsTypes).Enums.MomentStatus

return function(p1, p2)
	-- upvalues: MomentStatus (copy), Analytics (copy)
	if p1.status == MomentStatus.Deleted then
		Analytics.reportMomentsFeedItemFiltered("deleted", p2)
		
		return
	end
	if p1.isModerated == true then
		Analytics.reportMomentsFeedItemFiltered("moderated", p2)
	end
end