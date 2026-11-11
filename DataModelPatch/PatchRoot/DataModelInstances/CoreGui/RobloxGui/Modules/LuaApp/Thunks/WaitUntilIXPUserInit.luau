local Modules = game:GetService("CoreGui").RobloxGui.Modules
local FetchIXPUserInitModule = require(Modules.LuaApp.Thunks.FetchIXPUserInit)
local RetrievalStatus = require(game:GetService("CorePackages").Workspace.Packages.Http).Enum.RetrievalStatus
local PromiseModule = require(Modules.LuaApp.Promise)

return function(p1, p2, p3)
	-- upvalues: FetchIXPUserInitModule (copy), RetrievalStatus (copy), PromiseModule (copy)
	return function(p4)
		-- upvalues: FetchIXPUserInitModule (upval), p2 (copy), p1 (copy), RetrievalStatus (upval), PromiseModule (upval), p3 (copy)
		local FetchingStatus = FetchIXPUserInitModule.GetFetchingStatus(p4:getState(), p2, p1)
		
		return if FetchingStatus == RetrievalStatus.Done or FetchingStatus == RetrievalStatus.Failed then PromiseModule.resolve() else PromiseModule.new(function(Callback, _)
			-- upvalues: p4 (copy), FetchIXPUserInitModule (upval), p1 (upval), p2 (upval), p3 (upval)
			p4:dispatch(FetchIXPUserInitModule.Fetch(p1, p2, p3)):andThen(function()
				-- upvalues: Callback (copy)
				Callback()
			end, function()
				-- upvalues: Callback (copy)
				Callback()
			end)
		end)
	end
end