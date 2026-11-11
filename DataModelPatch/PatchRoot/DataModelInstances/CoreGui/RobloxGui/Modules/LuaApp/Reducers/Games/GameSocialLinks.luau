local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ImmutableModule = require(Modules.Common.Immutable)
local SetGameSocialLinksModule = require(Modules.LuaApp.Actions.Games.SetGameSocialLinks)

return function(p1, p2)
	-- upvalues: SetGameSocialLinksModule (copy), ImmutableModule (copy)
	local P0 = p1 or {}
	assert(P0, "")
	
	if p2.type == SetGameSocialLinksModule.name then
		P0 = ImmutableModule.Set(P0, p2.universeId, p2.socialLinks)
	end
	return P0
end