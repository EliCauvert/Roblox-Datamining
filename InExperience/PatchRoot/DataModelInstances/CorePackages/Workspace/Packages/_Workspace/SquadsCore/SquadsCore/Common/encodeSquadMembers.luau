local SquadsCore = script:FindFirstAncestor("SquadsCore")
local CryoModule = require(SquadsCore.Parent.Cryo)
local EncodeUserIdsModule = require(SquadsCore.Common.encodeUserIds)

return function(p1) --[[ Line: 8 | Named "encodeSquadMembers" ]]
	-- upvalues: CryoModule (copy), EncodeUserIdsModule (copy)
	return EncodeUserIdsModule((CryoModule.List.map(p1 or {}, function(p2) --[[ Line: 9 ]]
		return p2.userId
	end)))
end