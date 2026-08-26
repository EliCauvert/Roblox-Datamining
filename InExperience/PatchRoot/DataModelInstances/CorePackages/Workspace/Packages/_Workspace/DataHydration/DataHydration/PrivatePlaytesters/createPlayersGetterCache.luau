local signalsModule = require(script:FindFirstAncestor("DataHydration").Parent.Signals)
local _ = require(script.Parent.PrivatePlaytestersStoreTypes)

return function()
	-- upvalues: signalsModule (ref)
	local t = {}
	
	return {
		getFor = function(p1)
			-- upvalues: t (ref), signalsModule (copy)
			local var1 = t[p1]
			
			if var1 == nil then
				local var2 = signalsModule.createComputed(function(p2)
					-- upvalues: p1 (ref)
					return p1(p2) or {}
				end)
				t[p1] = var2
				
				return var2
			end
			return var1
		end,
		clear = function()
			-- upvalues: t (ref)
			table.clear(t)
		end
	}
end