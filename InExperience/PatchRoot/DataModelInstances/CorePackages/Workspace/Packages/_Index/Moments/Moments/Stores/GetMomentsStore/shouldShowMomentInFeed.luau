local MomentStatus = require(script:FindFirstAncestor("Moments").Parent.MomentsTypes).Enums.MomentStatus

return function(p1): boolean --[[ Line: 11 | Named "shouldShowMomentInFeed" ]]
	-- upvalues: MomentStatus (copy)
	return p1.status ~= MomentStatus.Deleted and p1.isModerated ~= true
end