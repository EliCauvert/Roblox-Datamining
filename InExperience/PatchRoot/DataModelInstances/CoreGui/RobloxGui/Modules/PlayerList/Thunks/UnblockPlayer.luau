local BlockingUtilityModule = require(game:GetService("CorePackages").Workspace.Packages.BlockingUtility)
local SetPlayerIsBlockedModule = require(script.Parent.Parent.Actions.SetPlayerIsBlocked)

return function(p1) --[[ Line: 9 | Named "UnblockPlayer" ]]
	-- upvalues: BlockingUtilityModule (copy), SetPlayerIsBlockedModule (copy)
	return function(p2) --[[ Line: 10 ]]
		-- upvalues: BlockingUtilityModule (upval), p1 (copy), SetPlayerIsBlockedModule (upval)
		coroutine.wrap(function() --[[ Line: 11 ]]
			-- upvalues: BlockingUtilityModule (upval), p1 (upval), p2 (copy), SetPlayerIsBlockedModule (upval)
			if BlockingUtilityModule:UnblockPlayerAsync(p1) then
				p2:dispatch(SetPlayerIsBlockedModule(p1, false))
			end
		end)()
	end
end