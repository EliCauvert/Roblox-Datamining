local SquadsCore = script:FindFirstAncestor("SquadsCore")
local CryoModule = require(SquadsCore.Parent.Cryo)
local EncodeUserIdsModule = require(SquadsCore.Common.encodeUserIds)

return function(p1)
	-- upvalues: CryoModule (copy), EncodeUserIdsModule (copy)
	return EncodeUserIdsModule((CryoModule.List.map(p1 or {}, function(p2)
		return p2.userId
	end)))
end