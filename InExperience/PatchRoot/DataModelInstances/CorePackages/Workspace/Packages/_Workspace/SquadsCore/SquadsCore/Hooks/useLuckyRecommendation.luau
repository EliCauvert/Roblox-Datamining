local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local getLuckyRecommendationStoreModule = require(squadsCore.Stores.GetLuckyRecommendationStore)

return function()
	-- upvalues: getLuckyRecommendationStoreModule (ref), reactModule (ref), signalsModule (ref)
	local var1 = getLuckyRecommendationStoreModule(false)
	local var2, var3 = reactModule.useState(function()
		-- upvalues: var1 (ref)
		return var1.getState(false)
	end)
	reactModule.useLayoutEffect(function()
		-- upvalues: signalsModule (copy), var3 (ref), var1 (ref)
		return signalsModule.createEffect(function(p1)
			-- upvalues: var3 (copy), var1 (copy)
			var3(var1.getState(p1))
		end)
	end, { var1.getState })
	
	return {
		state = var2,
		actions = reactModule.useMemo(function()
			-- upvalues: var1 (ref)
			return {
				startRoll = var1.startRoll,
				endRoll = var1.endRoll,
				cancelFetch = var1.cancelFetch
			}
		end, { var1.startRoll, var1.endRoll, var1.cancelFetch })
	}
end