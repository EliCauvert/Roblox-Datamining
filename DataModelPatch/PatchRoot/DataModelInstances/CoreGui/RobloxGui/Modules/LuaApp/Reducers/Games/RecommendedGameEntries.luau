local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ImmutableModule = require(Modules.Common.Immutable)
local SetRecommendedGameEntriesModule = require(Modules.LuaApp.Actions.Games.SetRecommendedGameEntries)

return function(p1, p2)
	-- upvalues: SetRecommendedGameEntriesModule (copy), ImmutableModule (copy)
	local P0 = p1 or {}
	assert(P0, "")
	
	if p2.type == SetRecommendedGameEntriesModule.name then
		P0 = ImmutableModule.Set(P0, p2.universeId, p2.entries)
	end
	return P0
end