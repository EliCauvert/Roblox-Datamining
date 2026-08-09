local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpModule = require(parent.Http)
local httpClientModule = require(parent.HttpClient)
local _ = require(dataHydration.Moments.MomentsStoreTypes)
local convertApiMomentsToMomentItemsModule = require(dataHydration.Moments.Util.convertApiMomentsToMomentItems)
local extractReactionsByMomentIdModule = require(dataHydration.Moments.Util.extractReactionsByMomentId)
local extractShareInfoByMomentIdModule = require(dataHydration.Moments.Util.extractShareInfoByMomentId)
local constructApiUrlModule = require(dataHydration.Moments.Util.constructApiUrl)

return function(p0, p1) --[[ line: 25 | named "fetchMomentsByIds" ]]
	-- upvalues: constructApiUrlModule (ref), httpModule (ref), httpClientModule (ref), convertApiMomentsToMomentItemsModule (ref), extractReactionsByMomentIdModule (ref), extractShareInfoByMomentIdModule (ref)
	local var7, var8 = constructApiUrlModule("content-captures-api/v2/moments/get-moments")
	
	return httpClientModule.fetch({
		method = "GET",
		analyticsKey = "moments.get-moments",
		url = `{var7}?{httpModule.Url:makeQueryString({ Ids = table.concat(p0, ",") })}`,
		headers = var8,
		network = p1,
		decode = function(p2) --[[ line: 38 ]]
			-- upvalues: convertApiMomentsToMomentItemsModule (copy), extractReactionsByMomentIdModule (copy), extractShareInfoByMomentIdModule (copy)
			return {
				moments = convertApiMomentsToMomentItemsModule(p2.items),
				reactionsByMomentId = extractReactionsByMomentIdModule(p2.items),
				shareInfoByMomentId = extractShareInfoByMomentIdModule(p2.items)
			}
		end
	})
end