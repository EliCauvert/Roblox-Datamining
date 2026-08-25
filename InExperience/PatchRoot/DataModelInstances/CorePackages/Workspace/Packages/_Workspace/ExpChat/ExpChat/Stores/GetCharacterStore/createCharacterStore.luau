local createSignal = require(script:FindFirstAncestor("ExpChat").Parent.Signals).createSignal

return function()
	-- upvalues: createSignal (ref)
	local var0, var1 = createSignal({})
	
	local function _(p0)
		return tostring(p0)
	end
	
	return {
		getCharacters = var0,
		handleCharacterAdded = function(p1, p2)
			-- upvalues: var1 (ref)
			local var2 = tostring(p1)
			var1(function(p3)
				-- upvalues: var2 (ref), p2 (ref)
				local cloned = table.clone(p3)
				cloned[var2] = p2
				
				return cloned
			end)
		end,
		handlePlayerRemoved = function(p4)
			-- upvalues: var1 (ref)
			local var4 = tostring(p4)
			var1(function(p5)
				-- upvalues: var4 (ref)
				local cloned = table.clone(p5)
				cloned[var4] = nil
				
				return cloned
			end)
		end
	}
end