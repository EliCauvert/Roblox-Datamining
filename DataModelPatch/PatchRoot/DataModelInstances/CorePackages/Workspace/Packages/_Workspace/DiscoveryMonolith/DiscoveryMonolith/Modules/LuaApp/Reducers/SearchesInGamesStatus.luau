local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Immutable = require(DiscoveryMonolith.Parent.AppCommonLib).Immutable
local SetSearchInGamesStatusModule = require(DiscoveryMonolith.Modules.LuaApp.Actions.SetSearchInGamesStatus)

return function(p1, p2)
	-- upvalues: SetSearchInGamesStatusModule (copy), Immutable (copy)
	local P0 = p1 or {}
	assert(P0, "")
	
	if p2.type == SetSearchInGamesStatusModule.name then
		P0 = Immutable.Set(P0, p2.searchUuid, p2.status)
	end
	return P0
end