local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local squadExternalContractContextModule = require(squadsCore.Components.SquadExternalContractProvider.SquadExternalContractContext)
local getLuckyRecommendationStoreModule = require(squadsCore.Stores.GetLuckyRecommendationStore)

return function(p1)
	-- upvalues: getLuckyRecommendationStoreModule (ref), reactModule (ref), squadExternalContractContextModule (ref), useLocalUserId (ref), cryoModule (ref)
	local var1 = getLuckyRecommendationStoreModule(false)
	local var2 = reactModule.useContext(squadExternalContractContextModule)
	local var3 = tonumber(useLocalUserId()) or 0
	
	return reactModule.useMemo(function()
		-- upvalues: var1 (ref), p1 (ref), var3 (ref), cryoModule (copy), var2 (ref)
		return {
			fire = function(p2, p3)
				-- upvalues: var1 (copy), p1 (copy), var3 (copy), cryoModule (copy), var2 (copy)
				local analyticsContext = var1.getAnalyticsContext()
				local t = {
					luckyRecommendationSessionId = p1,
					localUserId = var3,
					pickRequestId = analyticsContext.pickRequestId,
					revealType = analyticsContext.revealType,
					clientTimestamp = os.time()
				}
				
				if p3 then
					t = cryoModule.Dictionary.join(t, p3)
				end
				var2.fireSquadAnalytics(p2, t)
			end,
			getContext = function()
				-- upvalues: var1 (copy)
				return var1.getAnalyticsContext()
			end
		}
	end, {
		p1,
		var3,
		var1.getAnalyticsContext,
		var2.fireSquadAnalytics
	})
end