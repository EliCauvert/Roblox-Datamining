local SquadsCore = script:FindFirstAncestor("SquadsCore")
local Parent = SquadsCore.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local GetLuckyRecommendationStoreModule = require(SquadsCore.Stores.GetLuckyRecommendationStore)

return function()
	-- upvalues: GetLuckyRecommendationStoreModule (copy), ReactModule (copy), SignalsModule (copy)
	local LuckyRecommendationStoreModule = GetLuckyRecommendationStoreModule(false)
	local UseStateResult, UseStateResult2 = ReactModule.useState(function()
		-- upvalues: LuckyRecommendationStoreModule (copy)
		return LuckyRecommendationStoreModule.getState(false)
	end)
	ReactModule.useLayoutEffect(function()
		-- upvalues: SignalsModule (upval), UseStateResult2 (copy), LuckyRecommendationStoreModule (copy)
		return SignalsModule.createEffect(function(p1)
			-- upvalues: UseStateResult2 (upval), LuckyRecommendationStoreModule (upval)
			UseStateResult2(LuckyRecommendationStoreModule.getState(p1))
		end)
	end, { LuckyRecommendationStoreModule.getState })
	
	return {
		state = UseStateResult,
		actions = ReactModule.useMemo(function()
			-- upvalues: LuckyRecommendationStoreModule (copy)
			return {
				startRoll = LuckyRecommendationStoreModule.startRoll,
				endRoll = LuckyRecommendationStoreModule.endRoll,
				cancelFetch = LuckyRecommendationStoreModule.cancelFetch
			}
		end, {
			LuckyRecommendationStoreModule.startRoll,
			LuckyRecommendationStoreModule.endRoll,
			LuckyRecommendationStoreModule.cancelFetch
		})
	}
end