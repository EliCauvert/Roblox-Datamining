local blockingUtilityModule = require(game:GetService("CorePackages").Workspace.Packages.BlockingUtility)
local showToastModule = require(script.Parent.Parent.Actions.ShowToast)

return function(p1, p2, p3)
	-- upvalues: blockingUtilityModule (ref), showToastModule (ref)
	return function(p4)
		-- upvalues: blockingUtilityModule (copy), p1 (ref), showToastModule (copy), p2 (ref), p3 (ref)
		coroutine.wrap(function()
			-- upvalues: blockingUtilityModule (copy), p1 (copy), p4 (ref), showToastModule (copy), p2 (copy), p3 (copy)
			if blockingUtilityModule:BlockPlayerAsync(p1) then
				p4:dispatch(showToastModule(p2, p3))
			end
		end)()
	end
end