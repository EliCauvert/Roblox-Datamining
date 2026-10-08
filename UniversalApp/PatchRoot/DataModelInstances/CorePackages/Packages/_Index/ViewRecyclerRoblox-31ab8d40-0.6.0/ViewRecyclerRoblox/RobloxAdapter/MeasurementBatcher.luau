local _ = require(script:FindFirstAncestor("ViewRecyclerRoblox").Parent.ViewRecycler)

return {
	new = function(p1, p2)
		p2 = p2 or task.defer
		local var1 = nil
		local var2 = true
		
		return {
			add = function(p3)
				-- upvalues: var2 (write), var1 (write), p2 (ref), p1 (ref)
				if not var2 then return end
				local var3 = var1
				
				if var3 == nil then
					var3 = {}
					var1 = var3
					p2(function()
						-- upvalues: var2 (copy), var1 (copy), var3 (write), p1 (copy)
						if var2 and var1 == var3 then
							var1 = nil
							p1(var3)
						end
					end)
				end
				table.insert(var3, p3)
			end,
			flush = function()
				-- upvalues: var1 (write), var2 (write), p1 (ref)
				if var2 and var1 ~= nil then
					var1 = nil
					p1(var1)
					
					return var1
				end
				return nil
			end,
			cancelPending = function()
				-- upvalues: var1 (write)
				var1 = nil
			end,
			destroy = function()
				-- upvalues: var2 (write), var1 (write)
				var2 = false
				var1 = nil
			end
		}
	end
}