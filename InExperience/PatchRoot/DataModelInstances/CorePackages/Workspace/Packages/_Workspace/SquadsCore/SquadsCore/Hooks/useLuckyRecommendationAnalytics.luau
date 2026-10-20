local SquadsCore = script:FindFirstAncestor("SquadsCore")
local Parent = SquadsCore.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local SquadExternalContractContextModule = require(SquadsCore.Components.SquadExternalContractProvider.SquadExternalContractContext)
local GetLuckyRecommendationStoreModule = require(SquadsCore.Stores.GetLuckyRecommendationStore)

return function(LuckyRecommendationSessionId)
	-- upvalues: GetLuckyRecommendationStoreModule (copy), ReactModule (copy), SquadExternalContractContextModule (copy), UseLocalUserIdFunction (copy), CryoModule (copy)
	local LuckyRecommendationStoreModule = GetLuckyRecommendationStoreModule(false)
	local UseContextResult = ReactModule.useContext(SquadExternalContractContextModule)
	local Number: number = tonumber(UseLocalUserIdFunction()) or 0
	
	return (ReactModule.useMemo(function()
		-- upvalues: LuckyRecommendationStoreModule (copy), LuckyRecommendationSessionId (copy), Number (copy), CryoModule (upval), UseContextResult (copy)
		return {
			fire = function(p1, p2)
				-- upvalues: LuckyRecommendationStoreModule (upval), LuckyRecommendationSessionId (upval), Number (upval), CryoModule (upval), UseContextResult (upval)
				local AnalyticsContext = LuckyRecommendationStoreModule.getAnalyticsContext()
				local JoinResult = {
					luckyRecommendationSessionId = LuckyRecommendationSessionId,
					localUserId = Number,
					pickRequestId = AnalyticsContext.pickRequestId,
					revealType = AnalyticsContext.revealType,
					clientTimestamp = os.time()
				}
				
				if p2 then
					JoinResult = CryoModule.Dictionary.join(JoinResult, p2)
				end
				UseContextResult.fireSquadAnalytics(p1, JoinResult)
			end,
			getContext = function()
				-- upvalues: LuckyRecommendationStoreModule (upval)
				return LuckyRecommendationStoreModule.getAnalyticsContext()
			end
		}
	end, {
		LuckyRecommendationSessionId,
		Number,
		LuckyRecommendationStoreModule.getAnalyticsContext,
		UseContextResult.fireSquadAnalytics
	}))
end