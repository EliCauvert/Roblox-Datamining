local squadsCore = script:FindFirstAncestor("SquadsCore")
local cryoModule = require(squadsCore.Parent.Cryo)
local encodeUserIdsModule = require(squadsCore.Common.encodeUserIds)

return function(p0)
	-- upvalues: cryoModule (ref), encodeUserIdsModule (ref)
	return encodeUserIdsModule(cryoModule.List.map(p0 or {}, function(p1)
		return p1.userId
	end))
end