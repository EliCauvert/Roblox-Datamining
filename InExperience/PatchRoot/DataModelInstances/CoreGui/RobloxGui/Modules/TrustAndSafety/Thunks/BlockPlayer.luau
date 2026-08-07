local blockingUtilityModule = require(game:GetService("CorePackages").Workspace.Packages.BlockingUtility)
local showToastModule = require(script.Parent.Parent.Actions.ShowToast)

return function(p0, p1, p2) --[[ line: 7 | named "BlockPlayer" ]]
	-- upvalues: blockingUtilityModule (ref), showToastModule (ref)
	return function(p3) --[[ line: 8 ]]
		-- upvalues: blockingUtilityModule (copy), p0 (ref), showToastModule (copy), p1 (ref), p2 (ref)
		coroutine.wrap(function() --[[ line: 9 ]]
			-- upvalues: blockingUtilityModule (copy), p0 (copy), p3 (ref), showToastModule (copy), p1 (copy), p2 (copy)
			if blockingUtilityModule:BlockPlayerAsync(p0) then
				p3:dispatch(showToastModule(p1, p2))
			end
		end)()
	end
end