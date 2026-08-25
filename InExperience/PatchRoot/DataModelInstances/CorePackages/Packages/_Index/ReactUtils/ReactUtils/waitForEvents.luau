local reactRobloxModule = require(script:FindFirstAncestor("ReactUtils").Parent.ReactRoblox)

return setmetatable({
	act = function()
		-- upvalues: reactRobloxModule (ref)
		reactRobloxModule.act(function()
			task.wait(0)
		end)
	end
}, {
	__call = function()
		task.wait(0)
	end
})