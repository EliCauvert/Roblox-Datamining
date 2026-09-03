local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpService = game:GetService("HttpService")
local httpModule = require(parent.Http)
local httpClientModule = require(parent.HttpClient)
local sharedFlagsModule = require(parent.SharedFlags)
local _ = require(dataHydration.Moments.MomentsStoreTypes)
local fFlagArgusUseMockFeedItemsModule = require(dataHydration.Moments.FFlagArgusUseMockFeedItems)
local mockTrendingMomentsModule = require(dataHydration.Moments.MockTrendingMoments)
local convertApiMomentsToMomentItemsModule = require(dataHydration.Moments.Util.convertApiMomentsToMomentItems)
local extractCommentsByFeedItemIdModule = require(dataHydration.Moments.Util.extractCommentsByFeedItemId)
local extractReactionsByMomentIdModule = require(dataHydration.Moments.Util.extractReactionsByMomentId)
local extractShareInfoByMomentIdModule = require(dataHydration.Moments.Util.extractShareInfoByMomentId)
local constructApiUrlModule = require(dataHydration.Moments.Util.constructApiUrl)
local fFlagMomentsComments = sharedFlagsModule.FFlagMomentsComments
local var1 = httpClientModule.createMockNetwork({
	fallback = function()
		-- upvalues: httpService (ref)
		return {
			statusCode = 200,
			responseBody = httpService:JSONEncode({})
		}
	end
})

return function(p1, p2, p3, p4)
	-- upvalues: constructApiUrlModule (ref), httpModule (ref), httpService (ref), fFlagArgusUseMockFeedItemsModule (ref), httpClientModule (ref), var1 (ref), mockTrendingMomentsModule (ref), fFlagMomentsComments (ref), convertApiMomentsToMomentItemsModule (ref), extractReactionsByMomentIdModule (ref), extractShareInfoByMomentIdModule (ref), extractCommentsByFeedItemIdModule (ref)
	local var2, var3 = constructApiUrlModule("content-captures-api/v2/moments/get-moment-recommendations")
	local var4 = fFlagArgusUseMockFeedItemsModule()
	
	return httpClientModule.fetch({
		method = "GET",
		analyticsKey = "moments.get-moment-recommendations",
		url = `{var2}?{httpModule.Url:makeQueryString({
			momentsSessionId = p1,
			paginationContext = p2,
			signals = if p4 then httpService:JSONEncode(p4) else nil
		})}`,
		headers = var3,
		network = if var4 then var1 else p3,
		decode = function(p5)
			-- upvalues: var4 (ref), mockTrendingMomentsModule (copy), fFlagMomentsComments (copy), convertApiMomentsToMomentItemsModule (copy), p2 (ref), extractReactionsByMomentIdModule (copy), extractShareInfoByMomentIdModule (copy), extractCommentsByFeedItemIdModule (copy)
			return if var4 then {
				nextCursor = nil,
				moments = mockTrendingMomentsModule,
				reactionsByMomentId = {},
				shareInfoByMomentId = {},
				commentsByFeedItemId = if fFlagMomentsComments then {} else nil
			} else {
				moments = convertApiMomentsToMomentItemsModule(p5.items),
				nextCursor = p5.paginationContext or p2,
				reactionsByMomentId = extractReactionsByMomentIdModule(p5.items),
				shareInfoByMomentId = extractShareInfoByMomentIdModule(p5.items),
				commentsByFeedItemId = if fFlagMomentsComments then extractCommentsByFeedItemIdModule(p5.items) else nil
			}
		end
	})
end