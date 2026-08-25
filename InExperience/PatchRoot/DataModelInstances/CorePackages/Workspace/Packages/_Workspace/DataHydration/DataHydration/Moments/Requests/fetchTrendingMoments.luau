local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpService = game:GetService("HttpService")
local httpModule = require(parent.Http)
local httpClientModule = require(parent.HttpClient)
local _ = require(dataHydration.Moments.MomentsStoreTypes)
local fFlagArgusUseMockFeedItemsModule = require(dataHydration.Moments.FFlagArgusUseMockFeedItems)
local mockTrendingMomentsModule = require(dataHydration.Moments.MockTrendingMoments)
local convertApiMomentsToMomentItemsModule = require(dataHydration.Moments.Util.convertApiMomentsToMomentItems)
local extractReactionsByMomentIdModule = require(dataHydration.Moments.Util.extractReactionsByMomentId)
local extractShareInfoByMomentIdModule = require(dataHydration.Moments.Util.extractShareInfoByMomentId)
local constructApiUrlModule = require(dataHydration.Moments.Util.constructApiUrl)
local var10 = httpClientModule.createMockNetwork({
	fallback = function()
		-- upvalues: httpService (ref)
		return {
			statusCode = 200,
			responseBody = httpService:JSONEncode({})
		}
	end
})

return function(p0, p1, p2, p3)
	-- upvalues: constructApiUrlModule (ref), httpModule (ref), httpService (ref), fFlagArgusUseMockFeedItemsModule (ref), httpClientModule (ref), var10 (ref), mockTrendingMomentsModule (ref), convertApiMomentsToMomentItemsModule (ref), extractReactionsByMomentIdModule (ref), extractShareInfoByMomentIdModule (ref)
	local var11, var12 = constructApiUrlModule("content-captures-api/v2/moments/get-moment-recommendations")
	local var13 = fFlagArgusUseMockFeedItemsModule()
	
	return httpClientModule.fetch({
		method = "GET",
		analyticsKey = "moments.get-moment-recommendations",
		url = `{var11}?{httpModule.Url:makeQueryString({
			momentsSessionId = p0,
			paginationContext = p1,
			signals = if p3 then httpService:JSONEncode(p3) else nil
		})}`,
		headers = var12,
		network = if var13 then var10 else p2,
		decode = function(p4)
			-- upvalues: var13 (ref), mockTrendingMomentsModule (copy), convertApiMomentsToMomentItemsModule (copy), p1 (ref), extractReactionsByMomentIdModule (copy), extractShareInfoByMomentIdModule (copy)
			return if var13 then {
				nextCursor = nil,
				moments = mockTrendingMomentsModule,
				reactionsByMomentId = {},
				shareInfoByMomentId = {}
			} else {
				moments = convertApiMomentsToMomentItemsModule(p4.items),
				nextCursor = p4.paginationContext or p1,
				reactionsByMomentId = extractReactionsByMomentIdModule(p4.items),
				shareInfoByMomentId = extractShareInfoByMomentIdModule(p4.items)
			}
		end
	})
end