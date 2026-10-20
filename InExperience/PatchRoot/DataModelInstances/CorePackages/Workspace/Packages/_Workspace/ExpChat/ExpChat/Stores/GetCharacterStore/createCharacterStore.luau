local CreateSignalFunction = require(script:FindFirstAncestor("ExpChat").Parent.Signals).createSignal

return function()
	-- upvalues: CreateSignalFunction (copy)
	local Signal, Signal2 = CreateSignalFunction({})
	
	local function _(p1): string
		return (tostring(p1))
	end
	
	return {
		getCharacters = Signal,
		handleCharacterAdded = function(p1, p2)
			-- upvalues: Signal2 (copy)
			local Text = tostring(p1)
			Signal2(function(Tbl)
				-- upvalues: Text (copy), p2 (copy)
				local Copy = table.clone(Tbl)
				Copy[Text] = p2
				
				return Copy
			end)
		end,
		handlePlayerRemoved = function(p1)
			-- upvalues: Signal2 (copy)
			local Text = tostring(p1)
			Signal2(function(Tbl)
				-- upvalues: Text (copy)
				local Copy = table.clone(Tbl)
				Copy[Text] = nil
				
				return Copy
			end)
		end
	}
end