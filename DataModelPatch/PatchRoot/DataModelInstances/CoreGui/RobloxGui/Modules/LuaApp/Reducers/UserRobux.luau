local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ImmutableModule = require(Modules.Common.Immutable)
local SetUserRobuxModule = require(Modules.LuaApp.Actions.SetUserRobux)

return function(p1, p2)
	-- upvalues: SetUserRobuxModule (copy), ImmutableModule (copy)
	local P0 = p1 or {}
	
	if p2.type == SetUserRobuxModule.name then
		P0 = ImmutableModule.Set(P0, p2.userId, p2.robux)
	end
	return P0
end