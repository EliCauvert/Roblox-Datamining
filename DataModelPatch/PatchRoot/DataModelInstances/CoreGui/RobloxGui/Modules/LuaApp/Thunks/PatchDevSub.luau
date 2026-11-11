local DevSubsPatchDevSubModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Requests.DevSubsPatchDevSub)
local PerformFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch

return {
	Patch = function(p1, p2, p3)
		-- upvalues: PerformFetch (copy), DevSubsPatchDevSubModule (copy)
		return PerformFetch.Single("luaapp.devsubs.cancelsubscription", function(_)
			-- upvalues: DevSubsPatchDevSubModule (upval), p1 (copy), p2 (copy), p3 (copy)
			return DevSubsPatchDevSubModule(p1, p2, p3)
		end)
	end,
	GetPatchingStatus = function(p1)
		-- upvalues: PerformFetch (copy)
		return PerformFetch.GetStatus(p1, "luaapp.devsubs.cancelsubscription")
	end
}