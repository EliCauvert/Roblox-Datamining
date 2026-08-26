local _ = require(script:FindFirstAncestor("ViewRecyclerRoblox").Parent.ViewRecycler)

return {
	new = function(p1, p2)
		p2 = p2 or task.defer
		local t = {}
		local var1 = false
		local var2 = 0
		local var3 = true
		
		return {
			add = function(p3)
				-- upvalues: var3 (write), t (write), var1 (write), var2 (write), p2 (ref), p1 (ref)
				if not var3 then return end
				table.insert(t, p3)
				
				if var1 then
					return
				end
				var1 = true
				var2 += 1
				local var4 = var2
				p2(function()
					-- upvalues: var4 (ref), var2 (copy), var1 (copy), var3 (copy), t (copy), p1 (copy)
					if var4 ~= var2 then return end
					var1 = false
					
					if var3 then
						t = {}
						p1(t)
						
						return
					end
				end)
			end,
			cancelPending = function()
				-- upvalues: var2 (write), var1 (write), t (write)
				var2 += 1
				var1 = false
				t = {}
			end,
			destroy = function()
				-- upvalues: var3 (write), var2 (write), var1 (write), t (write)
				var3 = false
				var2 += 1
				var1 = false
				t = {}
			end
		}
	end
}