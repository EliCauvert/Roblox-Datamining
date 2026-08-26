local momentStatus = require(script:FindFirstAncestor("Moments").Parent.MomentsTypes).Enums.MomentStatus

return function(p1)
	-- upvalues: momentStatus (ref)
	return if p1.status == momentStatus.Deleted then false else p1.isModerated ~= true
end