local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpModule = require(parent.Http)
local httpClientModule = require(parent.HttpClient)
local _ = require(dataHydration.Moments.MomentsStoreTypes)
local convertApiMomentsToMomentItemsModule = require(dataHydration.Moments.Util.convertApiMomentsToMomentItems)
local extractReactionsByMomentIdModule = require(dataHydration.Moments.Util.extractReactionsByMomentId)
local extractShareInfoByMomentIdModule = require(dataHydration.Moments.Util.extractShareInfoByMomentId)
local constructApiUrlModule = require(dataHydration.Moments.Util.constructApiUrl)
local fFlagProfileMomentsOrderingAndReactions = require(parent.SharedFlags).FFlagProfileMomentsOrderingAndReactions

return function(p0, p1, p2) --[[ line: 22 | named "fetchUserMoments" ]]
	-- upvalues: constructApiUrlModule (ref), httpModule (ref), httpClientModule (ref), convertApiMomentsToMomentItemsModule (ref), fFlagProfileMomentsOrderingAndReactions (ref), extractReactionsByMomentIdModule (ref), extractShareInfoByMomentIdModule (ref)
	local var7, var8 = constructApiUrlModule("content-captures-api/v2/moments/get-users-moments")
	
	return httpClientModule.fetch({
		method = "GET",
		analyticsKey = "moments.get-users-moments",
		url = `{var7}?{httpModule.Url:makeQueryString({ count = 18, targetUserId = p0, paginationContext = p1 })}`,
		headers = var8,
		network = p2,
		decode = function(p3) --[[ line: 41 ]]
			-- upvalues: convertApiMomentsToMomentItemsModule (copy), p1 (ref), fFlagProfileMomentsOrderingAndReactions (copy), extractReactionsByMomentIdModule (copy), extractShareInfoByMomentIdModule (copy)
			local items = p3.items
			
			return {
				moments = convertApiMomentsToMomentItemsModule(items),
				nextCursor = if items ~= nil and #items >= 18 then p3.paginationContext or p1 else nil,
				reactionsByMomentId = if fFlagProfileMomentsOrderingAndReactions then extractReactionsByMomentIdModule(items) else nil,
				shareInfoByMomentId = if fFlagProfileMomentsOrderingAndReactions then extractShareInfoByMomentIdModule(items) else nil
			}
		end
	})
end