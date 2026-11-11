local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpService = game:GetService("HttpService")
local HttpModule = require(Parent.Http)
local HttpClientModule = require(Parent.HttpClient)
local _ = require(DataHydration.Moments.MomentsStoreTypes)
local FFlagArgusUseMockFeedItemsModule = require(DataHydration.Moments.FFlagArgusUseMockFeedItems)
local MockTrendingMomentsModule = require(DataHydration.Moments.MockTrendingMoments)
local ConvertApiMomentsToMomentItemsModule = require(DataHydration.Moments.Util.convertApiMomentsToMomentItems)
local ExtractReactionsByMomentIdModule = require(DataHydration.Moments.Util.extractReactionsByMomentId)
local ExtractShareInfoByMomentIdModule = require(DataHydration.Moments.Util.extractShareInfoByMomentId)
local ConstructApiUrlModule = require(DataHydration.Moments.Util.constructApiUrl)
local MockNetwork = HttpClientModule.createMockNetwork({
	fallback = function()
		-- upvalues: HttpService (copy)
		return {
			statusCode = 200,
			responseBody = HttpService:JSONEncode({})
		}
	end
})

return function(MomentsSessionId, PaginationContext, p1, Input)
	-- upvalues: ConstructApiUrlModule (copy), HttpModule (copy), HttpService (copy), FFlagArgusUseMockFeedItemsModule (copy), HttpClientModule (copy), MockNetwork (copy), MockTrendingMomentsModule (copy), ConvertApiMomentsToMomentItemsModule (copy), ExtractReactionsByMomentIdModule (copy), ExtractShareInfoByMomentIdModule (copy)
	local GetMomentRecommendations, GetMomentRecommendations2 = ConstructApiUrlModule("content-captures-api/v2/moments/get-moment-recommendations")
	local Text: string = `{GetMomentRecommendations}?{HttpModule.Url:makeQueryString({
		momentsSessionId = MomentsSessionId,
		paginationContext = PaginationContext,
		signals = if Input then HttpService:JSONEncode(Input) else nil
	})}`
	local FFlagArgusUseMockFeedItemsModuleResult = FFlagArgusUseMockFeedItemsModule()
	
	return HttpClientModule.fetch({
		method = "GET",
		analyticsKey = "moments.get-moment-recommendations",
		url = Text,
		headers = GetMomentRecommendations2,
		network = if FFlagArgusUseMockFeedItemsModuleResult then MockNetwork else p1,
		decode = function(p2)
			-- upvalues: FFlagArgusUseMockFeedItemsModuleResult (copy), MockTrendingMomentsModule (upval), ConvertApiMomentsToMomentItemsModule (upval), PaginationContext (copy), ExtractReactionsByMomentIdModule (upval), ExtractShareInfoByMomentIdModule (upval)
			return if FFlagArgusUseMockFeedItemsModuleResult then {
				nextCursor = nil,
				moments = MockTrendingMomentsModule,
				reactionsByMomentId = {},
				shareInfoByMomentId = {}
			} else {
				moments = ConvertApiMomentsToMomentItemsModule(p2.items),
				nextCursor = p2.paginationContext or PaginationContext,
				reactionsByMomentId = ExtractReactionsByMomentIdModule(p2.items),
				shareInfoByMomentId = ExtractShareInfoByMomentIdModule(p2.items)
			}
		end
	})
end