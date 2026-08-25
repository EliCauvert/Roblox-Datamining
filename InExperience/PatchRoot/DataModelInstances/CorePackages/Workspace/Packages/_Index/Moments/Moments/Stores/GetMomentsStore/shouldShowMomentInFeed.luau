local momentStatus = require(script:FindFirstAncestor("Moments").Parent.MomentsTypes).Enums.MomentStatus

return function(p0)
	-- upvalues: momentStatus (ref)
	return if p0.status == momentStatus.Deleted then false else p0.isModerated ~= true
end