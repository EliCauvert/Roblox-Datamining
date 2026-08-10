local signalsModule = require(script:FindFirstAncestor("DataHydration").Parent.Signals)
local _ = require(script.Parent.PrivatePlaytestersStoreTypes)

return function() --[[ line: 26 | named "createPlayersGetterCache" ]]
	-- upvalues: signalsModule (ref)
	local t = {}
	
	return {
		getFor = function(p0) --[[ line: 29 ]]
			-- upvalues: t (ref), signalsModule (copy)
			local var2 = t[p0]
			
			if var2 == nil then
				local var3 = signalsModule.createComputed(function(p1) --[[ line: 34 ]]
					-- upvalues: p0 (ref)
					return p0(p1) or {}
				end)
				t[p0] = var3
				
				return var3
			end
			return var2
		end,
		clear = function() --[[ line: 41 ]]
			-- upvalues: t (ref)
			table.clear(t)
		end
	}
end