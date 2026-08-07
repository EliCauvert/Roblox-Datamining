local reactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

return function(p0, p1) --[[ line: 17 | named "useAsync" ]]
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState({ status = "loading" })
	reactModule.useEffect(function() --[[ line: 22 ]]
		-- upvalues: var2 (ref), p0 (ref)
		var2({ status = "loading" })
		local thread = task.spawn(function() --[[ line: 27 ]]
			-- upvalues: var2 (copy), p0 (copy)
			xpcall(function() --[[ line: 28 ]]
				-- upvalues: var2 (copy), p0 (copy)
				var2({ status = "ok", value = p0() })
			end, function(p2) --[[ line: 33 ]]
				-- upvalues: var2 (copy)
				var2({ status = "error", problem = p2 })
			end)
		end)
		
		return function() --[[ line: 41 ]]
			-- upvalues: thread (ref)
			task.cancel(thread)
		end
	end, p1)
	
	return var1
end