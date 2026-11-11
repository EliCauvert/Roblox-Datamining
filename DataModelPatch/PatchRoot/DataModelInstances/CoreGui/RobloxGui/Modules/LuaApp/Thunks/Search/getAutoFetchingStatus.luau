local GetAutoFetchNameModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Thunks.Search.getAutoFetchName)
local PerformFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch

return function(p1, p2)
	-- upvalues: PerformFetch (copy), GetAutoFetchNameModule (copy)
	return PerformFetch.GetStatus(p1, GetAutoFetchNameModule(p2))
end