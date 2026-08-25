local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local getScheduledSquadsStoreModule = require(squadsCore.Stores.GetScheduledSquadsStore)
local _ = require(squadsCore.Types)

return function(p0)
	-- upvalues: getScheduledSquadsStoreModule (ref), reactModule (ref), signalsModule (ref)
	local var4 = getScheduledSquadsStoreModule(false)
	local var5 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var4 (ref), p0 (ref)
		return signalsModule.createComputed(function(p1)
			-- upvalues: var4 (copy), p0 (copy)
			return var4.getScheduledSquadsStatus(p1)[p0]
		end)
	end, { var4, p0 })
	local var6, var7 = reactModule.useState(function()
		-- upvalues: var5 (ref)
		return var5(false)
	end)
	reactModule.useLayoutEffect(function()
		-- upvalues: var7 (ref), var5 (ref), signalsModule (copy)
		var7(var5(false))
		
		return signalsModule.createEffect(function(p2)
			-- upvalues: var7 (copy), var5 (copy)
			var7(var5(p2))
		end)
	end, { var5 })
	
	return var6
end