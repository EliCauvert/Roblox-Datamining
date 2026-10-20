local PostRegisterAppPresenceModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Requests.PostRegisterAppPresence)
local PerformFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch

local function _(): string
	return "luaapp.presenceapi.register-app-presence"
end

return function(p1, p2)
	-- upvalues: PerformFetch (copy), PostRegisterAppPresenceModule (copy)
	assert(type(p2) == "string", string.format("PostRegisterAppPresence thunk expects locationId to be a string, was %s", (type(p2))))
	
	return PerformFetch.Single("luaapp.presenceapi.register-app-presence", function(_)
		-- upvalues: PostRegisterAppPresenceModule (upval), p1 (copy), p2 (copy)
		return PostRegisterAppPresenceModule(p1, p2)
	end)
end