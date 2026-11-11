local ActFunction = require(script:FindFirstAncestor("TestUtils").Parent.ReactRoblox).act

return function(p1, p2)
	-- upvalues: ActFunction (copy)
	local v1 = if p2 == nil then 1 else p2
	local NewClockTime = os.clock() + v1
	local v2 = nil
	local Result3 = nil
	while os.clock() < NewClockTime do
		local Success, Result
		Success, Result, Result3 = pcall(p1)
		
		if Success and Result then
			return Result3
		end
		if not Success then
			v2 = Result
		end
		ActFunction(function()
			task.wait()
		end)
	end
	local Message: string = ("operation has timed out (maximum time allowed was %f seconds)"):format(v1)
	
	if v2 ~= nil then
		Message ..= ": " .. tostring(v2)
	end
	error(Message)
end