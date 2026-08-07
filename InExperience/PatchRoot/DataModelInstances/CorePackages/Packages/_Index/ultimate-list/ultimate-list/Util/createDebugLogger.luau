local debugFlagsModule = require(script:FindFirstAncestor("ultimate-list").DebugFlags)

return function(p0) --[[ line: 7 | named "createDebugLogger" ]]
	-- upvalues: debugFlagsModule (ref)
	return function(p1, ...) --[[ line: 8 ]]
		-- upvalues: debugFlagsModule (copy), p0 (ref)
		if not debugFlagsModule.shouldLog then return end
		if typeof(p1) == "string" then
			print(`[{p0}] {string.format(p1, ...)}`)
			
			return
		end
		print(`[{p0}]`, p1(...))
	end
end