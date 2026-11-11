local ReactRobloxModule = require(script.Parent.Parent.Parent.Dev.ReactRoblox)

return function(p1, p2)
	-- upvalues: ReactRobloxModule (copy)
	local P1 = p2 or 1
	local NewElapsed = 0
	while NewElapsed < P1 and not p1() do
		ReactRobloxModule.act(function()
			-- upvalues: NewElapsed (ref)
			NewElapsed += task.wait()
		end)
	end
end