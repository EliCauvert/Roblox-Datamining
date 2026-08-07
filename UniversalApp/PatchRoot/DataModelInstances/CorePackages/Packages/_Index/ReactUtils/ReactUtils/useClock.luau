local reactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

return function() --[[ line: 7 | named "useClock" ]]
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useBinding(0)
	reactModule.useEffect(function() --[[ line: 10 ]]
		-- upvalues: var2 (ref), var1 (ref)
		local thread = task.spawn(function() --[[ line: 11 ]]
			-- upvalues: var2 (copy), var1 (copy)
			while true do
				var2(var1:getValue() + task.wait())
			end
		end)
		
		return function() --[[ line: 18 ]]
			-- upvalues: thread (ref)
			task.cancel(thread)
		end
	end, {})
	
	return var1
end