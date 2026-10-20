local SignalsModule = require(script:FindFirstAncestor("DataHydration").Parent.Signals)
local _ = require(script.Parent.PrivatePlaytestersStoreTypes)

return function()
	-- upvalues: SignalsModule (copy)
	local Tbl = {}
	
	return {
		getFor = function(Callback)
			-- upvalues: Tbl (copy), SignalsModule (upval)
			local Entry = Tbl[Callback]
			
			if Entry == nil then
				local Computed = SignalsModule.createComputed(function(p1)
					-- upvalues: Callback (copy)
					return Callback(p1) or {}
				end)
				Tbl[Callback] = Computed
				
				return Computed
			else
				return Entry
			end
		end,
		clear = function()
			-- upvalues: Tbl (copy)
			table.clear(Tbl)
		end
	}
end