local signalsModule = require(script:FindFirstAncestor("DataHydration").Parent.Signals)
local _ = require(script.Parent.PrivatePlaytestersStoreTypes)

return function()
	-- upvalues: signalsModule (ref)
	local t = {}
	
	return {
		getFor = function(p0)
			-- upvalues: t (ref), signalsModule (copy)
			local var2 = t[p0]
			
			if var2 == nil then
				local var3 = signalsModule.createComputed(function(p1)
					-- upvalues: p0 (ref)
					return p0(p1) or {}
				end)
				t[p0] = var3
				
				return var3
			end
			return var2
		end,
		clear = function()
			-- upvalues: t (ref)
			table.clear(t)
		end
	}
end