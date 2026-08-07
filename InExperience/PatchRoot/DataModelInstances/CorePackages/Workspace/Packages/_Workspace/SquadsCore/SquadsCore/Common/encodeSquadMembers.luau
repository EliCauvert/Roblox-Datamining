local squadsCore = script:FindFirstAncestor("SquadsCore")
local cryoModule = require(squadsCore.Parent.Cryo)
local encodeUserIdsModule = require(squadsCore.Common.encodeUserIds)

return function(p0) --[[ line: 8 | named "encodeSquadMembers" ]]
	-- upvalues: cryoModule (ref), encodeUserIdsModule (ref)
	return encodeUserIdsModule(cryoModule.List.map(p0 or {}, function(p1) --[[ line: 9 ]]
		return p1.userId
	end))
end