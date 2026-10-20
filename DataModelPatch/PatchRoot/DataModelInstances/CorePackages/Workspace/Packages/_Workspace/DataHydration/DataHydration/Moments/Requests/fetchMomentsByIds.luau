local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpModule = require(Parent.Http)
local HttpClientModule = require(Parent.HttpClient)
local _ = require(DataHydration.Moments.MomentsStoreTypes)
local ConvertApiMomentsToMomentItemsModule = require(DataHydration.Moments.Util.convertApiMomentsToMomentItems)
local ExtractReactionsByMomentIdModule = require(DataHydration.Moments.Util.extractReactionsByMomentId)
local ExtractShareInfoByMomentIdModule = require(DataHydration.Moments.Util.extractShareInfoByMomentId)
local ConstructApiUrlModule = require(DataHydration.Moments.Util.constructApiUrl)

return function(List, Network)
	-- upvalues: ConstructApiUrlModule (copy), HttpModule (copy), HttpClientModule (copy), ConvertApiMomentsToMomentItemsModule (copy), ExtractReactionsByMomentIdModule (copy), ExtractShareInfoByMomentIdModule (copy)
	local GetMoments, GetMoments2 = ConstructApiUrlModule("content-captures-api/v2/moments/get-moments")
	
	return HttpClientModule.fetch({
		method = "GET",
		analyticsKey = "moments.get-moments",
		url = `{GetMoments}?{HttpModule.Url:makeQueryString({ Ids = table.concat(List, ",") })}`,
		headers = GetMoments2,
		network = Network,
		decode = function(p1)
			-- upvalues: ConvertApiMomentsToMomentItemsModule (upval), ExtractReactionsByMomentIdModule (upval), ExtractShareInfoByMomentIdModule (upval)
			return {
				moments = ConvertApiMomentsToMomentItemsModule(p1.items),
				reactionsByMomentId = ExtractReactionsByMomentIdModule(p1.items),
				shareInfoByMomentId = ExtractShareInfoByMomentIdModule(p1.items)
			}
		end
	})
end