local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ImmutableModule = require(Modules.Common.Immutable)
local RetrievalStatusModule = require(Modules.LuaApp.Enum.RetrievalStatus)
local FetchingUserModule = require(Modules.LuaApp.Actions.FetchingUser)
local AddUserModule = require(Modules.LuaApp.Actions.AddUser)

return function(p1, p2)
	-- upvalues: FetchingUserModule (copy), ImmutableModule (copy), AddUserModule (copy), RetrievalStatusModule (copy)
	local P0 = p1 or {}
	assert(P0, "")
	
	if p2.type == FetchingUserModule.name then
		P0 = ImmutableModule.Set(P0, p2.userId, p2.status)
		
		return P0
	end
	if p2.type == AddUserModule.name then
		P0 = ImmutableModule.Set(P0, p2.user.id, RetrievalStatusModule.Done)
	end
	return P0
end