local DataHydrationModule = require(script:FindFirstAncestor("HomeStore").Parent.DataHydration)
local _ = require(script.Parent.FriendRecommendationTypes)
local RecommendationTypeModule = require(script.Parent.RecommendationType)

return function() --[[ Line: 16 | Named "createFriendRecommendationsStore" ]]
	-- upvalues: DataHydrationModule (copy), RecommendationTypeModule (copy)
	local DataCache = DataHydrationModule.createDataCache()
	local T = {}
	
	return {
		getFriendRecommendation = function(p1) --[[ Line: 20 ]]
			-- upvalues: DataCache (copy), RecommendationTypeModule (upval)
			local Item = DataCache.getItem(p1)
			
			return {
				data = function(p2) --[[ Line: 23 ]]
					-- upvalues: Item (copy), RecommendationTypeModule (upval)
					local DataResult = Item.data(p2)
					
					return if DataResult and DataResult.recommendationType ~= RecommendationTypeModule.Invalid then DataResult else nil
				end,
				status = Item.status
			}
		end,
		replaceFriendRecommendations = function(List) --[[ Line: 31 ]]
			-- upvalues: T (ref), DataCache (copy), RecommendationTypeModule (upval)
			for i in T do
				if List[i] == nil then
					DataCache.replaceItem(i, { recommendationType = RecommendationTypeModule.Invalid })
				end
			end
			DataCache.replaceItems(List)
			T = {}
			
			for i1 in List do
				T[i1] = true
			end
		end,
		dispose = function() --[[ Line: 48 ]]
			-- upvalues: T (ref), DataCache (copy)
			T = {}
			DataCache.dispose()
		end
	}
end