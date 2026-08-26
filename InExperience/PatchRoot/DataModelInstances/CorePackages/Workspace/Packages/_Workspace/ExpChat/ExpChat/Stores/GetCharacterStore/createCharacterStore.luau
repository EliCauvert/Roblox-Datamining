local createSignal = require(script:FindFirstAncestor("ExpChat").Parent.Signals).createSignal

return function()
	-- upvalues: createSignal (ref)
	local var1, var2 = createSignal({})
	
	local function _(p1)
		return tostring(p1)
	end
	
	return {
		getCharacters = var1,
		handleCharacterAdded = function(p1, p2)
			-- upvalues: var2 (ref)
			local var3 = tostring(p1)
			var2(function(p3)
				-- upvalues: var3 (ref), p2 (ref)
				local cloned = table.clone(p3)
				cloned[var3] = p2
				
				return cloned
			end)
		end,
		handlePlayerRemoved = function(p1)
			-- upvalues: var2 (ref)
			local var3 = tostring(p1)
			var2(function(p2)
				-- upvalues: var3 (ref)
				local cloned = table.clone(p2)
				cloned[var3] = nil
				
				return cloned
			end)
		end
	}
end