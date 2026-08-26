local debugFlagsModule = require(script:FindFirstAncestor("ultimate-list").DebugFlags)

return function(p1)
	-- upvalues: debugFlagsModule (ref)
	return function(p2, ...)
		-- upvalues: debugFlagsModule (copy), p2 (ref)
		if not debugFlagsModule.shouldLog then return end
		if typeof(p2) == "string" then
			print(`[{p2}] {string.format(p2, ...)}`)
			
			return
		end
		print(`[{p2}]`, p2(...))
	end
end