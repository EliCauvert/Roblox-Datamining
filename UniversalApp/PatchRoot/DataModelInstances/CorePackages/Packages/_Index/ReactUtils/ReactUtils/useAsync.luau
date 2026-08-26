local reactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

return function(p1, p2)
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState({ status = "loading" })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), p1 (ref)
		var2({ status = "loading" })
		local thread = task.spawn(function()
			-- upvalues: var2 (copy), p1 (copy)
			xpcall(function()
				-- upvalues: var2 (copy), p1 (copy)
				var2({ status = "ok", value = p1() })
			end, function(p3)
				-- upvalues: var2 (copy)
				var2({ status = "error", problem = p3 })
			end)
		end)
		
		return function()
			-- upvalues: thread (ref)
			task.cancel(thread)
		end
	end, p2)
	
	return var1
end