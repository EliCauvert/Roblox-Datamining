local signalModule = require(script:FindFirstAncestor("ViewRecycler").Parent.Signal)

return function()
	-- upvalues: signalModule (ref)
	local var1, var2 = signalModule.createSignal()
	
	return {
		fire = function(...)
			-- upvalues: var2 (ref)
			var2(table.pack(...))
		end,
		connect = function(p1)
			-- upvalues: var1 (ref)
			local var3 = var1:subscribe(function(p2)
				-- upvalues: p1 (ref)
				p1(table.unpack(p2, 1, p2.n))
			end)
			
			return function()
				-- upvalues: var3 (ref)
				var3:unsubscribe()
			end
		end
	}
end