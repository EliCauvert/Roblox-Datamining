local reactRobloxModule = require(script:FindFirstAncestor("ReactUtils").Parent.ReactRoblox)

return setmetatable({
	act = function() --[[ line: 13 ]]
		-- upvalues: reactRobloxModule (ref)
		reactRobloxModule.act(function() --[[ line: 14 ]]
			task.wait(0)
		end)
	end
}, {
	__call = function() --[[ line: 6 ]]
		task.wait(0)
	end
})