local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Immutable = require(DiscoveryMonolith.Parent.AppCommonLib).Immutable
local UpdateGameMediaModule = require(DiscoveryMonolith.Modules.LuaApp.Actions.Games.UpdateGameMedia)

return function(p1, p2)
	-- upvalues: UpdateGameMediaModule (copy), Immutable (copy)
	local P0 = p1 or {}
	assert(P0, "")
	
	if p2.type == UpdateGameMediaModule.name then
		P0 = Immutable.Set(P0, p2.universeId, p2.entries)
	end
	return P0
end