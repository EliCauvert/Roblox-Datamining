local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpModule = require(Parent.Http)
local HttpClientModule = require(Parent.HttpClient)
local _ = require(DataHydration.Moments.MomentsStoreTypes)
local ConvertApiMomentsToMomentItemsModule = require(DataHydration.Moments.Util.convertApiMomentsToMomentItems)
local ExtractReactionsByMomentIdModule = require(DataHydration.Moments.Util.extractReactionsByMomentId)
local ExtractShareInfoByMomentIdModule = require(DataHydration.Moments.Util.extractShareInfoByMomentId)
local ConstructApiUrlModule = require(DataHydration.Moments.Util.constructApiUrl)
local FFlagProfileMomentsOrderingAndReactions = require(Parent.SharedFlags).FFlagProfileMomentsOrderingAndReactions

return function(TargetUserId, PaginationContext, Network)
	-- upvalues: ConstructApiUrlModule (copy), HttpModule (copy), HttpClientModule (copy), ConvertApiMomentsToMomentItemsModule (copy), FFlagProfileMomentsOrderingAndReactions (copy), ExtractReactionsByMomentIdModule (copy), ExtractShareInfoByMomentIdModule (copy)
	local GetUsersMoments, GetUsersMoments2 = ConstructApiUrlModule("content-captures-api/v2/moments/get-users-moments")
	
	return HttpClientModule.fetch({
		method = "GET",
		analyticsKey = "moments.get-users-moments",
		url = `{GetUsersMoments}?{HttpModule.Url:makeQueryString({
			count = 18,
			targetUserId = TargetUserId,
			paginationContext = PaginationContext
		})}`,
		headers = GetUsersMoments2,
		network = Network,
		decode = function(p1)
			-- upvalues: ConvertApiMomentsToMomentItemsModule (upval), PaginationContext (copy), FFlagProfileMomentsOrderingAndReactions (upval), ExtractReactionsByMomentIdModule (upval), ExtractShareInfoByMomentIdModule (upval)
			local Items = p1.items
			local v1: boolean = Items ~= nil and #Items >= 18
			
			return {
				moments = ConvertApiMomentsToMomentItemsModule(Items),
				nextCursor = if v1 then p1.paginationContext or PaginationContext else nil,
				reactionsByMomentId = if FFlagProfileMomentsOrderingAndReactions then ExtractReactionsByMomentIdModule(Items) else nil,
				shareInfoByMomentId = if FFlagProfileMomentsOrderingAndReactions then ExtractShareInfoByMomentIdModule(Items) else nil
			}
		end
	})
end