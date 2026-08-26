local debugFlagsModule = require(script:FindFirstAncestor("ultimate-list").DebugFlags)

return function(p1)
	-- upvalues: debugFlagsModule (ref)
	return function(p2, ...)
		-- upvalues: debugFlagsModule (copy), p1 (ref)
		if not debugFlagsModule.shouldLog then return end
		if typeof(p2) == "string" then
			print(`[{p1}] {string.format(p2, ...)}`)
			
			return
		end
		print(`[{p1}]`, p2(...))
	end
end