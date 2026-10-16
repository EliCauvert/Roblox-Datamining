local BlockingUtilityModule = require(game:GetService("CorePackages").Workspace.Packages.BlockingUtility)
local ShowToastModule = require(script.Parent.Parent.Actions.ShowToast)

return function(p1, p2, p3) --[[ Line: 7 | Named "BlockPlayer" ]]
	-- upvalues: BlockingUtilityModule (copy), ShowToastModule (copy)
	return function(p4) --[[ Line: 8 ]]
		-- upvalues: BlockingUtilityModule (upval), p1 (copy), ShowToastModule (upval), p2 (copy), p3 (copy)
		coroutine.wrap(function() --[[ Line: 9 ]]
			-- upvalues: BlockingUtilityModule (upval), p1 (upval), p4 (copy), ShowToastModule (upval), p2 (upval), p3 (upval)
			if BlockingUtilityModule:BlockPlayerAsync(p1) then
				p4:dispatch(ShowToastModule(p2, p3))
			end
		end)()
	end
end