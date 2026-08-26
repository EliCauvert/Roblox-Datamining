local reactRobloxModule = require(script.Parent.Parent.Parent.Dev.ReactRoblox)

return function(p1, p2)
	-- upvalues: reactRobloxModule (ref)
	p2 = p2 or 1
	local var1 = 0
	while var1 < p2 and not p1() do
		reactRobloxModule.act(function()
			-- upvalues: var1 (write)
			var1 += task.wait()
		end)
	end
end