local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ImmutableModule = require(Modules.Common.Immutable)
local SetSearchParametersModule = require(Modules.LuaApp.Actions.SetSearchParameters)

return function(p1, p2)
	-- upvalues: SetSearchParametersModule (copy), ImmutableModule (copy)
	local P0 = p1 or {}
	assert(P0, "")
	
	if p2.type == SetSearchParametersModule.name then
		P0 = ImmutableModule.Set(P0, p2.searchUuid, p2.parameters)
	end
	return P0
end