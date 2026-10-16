local SignalsModule = require(script:FindFirstAncestor("DataHydration").Parent.Signals)
local _ = require(script.Parent.PrivatePlaytestersStoreTypes)

return function() --[[ Line: 26 | Named "createPlayersGetterCache" ]]
	-- upvalues: SignalsModule (copy)
	local Tbl = {}
	
	return {
		getFor = function(Callback) --[[ Line: 29 ]]
			-- upvalues: Tbl (copy), SignalsModule (upval)
			local Entry = Tbl[Callback]
			
			if Entry == nil then
				local Computed = SignalsModule.createComputed(function(p1) --[[ Line: 34 ]]
					-- upvalues: Callback (copy)
					return Callback(p1) or {}
				end)
				Tbl[Callback] = Computed
				
				return Computed
			else
				return Entry
			end
		end,
		clear = function() --[[ Line: 41 ]]
			-- upvalues: Tbl (copy)
			table.clear(Tbl)
		end
	}
end