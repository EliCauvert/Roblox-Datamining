local signalModule = require(script:FindFirstAncestor("ViewRecycler").Parent.Signal)

return function() --[[ line: 15 | named "createEvent" ]]
	-- upvalues: signalModule (ref)
	local var1, var2 = signalModule.createSignal()
	
	return {
		fire = function(...) --[[ line: 21 ]]
			-- upvalues: var2 (ref)
			var2(table.pack(...))
		end,
		connect = function(p0) --[[ line: 25 ]]
			-- upvalues: var1 (ref)
			local var3 = var1:subscribe(function(p1) --[[ line: 26 ]]
				-- upvalues: p0 (ref)
				p0(table.unpack(p1, 1, p1.n))
			end)
			
			return function() --[[ line: 29 ]]
				-- upvalues: var3 (ref)
				var3:unsubscribe()
			end
		end
	}
end