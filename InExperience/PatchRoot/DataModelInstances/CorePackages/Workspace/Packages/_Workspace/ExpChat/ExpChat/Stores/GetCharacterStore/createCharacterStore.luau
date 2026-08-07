local createSignal = require(script:FindFirstAncestor("ExpChat").Parent.Signals).createSignal

return function() --[[ line: 19 | named "createCharacterStore" ]]
	-- upvalues: createSignal (ref)
	local var0, var1 = createSignal({})
	
	local function _(p0) --[[ line: 23 | named "getKey" ]]
		return tostring(p0)
	end
	
	return {
		getCharacters = var0,
		handleCharacterAdded = function(p1, p2) --[[ line: 27 ]]
			-- upvalues: var1 (ref)
			local var2 = tostring(p1)
			var1(function(p3) --[[ line: 30 ]]
				-- upvalues: var2 (ref), p2 (ref)
				local cloned = table.clone(p3)
				cloned[var2] = p2
				
				return cloned
			end)
		end,
		handlePlayerRemoved = function(p4) --[[ line: 37 ]]
			-- upvalues: var1 (ref)
			local var4 = tostring(p4)
			var1(function(p5) --[[ line: 40 ]]
				-- upvalues: var4 (ref)
				local cloned = table.clone(p5)
				cloned[var4] = nil
				
				return cloned
			end)
		end
	}
end