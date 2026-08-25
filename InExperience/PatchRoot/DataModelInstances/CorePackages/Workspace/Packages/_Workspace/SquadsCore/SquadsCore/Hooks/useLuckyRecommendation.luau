local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local getLuckyRecommendationStoreModule = require(squadsCore.Stores.GetLuckyRecommendationStore)

return function()
	-- upvalues: getLuckyRecommendationStoreModule (ref), reactModule (ref), signalsModule (ref)
	local var4 = getLuckyRecommendationStoreModule(false)
	local var5, var6 = reactModule.useState(function()
		-- upvalues: var4 (ref)
		return var4.getState(false)
	end)
	reactModule.useLayoutEffect(function()
		-- upvalues: signalsModule (copy), var6 (ref), var4 (ref)
		return signalsModule.createEffect(function(p0)
			-- upvalues: var6 (copy), var4 (copy)
			var6(var4.getState(p0))
		end)
	end, { var4.getState })
	
	return {
		state = var5,
		actions = reactModule.useMemo(function()
			-- upvalues: var4 (ref)
			return {
				startRoll = var4.startRoll,
				endRoll = var4.endRoll,
				cancelFetch = var4.cancelFetch
			}
		end, { var4.startRoll, var4.endRoll, var4.cancelFetch })
	}
end