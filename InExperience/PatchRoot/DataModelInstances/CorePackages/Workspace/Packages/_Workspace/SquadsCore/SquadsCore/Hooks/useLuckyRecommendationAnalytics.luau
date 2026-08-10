local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local squadExternalContractContextModule = require(squadsCore.Components.SquadExternalContractProvider.SquadExternalContractContext)
local getLuckyRecommendationStoreModule = require(squadsCore.Stores.GetLuckyRecommendationStore)

return function(p0) --[[ line: 12 | named "useLuckyRecommendationAnalytics" ]]
	-- upvalues: getLuckyRecommendationStoreModule (ref), reactModule (ref), squadExternalContractContextModule (ref), useLocalUserId (ref), cryoModule (ref)
	local var5 = getLuckyRecommendationStoreModule(false)
	local var6 = reactModule.useContext(squadExternalContractContextModule)
	local var7 = tonumber(useLocalUserId()) or 0
	
	return reactModule.useMemo(function() --[[ line: 18 ]]
		-- upvalues: var5 (ref), p0 (ref), var7 (ref), cryoModule (copy), var6 (ref)
		return {
			fire = function(p1, p2) --[[ line: 20 ]]
				-- upvalues: var5 (copy), p0 (copy), var7 (copy), cryoModule (copy), var6 (copy)
				local analyticsContext = var5.getAnalyticsContext()
				local t = {
					luckyRecommendationSessionId = p0,
					localUserId = var7,
					pickRequestId = analyticsContext.pickRequestId,
					revealType = analyticsContext.revealType,
					clientTimestamp = os.time()
				}
				
				if p2 then
					t = cryoModule.Dictionary.join(t, p2)
				end
				var6.fireSquadAnalytics(p1, t)
			end,
			getContext = function() --[[ line: 34 ]]
				-- upvalues: var5 (copy)
				return var5.getAnalyticsContext()
			end
		}
	end, {
		p0,
		var7,
		var5.getAnalyticsContext,
		var6.fireSquadAnalytics
	})
end