local CreateSignalFunction = require(script:FindFirstAncestor("ExpChat").Parent.Signals).createSignal

return function() --[[ Line: 19 | Named "createCharacterStore" ]]
	-- upvalues: CreateSignalFunction (copy)
	local Signal, Signal2 = CreateSignalFunction({})
	
	local function _(p1): string --[[ Line: 23 | Named "getKey" ]]
		return (tostring(p1))
	end
	
	return {
		getCharacters = Signal,
		handleCharacterAdded = function(p1, p2) --[[ Line: 27 ]]
			-- upvalues: Signal2 (copy)
			local Text = tostring(p1)
			Signal2(function(Tbl) --[[ Line: 30 ]]
				-- upvalues: Text (copy), p2 (copy)
				local Copy = table.clone(Tbl)
				Copy[Text] = p2
				
				return Copy
			end)
		end,
		handlePlayerRemoved = function(p1) --[[ Line: 37 ]]
			-- upvalues: Signal2 (copy)
			local Text = tostring(p1)
			Signal2(function(Tbl) --[[ Line: 40 ]]
				-- upvalues: Text (copy)
				local Copy = table.clone(Tbl)
				Copy[Text] = nil
				
				return Copy
			end)
		end
	}
end