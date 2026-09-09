local dataHydrationModule = require(script:FindFirstAncestor("HomeStore").Parent.DataHydration)
local _ = require(script.Parent.FriendRecommendationTypes)
local recommendationTypeModule = require(script.Parent.RecommendationType)

return function()
	-- upvalues: dataHydrationModule (ref), recommendationTypeModule (ref)
	local var1 = dataHydrationModule.createDataCache()
	local t = {}
	
	return {
		getFriendRecommendation = function(p1)
			-- upvalues: var1 (ref), recommendationTypeModule (copy)
			local item = var1.getItem(p1)
			
			return {
				data = function(p2)
					-- upvalues: item (ref), recommendationTypeModule (copy)
					local var2 = item.data(p2)
					
					return if var2 and var2.recommendationType ~= recommendationTypeModule.Invalid then var2 else nil
				end,
				status = item.status
			}
		end,
		replaceFriendRecommendations = function(p1)
			-- upvalues: t (write), var1 (ref), recommendationTypeModule (copy)
			for i in t do
				if p1[i] == nil then
					var1.replaceItem(i, { recommendationType = recommendationTypeModule.Invalid })
				end
			end
			var1.replaceItems(p1)
			t = {}
			
			for i_1 in p1 do
				t[i_1] = true
			end
		end,
		dispose = function()
			-- upvalues: t (write), var1 (ref)
			t = {}
			var1.dispose()
		end
	}
end