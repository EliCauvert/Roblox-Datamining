local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local getScheduledSquadsStoreModule = require(squadsCore.Stores.GetScheduledSquadsStore)
local _ = require(squadsCore.Types)

return function(p1)
	-- upvalues: getScheduledSquadsStoreModule (ref), reactModule (ref), signalsModule (ref)
	local var1 = getScheduledSquadsStoreModule(false)
	local var2 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var1 (ref), p1 (ref)
		return signalsModule.createComputed(function(p2)
			-- upvalues: var1 (copy), p1 (copy)
			return var1.getScheduledSquadsStatus(p2)[p1]
		end)
	end, { var1, p1 })
	local var3, var4 = reactModule.useState(function()
		-- upvalues: var2 (ref)
		return var2(false)
	end)
	reactModule.useLayoutEffect(function()
		-- upvalues: var4 (ref), var2 (ref), signalsModule (copy)
		var4(var2(false))
		
		return signalsModule.createEffect(function(p2)
			-- upvalues: var4 (copy), var2 (copy)
			var4(var2(p2))
		end)
	end, { var2 })
	
	return var3
end