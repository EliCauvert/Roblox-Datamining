local DataHydration = script:FindFirstAncestor("DataHydration")
local CreateDataCacheModule = require(DataHydration.createDataCache)
local _ = require(DataHydration.DataHydrationTypes)
local _ = require(script.Parent.SduiFriendRecommendationTypes)
local SduiRecommendationTypeModule = require(script.Parent.SduiRecommendationType)

return function()
	-- upvalues: CreateDataCacheModule (copy), SduiRecommendationTypeModule (copy)
	local DataCacheModule = CreateDataCacheModule()
	local T = {}
	
	return {
		getFriendRecommendation = function(p1)
			-- upvalues: DataCacheModule (copy), SduiRecommendationTypeModule (upval)
			local Item = DataCacheModule.getItem(p1)
			
			return {
				data = function(p2)
					-- upvalues: Item (copy), SduiRecommendationTypeModule (upval)
					local DataResult = Item.data(p2)
					
					return if DataResult and DataResult.recommendationType ~= SduiRecommendationTypeModule.Invalid then DataResult else nil
				end,
				status = Item.status
			}
		end,
		replaceFriendRecommendations = function(List)
			-- upvalues: T (ref), DataCacheModule (copy), SduiRecommendationTypeModule (upval)
			for i in T do
				if List[i] == nil then
					DataCacheModule.replaceItem(i, {
						recommendationType = SduiRecommendationTypeModule.Invalid
					})
				end
			end
			DataCacheModule.replaceItems(List)
			T = {}
			
			for i1 in List do
				T[i1] = true
			end
		end,
		dispose = function()
			-- upvalues: T (ref), DataCacheModule (copy)
			T = {}
			DataCacheModule.dispose()
		end
	}
end