local blockingUtilityModule = require(game:GetService("CorePackages").Workspace.Packages.BlockingUtility)
local setPlayerIsBlockedModule = require(script.Parent.Parent.Actions.SetPlayerIsBlocked)

return function(p1)
	-- upvalues: blockingUtilityModule (ref), setPlayerIsBlockedModule (ref)
	return function(p2)
		-- upvalues: blockingUtilityModule (copy), p1 (ref), setPlayerIsBlockedModule (copy)
		coroutine.wrap(function()
			-- upvalues: blockingUtilityModule (copy), p1 (copy), p2 (ref), setPlayerIsBlockedModule (copy)
			if blockingUtilityModule:BlockPlayerAsync(p1) then
				p2:dispatch(setPlayerIsBlockedModule(p1, true))
			end
		end)()
	end
end