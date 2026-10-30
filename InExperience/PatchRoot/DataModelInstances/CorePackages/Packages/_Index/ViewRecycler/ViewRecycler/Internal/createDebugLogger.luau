local DebugFlagsModule = require(script:FindFirstAncestor("ViewRecycler").Internal.DebugFlags)

return function(p1)
	-- upvalues: DebugFlagsModule (copy)
	return function(Callback: string, ...)
		-- upvalues: DebugFlagsModule (upval), p1 (copy)
		if not DebugFlagsModule.shouldLog then return end
		if typeof(Callback) == "string" then
			print(`[{p1}] {string.format(Callback, ...)}`)
			
			return
		else
			print(`[{p1}]`, Callback(...))
		end
	end
end