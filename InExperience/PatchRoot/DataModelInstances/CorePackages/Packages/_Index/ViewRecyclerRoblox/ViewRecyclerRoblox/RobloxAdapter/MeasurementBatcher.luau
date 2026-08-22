local _ = require(script:FindFirstAncestor("ViewRecyclerRoblox").Parent.ViewRecycler)

return {
	new = function(p0, p1) --[[ line: 12 ]]
		p1 = p1 or task.defer
		local t = {}
		local var2 = false
		local var3 = 0
		local var4 = true
		
		return {
			add = function(p2) --[[ line: 22 ]]
				-- upvalues: var4 (write), t (write), var2 (write), var3 (write), p1 (ref), p0 (ref)
				if not var4 then return end
				table.insert(t, p2)
				
				if var2 then
					return
				end
				var2 = true
				var3 += 1
				local var5 = var3
				p1(function() --[[ line: 33 ]]
					-- upvalues: var5 (ref), var3 (copy), var2 (copy), var4 (copy), t (copy), p0 (copy)
					if var5 ~= var3 then return end
					var2 = false
					
					if var4 then
						t = {}
						p0(t)
						
						return
					end
				end)
			end,
			cancelPending = function() --[[ line: 47 ]]
				-- upvalues: var3 (write), var2 (write), t (write)
				var3 += 1
				var2 = false
				t = {}
			end,
			destroy = function() --[[ line: 56 ]]
				-- upvalues: var4 (write), var3 (write), var2 (write), t (write)
				var4 = false
				var3 += 1
				var2 = false
				t = {}
			end
		}
	end
}