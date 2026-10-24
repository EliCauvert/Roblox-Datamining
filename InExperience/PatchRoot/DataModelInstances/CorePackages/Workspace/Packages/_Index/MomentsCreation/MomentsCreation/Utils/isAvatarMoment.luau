local MomentTypeModule = require(script:FindFirstAncestor("MomentsCreation").Enums.MomentType)

return function(p1): boolean
	-- upvalues: MomentTypeModule (copy)
	return type(p1) == "table" and p1.MomentType == MomentTypeModule.Avatar
end