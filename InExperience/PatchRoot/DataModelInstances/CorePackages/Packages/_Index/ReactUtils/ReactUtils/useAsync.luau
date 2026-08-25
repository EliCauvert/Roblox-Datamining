local reactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

return function(p0, p1)
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState({ status = "loading" })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), p0 (ref)
		var2({ status = "loading" })
		local thread = task.spawn(function()
			-- upvalues: var2 (copy), p0 (copy)
			xpcall(function()
				-- upvalues: var2 (copy), p0 (copy)
				var2({ status = "ok", value = p0() })
			end, function(p2)
				-- upvalues: var2 (copy)
				var2({ status = "error", problem = p2 })
			end)
		end)
		
		return function()
			-- upvalues: thread (ref)
			task.cancel(thread)
		end
	end, p1)
	
	return var1
end