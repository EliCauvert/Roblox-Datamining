local signalsModule = require(script:FindFirstAncestor("Moments").Parent.Signals)

return function()
	-- upvalues: signalsModule (ref)
	local var1, var2 = signalsModule.createSignal({})
	local var3 = 0
	
	return {
		getTopShellId = signalsModule.createComputed(function(p1)
			-- upvalues: var1 (ref)
			local var4 = var1(p1)
			
			return var4[#var4]
		end),
		pushShell = function()
			-- upvalues: var3 (write), var2 (ref)
			var3 += 1
			local var4 = var3
			var2(function(p1)
				-- upvalues: var4 (ref)
				local cloned = table.clone(p1)
				table.insert(cloned, var4)
				
				return cloned
			end)
			
			return var4, function()
				-- upvalues: var2 (copy), var4 (ref)
				var2(function(p1)
					-- upvalues: var4 (copy)
					local index = table.find(p1, var4)
					
					if index == nil then
						return p1
					end
					local cloned = table.clone(p1)
					table.remove(cloned, index)
					
					return cloned
				end)
			end
		end
	}
end