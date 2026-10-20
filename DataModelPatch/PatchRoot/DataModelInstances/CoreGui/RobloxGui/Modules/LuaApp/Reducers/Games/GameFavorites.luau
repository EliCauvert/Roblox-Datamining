local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ImmutableModule = require(Modules.Common.Immutable)
local SetGameFavoriteModule = require(Modules.LuaApp.Actions.Games.SetGameFavorite)

return function(p1, p2)
	-- upvalues: SetGameFavoriteModule (copy), ImmutableModule (copy)
	local P0 = p1 or {}
	assert(P0, "")
	
	if p2.type == SetGameFavoriteModule.name then
		P0 = ImmutableModule.Set(P0, p2.universeId, p2.isFavorited)
	end
	return P0
end