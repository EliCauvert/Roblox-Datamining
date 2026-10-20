local ReactRobloxModule = require(script:FindFirstAncestor("ReactUtils").Parent.ReactRoblox)

return (setmetatable({
	act = function()
		-- upvalues: ReactRobloxModule (copy)
		ReactRobloxModule.act(function()
			task.wait(0)
		end)
	end
}, {
	__call = function()
		task.wait(0)
	end
}))