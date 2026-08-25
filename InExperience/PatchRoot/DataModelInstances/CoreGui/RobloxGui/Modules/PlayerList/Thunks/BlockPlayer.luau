local blockingUtilityModule = require(game:GetService("CorePackages").Workspace.Packages.BlockingUtility)
local setPlayerIsBlockedModule = require(script.Parent.Parent.Actions.SetPlayerIsBlocked)

return function(p0)
	-- upvalues: blockingUtilityModule (ref), setPlayerIsBlockedModule (ref)
	return function(p1)
		-- upvalues: blockingUtilityModule (copy), p0 (ref), setPlayerIsBlockedModule (copy)
		coroutine.wrap(function()
			-- upvalues: blockingUtilityModule (copy), p0 (copy), p1 (ref), setPlayerIsBlockedModule (copy)
			if blockingUtilityModule:BlockPlayerAsync(p0) then
				p1:dispatch(setPlayerIsBlockedModule(p0, true))
			end
		end)()
	end
end