local reactRobloxModule = require(script.Parent.Parent.Parent.Dev.ReactRoblox)

return function(p0, p1) --[[ line: 6 ]]
	-- upvalues: reactRobloxModule (ref)
	p1 = p1 or 1
	local var1 = 0
	while var1 < p1 and not p0() do
		reactRobloxModule.act(function() --[[ line: 10 ]]
			-- upvalues: var1 (write)
			var1 += task.wait()
		end)
	end
end