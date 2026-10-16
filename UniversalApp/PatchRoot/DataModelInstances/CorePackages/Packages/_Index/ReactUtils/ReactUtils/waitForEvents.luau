local ReactRobloxModule = require(script:FindFirstAncestor("ReactUtils").Parent.ReactRoblox)

return (setmetatable({
	act = function() --[[ Line: 13 ]]
		-- upvalues: ReactRobloxModule (copy)
		ReactRobloxModule.act(function() --[[ Line: 14 ]]
			task.wait(0)
		end)
	end
}, {
	__call = function() --[[ Line: 6 ]]
		task.wait(0)
	end
}))