local BlockingUtilityModule = require(game:GetService("CorePackages").Workspace.Packages.BlockingUtility)
local SetPlayerIsBlockedModule = require(script.Parent.Parent.Actions.SetPlayerIsBlocked)

return function(p1)
	-- upvalues: BlockingUtilityModule (copy), SetPlayerIsBlockedModule (copy)
	return function(p2)
		-- upvalues: BlockingUtilityModule (upval), p1 (copy), SetPlayerIsBlockedModule (upval)
		coroutine.wrap(function()
			-- upvalues: BlockingUtilityModule (upval), p1 (upval), p2 (copy), SetPlayerIsBlockedModule (upval)
			if BlockingUtilityModule:UnblockPlayerAsync(p1) then
				p2:dispatch(SetPlayerIsBlockedModule(p1, false))
			end
		end)()
	end
end