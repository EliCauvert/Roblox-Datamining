local blockingUtilityModule = require(game:GetService("CorePackages").Workspace.Packages.BlockingUtility)
local setPlayerIsBlockedModule = require(script.Parent.Parent.Actions.SetPlayerIsBlocked)

return function(p0) --[[ line: 9 | named "UnblockPlayer" ]]
	-- upvalues: blockingUtilityModule (ref), setPlayerIsBlockedModule (ref)
	return function(p1) --[[ line: 10 ]]
		-- upvalues: blockingUtilityModule (copy), p0 (ref), setPlayerIsBlockedModule (copy)
		coroutine.wrap(function() --[[ line: 11 ]]
			-- upvalues: blockingUtilityModule (copy), p0 (copy), p1 (ref), setPlayerIsBlockedModule (copy)
			if blockingUtilityModule:UnblockPlayerAsync(p0) then
				p1:dispatch(setPlayerIsBlockedModule(p0, false))
			end
		end)()
	end
end