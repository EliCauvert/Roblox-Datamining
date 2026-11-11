local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ImmutableModule = require(Modules.Common.Immutable)
local SetGameFollowingStatusModule = require(Modules.LuaApp.Actions.SetGameFollowingStatus)
local SetGameFollowModule = require(Modules.LuaApp.Actions.SetGameFollow)

return function(p1, p2)
	-- upvalues: SetGameFollowingStatusModule (copy), ImmutableModule (copy), SetGameFollowModule (copy)
	local P0 = p1 or {}
	
	if p2.type == SetGameFollowingStatusModule.name then
		P0 = ImmutableModule.Set(P0, p2.universeId, { canFollow = p2.canFollow, isFollowed = p2.isFollowed })
		
		return P0
	end
	if p2.type == SetGameFollowModule.name then
		local Entry = P0[p2.universeId]
		
		if Entry then
			P0 = ImmutableModule.Set(P0, p2.universeId, (ImmutableModule.Set(Entry, "isFollowed", p2.isFollowed)))
		end
	end
	return P0
end