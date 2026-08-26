local squadsCore = script:FindFirstAncestor("SquadsCore")
local cryoModule = require(squadsCore.Parent.Cryo)
local encodeUserIdsModule = require(squadsCore.Common.encodeUserIds)

return function(p1)
	-- upvalues: cryoModule (ref), encodeUserIdsModule (ref)
	return encodeUserIdsModule(cryoModule.List.map(p1 or {}, function(p2)
		return p2.userId
	end))
end